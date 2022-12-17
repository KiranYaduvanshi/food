import 'package:food_user/home/controller/settingController.dart';
import 'package:get/get.dart';

class SettingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingController());
  }
}
