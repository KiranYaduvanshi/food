import 'package:food_user/home/controller/home_controller.dart';
import 'package:food_user/home/controller/subCat_controller.dart';
import 'package:food_user/model/category_model.dart';
import 'package:food_user/utils/dummy.dart';
import 'package:get/get.dart';

class HomeProductListController extends GetxController {
  RxBool status = false.obs;
  var count = 1.obs;
  RxInt cartStatus = 0.obs;
  RxBool cartBool = false.obs;
  RxInt totalItems = 0.obs;
  String? id;
  HomeProductListController(this.id);
  HomeController homeController = Get.find();
  var subCatList = Rx<List<Subcategory>>([]);
  Items restrorent = Items();

  List<Product> list = [];

  addItem() async {
    status.value = true;
    print("value ------ ${status.value}");
  }

  void increment() async {
    cartStatus.value = ProductList().cartStatus(list);
    // cartBool.value = cartStatus.value != 0;
    count++;
    totalItems.value = cartStatus.value;

    print("increment ---- $cartStatus");
  }

  void decrement() async {
    cartStatus.value = ProductList().cartStatus(list);
    totalItems.value = cartStatus.value;

    count--;
    //cartBool.value = cartStatus.value != 0;

    print("decrement ---- $cartStatus");
  }

  @override
  void onInit() {
    list = ProductList().createList();
    cartStatus.value = ProductList().cartStatus(list);
    print("Hotel Id ----- $id");

    getProductList();
    super.onInit();
  }

  void filterByCategory() {
    print("just checking   ----- ");

    for (var hotel in homeController.list.value) {
      print("just checking 222222   ----- ");

      for (var sub in hotel.subcategory!) {
        if (sub.id == id) {
          subCatList.value.add(sub);
          print("data ---- ${subCatList}");
        } else {
          print("else part-----");
        }
      }
    }

    for (var item in subCatList.value) {
      print(item.name);
    }
  }

  void getProductList() {
    for (var item in homeController.list.value) {
      // ignore: unrelated_type_equality_checks
      if (item.id == id) {
        restrorent = item;
      }
    }
  }
}
