import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:food_user/authentication/auth_controller/ycont.dart';
import 'package:food_user/routes/app_routes.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  late GlobalKey<FormState> formKey;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  RxBool loading = false.obs;

  LoginController(YourController yourController);

  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    emailController.text = "a@a.a";
    passwordController.text = "123456789";
    super.onInit();
  }

  String? handleEmail() {
    if (emailController.text.isNotEmpty) {
      return null;
    } else {
      return "Field Should'nt Empty";
    }
  }

  String? handlePassword() {
    if (passwordController.text.length < 8) {
      return "Size must be greater than 8";
    } else {
      return null;
    }
  }

  userVerification() async {
    loading.value = true;
    if (formKey.currentState!.validate()) {
      print(formKey.currentState!.validate());
      if (emailController.text == "a@a.a" &&
          passwordController.text == "123456789") {
        Timer(const Duration(seconds: 3), () {
          print("loading --- ${loading.value}");
          loading.value = false;
          Get.toNamed(AppRoutes.homeBottomNavigation);
        });
        print("loading1 --- ${loading.value}");
      } else {
        print("Credentail is invalid ");
      }
      print("email----------------${emailController.text}");
      print("Password----------------${passwordController.text}");
    } else {
      print("Invalid Fields ");
    }
  }
}
