import 'package:flutter/material.dart';
import 'package:interview_test/shared/assets_manager.dart';
import 'package:interview_test/shared/color_manager.dart';
import 'package:interview_test/shared/spacing.dart';
import 'package:interview_test/shared/styles_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:interview_test/shared/utils.dart';

class ReferAd extends StatelessWidget {
  const ReferAd({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30.w),
          height: deviceHeight(context) * 0.16,
          width: deviceWidth(context),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: AppColors.lightBlueTwoColor.withOpacity(0.4),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15.w),
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          width: deviceWidth(context),
          decoration: BoxDecoration(
              color: AppColors.lightBlueTwoColor,
              borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              SvgPicture.asset(
                SvgAssets.group,
              ),
              WSpace(14.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Styles.medium('Get \$5 plus 10% of the fee for 365 days',
                        fontSize: 12.sp),
                    HSpace(8.h),
                    Styles.regular(
                        'Refer a friend and get \$5 when they make their first dollars to naira exchange of \$500 and above, plus 10% of the fee everytime they make exchange for 365 days.',
                        fontSize: 12.sp)
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
