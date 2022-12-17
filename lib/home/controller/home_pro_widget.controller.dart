import 'package:food_user/home/controller/home_product_list_controller.dart';
import 'package:food_user/home/controller/product_list_controller.dart';
import 'package:food_user/utils/dummy.dart';
import 'package:get/get.dart';

class HomeProductwidgetController extends GetxController {
  late HomeProductListController productListController;
  RxBool status = false.obs;
  var count = 0.obs;
  RxBool cartBool = false.obs;
  final index;
  HomeProductwidgetController(this.index);

  @override
  void onInit() async {
    productListController =
        Get.find<HomeProductListController>(); // Added here.

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
