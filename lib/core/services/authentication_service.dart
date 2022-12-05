import 'dart:async';
import 'package:interview_test/core/model/auth-payload.dart';
import 'package:interview_test/core/services/storage_service.dart';
import '../model/api_model.dart';
import '../service-injector/service_injector.dart';

class AuthenticationService {
  StorageService? storageService;
  AuthenticationService({this.storageService});

  Future<ApiResponse<AuthPayload>> login(Map<String, dynamic> body) {
    return si.apiService.postApi(
      'login',
      body,
      transform: (dynamic res) {
        return AuthPayload.fromJson(res);
      },
    );
  }
}
