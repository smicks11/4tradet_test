import 'package:flutter/material.dart';
import 'package:interview_test/shared/assets_manager.dart';
import 'package:interview_test/shared/color_manager.dart';
import 'package:interview_test/shared/spacing.dart';
import 'package:interview_test/shared/styles_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExchangeAd extends StatelessWidget {
  const ExchangeAd({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      margin: EdgeInsets.symmetric(horizontal: 14.w),
      decoration: BoxDecoration(
          color: AppColors.faintInActiveColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(15.r)),
      child: Row(
        children: [
          Container(
            height: 100.h,
            width: 100.w,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImageAssets.phone), fit: BoxFit.cover)),
          ),
          WSpace(22.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Styles.medium('Currency Exchange', fontSize: 13.sp),
                HSpace(8.h),
                Styles.regular('View pending and completed exchange request',
                    fontSize: 12.sp)
              ],
            ),
          )
        ],
      ),
    );
  }
}
