import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../model/api_model.dart';
import '../../service-injector/service_injector.dart';

class ApiService {
  const ApiService();

  dynamic _jsonEncodeDateHandler(dynamic item) {
    if (item is DateTime) {
      return item.toIso8601String();
    }
    return item;
  }

  String httpBody(dynamic body) {
    return jsonEncode(body, toEncodable: _jsonEncodeDateHandler);
  }

  Future<ApiResponse<T>> postApi<T>(
    String url,
    dynamic body, {
    T Function(dynamic)? transform,
    bool skipStatusCheck = false,
    Map<String, String>? customHeaders,
    Map<String, String>? params,
  }) async {
    transform ??= (dynamic r) => r.body as T;

    final ApiResponse<T> apiResponse = ApiResponse<T>();

    try {
      final Uri uri =
          Uri.https('core.development.4traderx.com', '/$url', params);

      debugPrint('URL___ $uri');

      Map<String, String> headers = {
        HttpHeaders.contentTypeHeader: 'application/json',
      };

      final http.Response res =
          await http.post(uri, headers: headers, body: httpBody(body));
      debugPrint('URL_TEST__ $uri');
      debugPrint('body_TEST__ ${httpBody(body)}');

      final dynamic data = json.decode(res.body);
      debugPrint('data_TEST__ $data');
      debugPrint('status code TEST: ' + res.statusCode.toString());

      if (res.statusCode == 200 || res.statusCode == 201) {
        if (data["data"] != null) {
          debugPrint('this is transformed data: ${data['data']}');
          apiResponse.status = res.statusCode;
          apiResponse.message = (data['message'] ?? 'status encountered');
          apiResponse.token = data['token'];
          apiResponse.data = transform(data);
          debugPrint('here is api resonse data ${apiResponse.data}');
        } else {
          apiResponse.status = res.statusCode;
          apiResponse.message = (data['message'] ?? 'status encountered');
          debugPrint('here is api resonse message ${apiResponse.message}');
        }
      } else {
        apiResponse.status = res.statusCode;
        apiResponse.message = (data['message'] ?? 'status encountered');
      }
    } on SocketException catch (e) {
      debugPrint('here is the exception ${e.toString()}');
      apiResponse.status = 401;
      apiResponse.message = (e).toString();
    }

    return apiResponse;
  }
}
