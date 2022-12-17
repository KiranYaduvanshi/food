import 'package:food_user/home/controller/checkout_controller.dart';
import 'package:get/get.dart';

class CheckoutBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CheckoutController());
  }
}
