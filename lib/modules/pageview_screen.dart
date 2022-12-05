import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/base/bottom_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/svg.dart';
import '../shared/assets_manager.dart';
import '../shared/color_manager.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BottomNav();
  }
}

class _BottomNav extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavModel>(
      builder: (context, model, child) => Scaffold(
        backgroundColor: AppColors.white,
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 2,
                offset: const Offset(0, 0.75),
              ),
            ],
          ),
          child: BottomNavigationBar(
              onTap: (index) => model.updateIndex(index),
              type: BottomNavigationBarType.fixed,
              elevation: 6,
              selectedItemColor: AppColors.kSecondaryColor,
              selectedLabelStyle: TextStyle(
                  color: AppColors.kPrimaryColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400),
              unselectedLabelStyle: TextStyle(
                  color: AppColors.inactiveColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400),
              backgroundColor: AppColors.white,
              currentIndex: model.currentIndex,
              items: userBottomTabItems(context)),
        ),
        body: IndexedStack(index: model.currentIndex, children: model.children),
      ),
    );
  }

  ///bottom nav items
  userBottomTabItems(BuildContext context) {
    return [
      BottomNavigationBarItem(
        activeIcon: SvgPicture.asset(
          SvgAssets.home,
        ),
        icon: SvgPicture.asset(
          SvgAssets.home,
          // height: 18.h,
          // width: 18.w,
        ),
        label: "Home",
      ),
      BottomNavigationBarItem(
        activeIcon: SvgPicture.asset(
          SvgAssets.account,
        ),
        icon: SvgPicture.asset(
          SvgAssets.account,
        ),
        label: "Accounts",
      ),
      BottomNavigationBarItem(
        activeIcon: SvgPicture.asset(
          SvgAssets.app,
        ),
        icon: SvgPicture.asset(
          SvgAssets.app,
        ),
        label: "Apps",
      ),
      BottomNavigationBarItem(
        activeIcon: SvgPicture.asset(
          SvgAssets.settings,
        ),
        icon: SvgPicture.asset(
          SvgAssets.settings,
        ),
        label: "Settings",
      ),
    ];
  }
}
