import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Loader extends StatelessWidget {
  final double? radius;
  final Color? color;

  const Loader({Key? key, this.radius, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: radius ?? 35,
      height: radius ?? 35,
      child: Platform.isAndroid
          ? SizedBox(
            height: 100.h,
            width: 100.w,
            child: CircularProgressIndicator(
                strokeWidth: 1.5,
                valueColor: AlwaysStoppedAnimation<Color>(color!)),
          )
          : CupertinoActivityIndicator(
              color: color,
              radius: radius ?? 20,
            ),
    );
  }
}
