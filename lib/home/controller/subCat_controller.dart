import 'package:food_user/home/controller/home_controller.dart';
import 'package:food_user/model/cat.dart';
import 'package:food_user/model/category_model.dart';
import 'package:food_user/utils/jsonPaths.dart';
import 'package:get/get.dart';

class SubCatController extends GetxController {
  late HomeController homeController;

  // List<Subcategory> subCatList = [];
  var list2 = Rx<List<Items>>([]);
  String? cat;

  var subCat = Rx<List<Category>>([]);

  SubCatController(this.cat);

  @override
  void onInit() {
    homeController = Get.find<HomeController>();
    print("categrory Id ----- ${homeController.id}");
    print("CAte----- $cat");

    // fetchSubCatList();
    filterByCategory();

    super.onInit();
  }

  void filterByCategory() {
    print("${cat} rgfgfg ");
    for (var hotel in homeController.list.value) {
      for (var sub in hotel.category!) {
        if (sub == cat) {
          list2.value.add(hotel);
        }
      }
    }
    for (var item in list2.value) {
      print(item.name);
    }
  }

  // fetchSubCatList() {
  //   for (int i = 0; i < homeController.list.value.length; i++) {
  //     subCatList = homeController.list.value[i].subcategory!;

  //     for (int j = 0; j < subCatList.length; j++) {
  //       if (2 == subCatList[j].id) {
  //         list2.value = subCatList;

  //         print("sub cat list ----- ${subCatList[j].name}");
  //         print(" list ----- ${list2}");
  //       } else {
  //         print("data not matched  -----");
  //       }
  //     }
  //   }
  // }
}
