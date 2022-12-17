import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_user/home/controller/home_bottom_controller.dart';
import 'package:food_user/utils/app_colors.dart';
import 'package:food_user/utils/image_paths.dart';
import 'package:get/get.dart';

class HomeBottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BottonNavigationController _controller = Get.find();

    return Scaffold(
      body: WillPopScope(
        onWillPop: _controller.onWillPop,
        child: Obx(
          () => Center(
            child: _controller.widgetOptions
                .elementAt(_controller.selectedIndex.value),
          ),
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
        ),
        child: Obx(
          () => BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: iconitem(ImagePaths.delivery),
                activeIcon: activeiconitem(ImagePaths.delivery),
                label: 'Delivery',
              ),
              BottomNavigationBarItem(
                icon: iconitem(ImagePaths.plate),
                activeIcon: activeiconitem(ImagePaths.plate),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: iconitem(ImagePaths.ball),
                activeIcon: activeiconitem(ImagePaths.ball),
                label: 'cart',
              ),
              BottomNavigationBarItem(
                icon: iconitem(ImagePaths.offer),
                activeIcon: activeiconitem(ImagePaths.offer),
                label: 'Settings',
              ),
              // BottomNavigationBarItem(
              //   icon: iconitem(ImagePaths.wallet),
              //   activeIcon: activeiconitem(ImagePaths.wallet),
              //   label: 'Money',
              // ),
            ],
            currentIndex: _controller.selectedIndex.value,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            onTap: _controller.onItemTapped,
          ),
        ),
      ),
    );
  }

  Widget iconitem(String path) {
    return Image.asset(
      path,
      height: 24,
      color: Colors.grey,
    );
  }

  Widget activeiconitem(String path) {
    return Image.asset(
      path,
      height: 24,
      color: AppColors.red,
    );
  }
}
