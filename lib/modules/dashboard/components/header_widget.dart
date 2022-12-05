import 'package:flutter/material.dart';
import 'package:interview_test/shared/assets_manager.dart';
import 'package:interview_test/shared/color_manager.dart';
import 'package:interview_test/shared/spacing.dart';
import 'package:interview_test/shared/styles_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25.r,
            backgroundImage: const AssetImage(ImageAssets.profile),
          ),
          WSpace(8.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Styles.regular('Welcome', fontSize: 14.sp),
                HSpace(2.h),
                Styles.medium('Micheal Ajayi', fontSize: 16.sp),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.avatarColor.withOpacity(0.3)
                // color: AppColors.avatarColor,
                ),
            child: Stack(
              children: [
                SvgPicture.asset(
                  SvgAssets.notification,
                ),
                Positioned(
                    right: 1,
                    child: Container(
                      height: 4.h,
                      width: 4.w,
                      decoration: const BoxDecoration(
                        color: AppColors.red,
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
