import 'package:food_user/home/controller/product_list_controller.dart';
import 'package:get/get.dart';

class ProductListBinding implements Bindings {
  String? id;
  ProductListBinding(this.id);

  @override
  void dependencies() {
    Get.put(ProductListController(id));
  }
}
