import 'package:flutter/material.dart';
import 'package:interview_test/shared/assets_manager.dart';
import 'package:interview_test/shared/color_manager.dart';
import 'package:interview_test/shared/spacing.dart';
import 'package:interview_test/shared/styles_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BlockWidget extends StatelessWidget {
  final Color headerColor;
  final String accountType;
  final String accountPrice;
  const BlockWidget({
    Key? key,
    required this.headerColor,
    required this.accountType,
    required this.accountPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: Card(
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 14.h, horizontal: 20.w),
                  decoration: BoxDecoration(color: headerColor),
                  child: Row(
                    children: [
                      Expanded(
                          child: Styles.medium(accountType,
                              color: AppColors.black, fontSize: 16.sp)),
                      Styles.medium(accountPrice,
                          color: AppColors.black, fontSize: 16.sp),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Styles.regular('Welcome, let’s get you started',
                          color: AppColors.black, fontSize: 13.sp),
                      HSpace(24.h),
                      Row(
                        children: [
                          SvgPicture.asset(
                            SvgAssets.cards,
                          ),
                          WSpace(12.w),
                          Styles.medium('View Virtual Card',
                              color: AppColors.black, fontSize: 14.sp),
                        ],
                      ),
                      HSpace(8.h),
                      Divider(
                        color: AppColors.inactiveColor.withOpacity(0.6),
                      ),
                      HSpace(8.h),
                      Row(
                        children: [
                          SvgPicture.asset(
                            SvgAssets.cards_two,
                          ),
                          WSpace(12.w),
                          Styles.medium('Set up direct deposit',
                              color: AppColors.black, fontSize: 14.sp),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
