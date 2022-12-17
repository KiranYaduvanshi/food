import 'package:food_user/home/controller/cart_controller.dart';
import 'package:food_user/home/controller/home_bottom_controller.dart';
import 'package:food_user/home/controller/home_controller.dart';
import 'package:food_user/home/controller/settingController.dart';
import 'package:food_user/home/home_bottom_navigation.dart';
import 'package:get/get.dart';

class HomeBottomBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottonNavigationController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => SettingController());
    Get.lazyPut(() => CartController());
  }
}
