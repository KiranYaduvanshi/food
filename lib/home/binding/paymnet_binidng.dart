import 'package:food_user/home/controller/payment_controller.dart';
import 'package:get/get.dart';

class PayemnetMethodBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PaymentMethodController());
  }
}
