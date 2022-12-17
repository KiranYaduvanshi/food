import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:food_user/model/cat.dart';
import 'package:food_user/model/category_model.dart';
import 'package:food_user/routes/app_routes.dart';
import 'package:food_user/utils/jsonPaths.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList items = [].obs;
  dynamic data = {};
  RxList popularItems = [].obs;
  dynamic popularData = {};
  var list = Rx<List<Items>>([]);
  var subCat = Rx<List<Category>>([]);

  var id;

  RxList homeItems = [].obs;
  dynamic homeItemData = {};

  Future<void> readJson() async {
    await rootBundle.loadString(JsonPaths.category).then((value) {
      data = json.decode(value);
    });
    list.value = CategoryModel.fromJson(data).items!;

    await rootBundle.loadString(JsonPaths.subCat).then((value) {
      subCat.value = Categories.fromJson(json.decode(value)).category!;
    });

    for (var item in list.value) {
      print(item.name);
    }
    print("list data ---- ${list.value[0].description}");

    //  items.value = data["items"];
  }

  Future<void> readPopularJson() async {
    await rootBundle.loadString(JsonPaths.popularItems).then((value) {
      popularData = json.decode(value);
    });

    popularItems.value = popularData["result"];
  }

  Future<void> readHomeItemsData() async {
    await rootBundle.loadString(JsonPaths.itemsHome).then((value) {
      homeItemData = json.decode(value);
    });

    homeItems.value = homeItemData["result"];
  }

  @override
  void onInit() async {
    super.onInit();
    await readJson();
    readPopularJson();
    readHomeItemsData();
  }

  naviagte(String id) {
    id = id;
    print("id -------------- $id");
    Get.toNamed(AppRoutes.subCategory);
  }
}
