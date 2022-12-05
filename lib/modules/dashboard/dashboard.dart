import 'package:flutter/material.dart';
import 'package:interview_test/shared/color_manager.dart';
import 'package:interview_test/shared/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'components/block_cards.dart';
import 'components/exchange_ad.dart';
import 'components/header_widget.dart';
import 'components/refer_ad.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HSpace(16.h),
              const HeaderWidget(),
              HSpace(24.h),
              BlockWidget(
                headerColor: AppColors.lightBlueColor.withOpacity(0.6),
                accountPrice: '\$25,000.00',
                accountType: 'Checkings Account',
              ),
              HSpace(24.h),
              BlockWidget(
                headerColor: AppColors.lightOrangeColor.withOpacity(0.6),
                accountPrice: '\$5,000.00',
                accountType: 'Business Account',
              ),
              HSpace(24.h),
              const ReferAd(),
              HSpace(24.h),
              const ExchangeAd()
            ],
          ),
        ),
      ),
    );
  }
}
