import 'package:food_user/home/controller/address_controller.dart';
import 'package:get/get.dart';

class AddressBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddressController());
  }
}
