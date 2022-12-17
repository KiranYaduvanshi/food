import 'package:food_user/home/controller/my_order_controller.dart';
import 'package:get/get.dart';

class MyOrderBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyOrderController());
  }
}
