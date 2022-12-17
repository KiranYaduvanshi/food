import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_user/authentication/auth_controller/ycont.dart';
import 'package:food_user/routes/app_routes.dart';
import 'package:get/get.dart';

class RegisterContoller extends GetxController {
  late GlobalKey<FormState> formKey;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController nameController;
  late TextEditingController conPssController;
  RxBool loading = false.obs;

  RegisterContoller(YourController yourController);

  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
    conPssController = TextEditingController();
    super.onInit();
  }

  String? handleEmail() {
    if (emailController.text.isNotEmpty) {
      return null;
    } else {
      return "Field Should'nt Empty";
    }
  }

  String? handleName() {
    if (nameController.text.isNotEmpty) {
      return null;
    } else {
      return "Field Should'nt Empty";
    }
  }

  String? handleConfirmPassword() {
    if (conPssController.text.length < 8 ||
        conPssController.text != passwordController.text) {
      return "Password does'nt Match";
    }
    return null;
  }

  String? handlePassword() {
    if (passwordController.text.length < 8) {
      return "Size must be greater than 8";
    } else {
      return null;
    }
  }

  userRegistration() async {
    loading.value = true;
    if (formKey.currentState!.validate()) {
      print(formKey.currentState!.validate());
      Timer(const Duration(seconds: 3), () {
        loading.value = false;
        Get.toNamed(AppRoutes.home);
      });
    } else {}
  }
}
