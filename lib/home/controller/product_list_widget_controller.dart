import 'package:food_user/home/controller/product_list_controller.dart';
import 'package:food_user/utils/dummy.dart';
import 'package:get/get.dart';

class ProductwidgetController extends GetxController {
  late ProductListController productListController;
  RxBool status = false.obs;
  var count = 0.obs;
  RxBool cartBool = false.obs;
  final index;
  ProductwidgetController(this.index);

  @override
  void onInit() async {
    productListController = Get.find<ProductListController>(); // Added here.

    status.value = productListController.status.value;
    count.value = productListController.list[index].count.value;

    // count.value = productListController.count.value;
    print(
        "list ----- ${productListController.status.value}"); // This shows the updated value
    super.onInit();
  }

  addItem() async {
    status.value = true;
    count.value = productListController.list[index].count.value = 1;
    productListController.increment();

    print("value ------ ${status.value}");
  }

  void increment() async {
    count.value = productListController.list[index].count.value += 1;
    productListController.increment();
  }

  void decrement() async {
    count.value = productListController.list[index].count.value -= 1;
    productListController.decrement();
  }
}
