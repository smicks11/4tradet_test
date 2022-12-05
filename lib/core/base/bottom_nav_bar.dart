import 'package:flutter/material.dart';

import '../../modules/dashboard/dashboard.dart';

class BottomNavModel extends ChangeNotifier {
  ///current index of the bottom nav-bar
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  ///children of the bottom Nav
  final List<Widget> _children = [
    const DashboardScreen(),
    const DashboardScreen(),
    const DashboardScreen(),
    const DashboardScreen(),
  ];

  List<Widget> get children => _children;

  ///updates the current index of the bottom nav
  updateIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
