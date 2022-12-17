import 'package:food_user/home/controller/cart_controller.dart';
import 'package:get/get.dart';

class CartBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => CartController());
  }
}
