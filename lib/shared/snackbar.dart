import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_test/shared/utils.dart';

import 'color_manager.dart';
import 'styles_manager.dart';

snackBar({
  required BuildContext context,
  required String message,
  required bool isError,
  double? width,
  double? height,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.white,
      elevation: 0,
      padding: EdgeInsets.zero,
      margin: const EdgeInsets.only(bottom: 50.0),
      content: Column(
        mainAxisSize: MainAxisSize.min, // needed for flexible height
        children: [
          Container(
            padding:
                EdgeInsets.only(bottom: 24.h, top: 6.h, left: 24.w, right: 4.w),
            alignment: Alignment.center,
            width: deviceWidth(context) * 0.9,
            height: height,
            // color: white,
            decoration: BoxDecoration(
                color:
                    isError == true ? AppColors.red : AppColors.kPrimaryColor,
                borderRadius: BorderRadius.circular(4.r)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    },
                    child: Icon(
                      Icons.clear,
                      size: 15.sp,
                    ),
                  ),
                ),
                Styles.regular(message,
                    fontSize: 13.sp, color: AppColors.white),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
