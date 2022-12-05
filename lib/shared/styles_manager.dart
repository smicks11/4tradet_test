import 'package:flutter/material.dart';
import 'package:interview_test/shared/color_manager.dart';

class FWt {
  FWt();

  static FontWeight extraLight = FontWeight.w200;
  static FontWeight light = FontWeight.w300;
  static FontWeight regular = FontWeight.w400;
  static FontWeight semiBold = FontWeight.w500;
  static FontWeight mediumBold = FontWeight.w600;

  static FontWeight bold = FontWeight.w700;
  static FontWeight extraBold = FontWeight.w800;
  static FontWeight text = FontWeight.w900;
}

class Styles {
  static Text regular(String text,
      {double? fontSize,
      Color? color,
      TextAlign? align,
      double? height,
      FontStyle? fontStyle,
      FontWeight? fontWeight,
      bool strike = false,
      int? lines,
      TextOverflow? overflow,
      bool underline = false,
      String? fontFamily}) {
    return Text(
      text,
      textAlign: align ?? TextAlign.left,
      maxLines: lines,
      overflow: overflow,
      style: TextStyle(
        fontSize: fontSize ?? 14.0,
        fontWeight: fontWeight ?? FWt.regular,
        color: color ?? AppColors.black,
        height: height,
        fontStyle: fontStyle ?? FontStyle.normal,
        decoration: underline
            ? TextDecoration.underline
            : strike
                ? TextDecoration.lineThrough
                : TextDecoration.none,
        fontFamily: fontFamily,
      ),
    );
  }

  static TextSpan spanRegular(String text,
      {double? fontSize,
      Color? color,
      TextAlign? align,
      double? height,
      FontStyle? fontStyle,
      FontWeight? fontWeight,
      bool strike = false,
      int? lines,
      TextOverflow? overflow,
      bool underline = false,
      String? fontFamily}) {
    return TextSpan(
      text: text,
      style: TextStyle(
        fontSize: fontSize ?? 14.0,
        fontWeight: fontWeight ?? FWt.regular,
        color: color ?? AppColors.black,
        height: height,
        fontStyle: fontStyle ?? FontStyle.normal,
        decoration: underline
            ? TextDecoration.underline
            : strike
                ? TextDecoration.lineThrough
                : TextDecoration.none,
        fontFamily: fontFamily,
      ),
    );
  }

  static Text medium(String text,
      {double? fontSize,
      FontWeight? fontWeight,
      Color? color,
      TextAlign? align,
      double? height,
      bool strike = false,
      int? lines,
      TextOverflow? overflow,
      bool underline = false,
      String? fontFamily}) {
    return Text(
      text,
      textAlign: align ?? TextAlign.left,
      maxLines: lines,
      overflow: overflow,
      style: TextStyle(
          fontSize: fontSize ?? 14.0,
          fontWeight: fontWeight ?? FWt.mediumBold,
          color: color ?? AppColors.black,
          height: height,
          decoration: underline
              ? TextDecoration.underline
              : strike
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
          fontFamily: fontFamily),
    );
  }

  static Text semiBold(String text,
      {double? fontSize,
      Color? color,
      TextOverflow? overflow,
      TextAlign? align,
      double? height,
      bool strike = false,
      bool underline = false,
      int? lines,
      String? fontFamily}) {
    return Text(
      text,
      textAlign: align ?? TextAlign.left,
      maxLines: lines,
      overflow: overflow,
      style: TextStyle(
        fontSize: fontSize ?? 16.0,
        fontWeight: FWt.semiBold,
        color: color ?? AppColors.black,
        height: height,
        decoration: underline
            ? TextDecoration.underline
            : strike
                ? TextDecoration.lineThrough
                : TextDecoration.none,
        fontFamily: fontFamily,
      ),
    );
  }

  static TextSpan spanBold(String text,
      {double? fontSize,
      Color? color,
      TextAlign? align,
      bool strike = false,
      int? lines,
      TextOverflow? overflow,
      double? height,
      String? fontFamily}) {
    return TextSpan(
      text: text,
      style: TextStyle(
        fontSize: fontSize ?? 18.0,
        fontWeight: FWt.bold,
        color: color,
        height: height,
        decoration: strike ? TextDecoration.lineThrough : TextDecoration.none,
        fontFamily: fontFamily,
      ),
    );
  }

  static Text bold(String text,
      {double? fontSize,
      Color? color,
      TextAlign? align,
      bool strike = false,
      int? lines,
      TextOverflow? overflow,
      List<Shadow>? shadow,
      double? height,
      String? fontFamily}) {
    return Text(
      text,
      textAlign: align ?? TextAlign.left,
      maxLines: lines,
      overflow: overflow,
      style: TextStyle(
        shadows: shadow,
        fontSize: fontSize ?? 18.0,
        fontWeight: FWt.bold,
        color: color ?? AppColors.black,
        height: height,
        decoration: strike ? TextDecoration.lineThrough : TextDecoration.none,
        fontFamily: fontFamily,
      ),
    );
  }

  static Text extraBold(String? text,
      {double? fontSize,
      Color? color,
      TextAlign? align,
      int? lines,
      bool strike = false,
      TextOverflow? overflow,
      String? fontFamily}) {
    return Text(
      text ?? '',
      textAlign: align ?? TextAlign.left,
      maxLines: lines,
      overflow: overflow,
      style: TextStyle(
        fontSize: fontSize ?? 20.0,
        fontWeight: FWt.extraBold,
        color: color ?? AppColors.black,
        decoration: strike ? TextDecoration.lineThrough : TextDecoration.none,
        fontFamily: fontFamily,
      ),
    );
  }
}
