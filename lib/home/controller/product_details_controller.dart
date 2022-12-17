import 'dart:async';

import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  RxBool loading = false.obs;
  var count = 1.obs;
  var price = 0.obs;
  Timer? timer;

  likeItem() async {
    loading.value = true;
    print("liked -----$loading");
  }

  dislikeItem() async {
    loading.value = false;
    print("Dislike liked -----$loading");
  }

  void increment() async {
    count++;
    price.value * count.value;
    print("increment ---- $count");
    print("price value --- ${price.value * count.value}");
  }

  void decrement() async {
    count--;
    price.value * count.value;
    print("increment ---- $count");
    print("price value --- ${price.value * count.value}");
  }
}
