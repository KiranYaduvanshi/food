import 'package:food_user/home/controller/order_done_controller.dart';
import 'package:get/get.dart';

class OrderDoneBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderDoneController());
  }
}
