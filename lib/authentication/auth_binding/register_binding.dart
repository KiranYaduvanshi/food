import 'package:food_user/authentication/auth_controller/registerController.dart';
import 'package:food_user/authentication/auth_controller/ycont.dart';
import 'package:get/get.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterContoller(YourController()));
  }
}
