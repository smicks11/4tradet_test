// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:interview_test/core/model/auth-payload.dart';
import '../../../core/base/base_vm.dart';
import '../../../core/model/api_model.dart';
import '../../../core/navigation/routes.dart';
import '../../../core/service-injector/service_injector.dart';
import '../../../core/services/authentication_service.dart';
import '../../../core/validator/validators.dart';
import '../../../shared/snackbar.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class AuthViewModel extends BaseViewModel {
  final AuthenticationService? authenticationService;

  AuthViewModel({this.authenticationService});

  AuthPayload? _loginPayLoad;
  AuthPayload? get loginPayLoad => _loginPayLoad;

  final loginFormKey = GlobalKey<FormState>();
  final signUpFormKey = GlobalKey<FormState>();
  @override
  FutureOr<void> init() {}
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  String? message;

  String initialCountry = 'NG';
  PhoneNumber number = PhoneNumber(isoCode: 'NG');

  bool passVisible = true;
  bool initialCheckBoxState = false;

  switchCheckBoxState(bool value) {
    initialCheckBoxState = value;
    notifyListeners();
  }

  String emailValidator(String? str) {
    if (str!.isEmpty) return 'This field can not be empty';
    if (!FormUtils.isValidEmail(str)) return 'Invalid email address';
    if (str.length < 11)
      return 'Email provided isn\'t valid.Try another email address 🥲';

    return '';
  }

  String phoneNumberValidator(String str) {
    if (str.isEmpty) return 'This field cannot be empty';
    if (!FormUtils.isValidPhoneNumber(str))
      return 'Phone number must be 11 digits 🥲';
    if (str.length < 8) return 'Invalid phone number 🥲';

    return '';
  }

  void togglePassword() {
    passVisible = !passVisible;
    notifyListeners();
  }

  Future<void> loginUser(
      {BuildContext? context}) async {
    Map<String, dynamic> data = {
      "username": emailController.text,
      "password": passwordController.text,
      "deviceIdentifier": "dev-from-mobile",
      "registerAsNewDevice": false,
      "otp": "",
      "channel": "MOBILE"
    };
    setLoadingState(true);
    final ApiResponse<AuthPayload> res =
          await si.authenticationService!.login(data);
      debugPrint('Login response: ${res.status}');
      if (res.status == 200) {
        /// cache user data locally here
        await si.storageService.setItem('access_token', '${res.token}');
        _loginPayLoad = res.data;
        message = res.message;

        Navigator.pushNamed(context!, Routes.pageviewRoute);
        snackBar(
            context: context,
            message: res.message ?? "Login successful",
            isError: false);

        setLoadingState(false);
      } else {
        debugPrint("Login user response: ${res.data}");
        snackBar(context: context!, message: '${res.message}', isError: true);
        setLoadingState(false);
      }
  }
}
