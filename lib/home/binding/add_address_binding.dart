import 'package:food_user/home/controller/add_address_controller.dart';
import 'package:food_user/home/map/map_controller.dart';
import 'package:get/get.dart';

class AddAdressBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddAddressController());
    Get.lazyPut(() => MapImplementController());
  }
}
