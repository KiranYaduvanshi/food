import 'package:food_user/authentication/auth_controller/login_contoller.dart';
import 'package:food_user/authentication/auth_controller/ycont.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(YourController()));
  }
}
