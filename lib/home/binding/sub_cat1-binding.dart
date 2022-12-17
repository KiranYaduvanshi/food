import 'package:food_user/home/controller/subCat_controller.dart';
import 'package:get/get.dart';

class SubCatBinding implements Bindings {
  String? name;
  SubCatBinding(this.name);

  @override
  void dependencies() {
    print("Kiran binding ho ri hai");
    Get.put(SubCatController(name!));
  }
}
