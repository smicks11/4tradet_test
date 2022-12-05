// ignore_for_file: library_private_types_in_public_api, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:interview_test/shared/color_manager.dart';
import 'package:interview_test/shared/spacing.dart';

class CustomTextFormField extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? suffix;
  final bool? obscureText;
  String? hintText;
  final Widget? icon;
  String? label;
  // final IconData? suffixIcon;
  Color? labelColor;
  final String? Function(String?)? validator;
  // Function(String) onSaved;
  Function()? onSaved;
  Function()? onTap;
  Color? fillingColor;
  bool autofocus;
  bool isEnabled;
  TextInputType? keyboardType;
  int? maxLines;
  TextInputType? textInputType;
  TextEditingController? controller;
  List<TextInputFormatter>? inputFormatters;
  String? labelText;
  bool? filled;
  AutovalidateMode? autovalidateMode;

  CustomTextFormField(
      {Key? key,
      this.textInputType,
      this.prefixIcon,
      this.suffixIcon,
      this.autovalidateMode,

      // this.maxLines,
      this.label = '',
      this.icon,
      this.labelColor,
      this.fillingColor,
      this.hintText = '',
      this.obscureText,
      this.controller,
      this.validator,
      this.onSaved,
      this.onTap,
      this.autofocus = false,
      this.isEnabled = true,
      this.keyboardType,
      this.inputFormatters,
      this.labelText,
      this.filled,
      this.suffix})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label!,
          style: TextStyle(
              fontSize: 14.sp,
              color: labelColor ?? AppColors.inactiveColor,
              fontWeight: FontWeight.w400),
        ),
        HSpace(8.h),
        TextFormField(
          style: TextStyle(

              color: AppColors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400),
          enabled: isEnabled,
          autovalidateMode: autovalidateMode,
          inputFormatters: inputFormatters,
          controller: controller,
          onTap: onTap,
          // maxLines: maxLines,
          obscureText: obscureText ?? false,
          obscuringCharacter: '*',
          keyboardType: textInputType,
          validator: validator,
          onChanged: (String value) {
            onSaved != null ? onSaved!() : null;
          },
          decoration: InputDecoration(
            suffix: suffix,
            labelText: labelText,
            errorStyle: const TextStyle(color: AppColors.red),
            contentPadding:
                EdgeInsets.only(top: 24.h, bottom: 24.h, left: 20.w),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: AppColors.kPrimaryColor,
                width: 1.5.w,
                style: BorderStyle.solid,
              ),
            ),
            fillColor: fillingColor,
            filled: filled ?? false,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            hintText: hintText,
            hintStyle: TextStyle(
                color: AppColors.faintInActiveColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.r)),
                borderSide: BorderSide(
                    color: AppColors.kPrimaryColor,
                    width: 1.5.w,
                    style: BorderStyle.solid)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.r)),
                borderSide: BorderSide(
                    color: AppColors.inputFieldColor,
                    width: 1.5.w,
                    style: BorderStyle.solid)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.r)),
                borderSide: BorderSide(
                    color: Colors.black,
                    width: 1.5.w,
                    style: BorderStyle.solid)),
          ),
        ),
      ],
    );
  }
}
