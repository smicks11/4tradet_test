import 'package:flutter/material.dart';
import 'package:interview_test/shared/color_manager.dart';
import 'package:interview_test/shared/spacing.dart';
import 'package:interview_test/shared/styles_manager.dart';
import 'package:interview_test/shared/utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/base/base_view.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/navigation/routes.dart';
import '../../core/service-injector/service_injector.dart';
import '../../core/validator/validators.dart';
import '../../shared/custom_button.dart';
import '../../shared/textfield.dart';
import 'viewmodel/auth_vm.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<AuthViewModel>(
      vmBuilder: (context) =>
          AuthViewModel(authenticationService: si.authenticationService),
      builder: _buildScreen,
    );
  }

  Widget _buildScreen(BuildContext context, AuthViewModel model) {
    return Scaffold(
      body: SizedBox(
        height: deviceHeight(context),
        width: deviceWidth(context),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Form(
                key: model.loginFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HSpace(40.h),
                    Styles.regular('Welcome Back!', fontSize: 18.sp),
                    HSpace(2.h),
                    Styles.bold('Micheal', fontSize: 19.sp),
                    HSpace(30.h),
                    CustomTextFormField(
                      filled: true,
                      label: "Email",
                      hintText: "Email",
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: model.emailController,
                      validator: EmailValidator.validateEmail,
                      suffix: Padding(
                        padding: EdgeInsets.only(right: 16.0.w),
                        child: GestureDetector(
                            onTap: () {
                              model.emailController.clear();
                            },
                            child: Icon(
                              Icons.clear,
                              size: 17.sp,
                            )),
                      ),
                    ),
                    HSpace(20.h),
                    CustomTextFormField(
                      filled: true,
                      label: "Password",
                      hintText: "Password",
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      obscureText: !model.passVisible,
                      controller: model.passwordController,
                      validator: PasswordValidator.validateLoginPassword,
                      suffixIcon: IconButton(
                          onPressed: () {
                            model.togglePassword();
                          },
                          icon: model.passVisible
                              ? const Icon(Icons.visibility,
                                  color: AppColors.toggleColor)
                              : const Icon(Icons.visibility_off,
                                  color: AppColors.toggleColor)),
                    ),
                    HSpace(5.h),
                    Row(
                      children: [
                        Checkbox(
                          checkColor: AppColors.kPrimaryColor,
                          activeColor: AppColors.inactiveColor,
                          value: model.initialCheckBoxState,
                          onChanged: (value) {
                            model.switchCheckBoxState(value!);
                          },
                        ),
                        // WSpace(8.w),
                        Expanded(child: Styles.regular('Remember Login')),
                        InkWell(
                            onTap: () {},
                            child: Styles.bold('Forgot Password?',
                                fontSize: 14.sp))
                      ],
                    ),
                    HSpace(70.h),
                    CustomButton(
                        width: double.infinity,
                        title: "Log In",
                        isActive: model.emailController.text.isNotEmpty &&
                            model.passwordController.text.isNotEmpty,
                        onPress: model.emailController.text.isNotEmpty &&
                                model.passwordController.text.isNotEmpty
                            ? () async {
                                bool isValid =
                                    model.loginFormKey.currentState!.validate();
                                if (isValid) {
                                  model.loginUser(context: context);
                                }
                              }
                            : null),
                    HSpace(20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Styles.regular("Don’t have an account?",
                            color: AppColors.black, fontSize: 14.sp),
                        WSpace(5.w),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, Routes.loginPhoneFieldRoute);
                          },
                          child: Styles.medium(
                            "Sign Up",
                            color: AppColors.kPrimaryColor,
                            fontSize: 14.sp,
                          ),
                        )
                      ],
                    ),
                    HSpace(60.h),
                    Center(
                        child: Styles.regular('-or log in with-',
                            fontSize: 13.sp)),
                    HSpace(30.h),
                    Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, Routes.loginPhoneFieldRoute);
                        },
                        child: Container(
                          width: deviceWidth(context) * 0.5,
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 14.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: AppColors.kPrimaryColor, width: 0.5)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.phone,
                                color: AppColors.kPrimaryColor,
                                size: 22.sp,
                              ),
                              WSpace(10.w),
                              Styles.medium('Phone Number',
                                  color: AppColors.kPrimaryColor,
                                  fontSize: 14.sp),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
