import 'package:flutter/material.dart';
import 'package:food_user/home/home_page.dart';
import 'package:food_user/home/screens/product/cart.dart';
import 'package:food_user/home/screens/product/setting.dart';
import 'package:food_user/home/screens/search_screen.dart';

import 'package:get/state_manager.dart';

class BottonNavigationController extends GetxController {
  DateTime? currentBackPressTime;

  Rx<int> selectedIndex = 0.obs;
  final List<Widget> widgetOptions = <Widget>[
    HomePage(),
    SearchScreen(),
    CartScreen(),
    SettingScreen(),
    // HomePage(),
  ];

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      return Future.value(false);
    }
    return Future.value(true);
  }

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}
