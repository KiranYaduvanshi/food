import 'package:food_user/home/controller/home_product_list_controller.dart';
import 'package:food_user/home/controller/product_list_controller.dart';
import 'package:get/get.dart';

class HomeProductListBinding implements Bindings {
  String? id;
  HomeProductListBinding(this.id);

  @override
  void dependencies() {
    Get.put(HomeProductListController(id));
  }
}
