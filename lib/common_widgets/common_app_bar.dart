import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_user/utils/app_colors.dart';
import 'package:velocity_x/velocity_x.dart';

Widget CommonAppBar() {
  return Container(
    decoration: BoxDecoration(
        color: AppColors.red,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(color: Colors.grey.shade400, blurRadius: 3),
        ]),
    child: const Center(
      child: Icon(
        Icons.arrow_back,
        size: 18,
        color: AppColors.white,
      ),
    ),
  ).p(10);
}

Widget CommonAppBarRed() {
  return Container(
    decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        boxShadow: [BoxShadow(color: Colors.grey.shade400, blurRadius: 3)]),
    child: Center(
      child: Icon(
        Icons.arrow_back,
        size: 18,
        color: AppColors.red,
      ),
    ),
  ).p(10);
}

Widget AppBarWidget() {
  return Container(
    decoration: BoxDecoration(
      color: AppColors.red,
      borderRadius: const BorderRadius.all(
        Radius.circular(10),
      ),
      boxShadow: [
        BoxShadow(color: Colors.grey.shade400, blurRadius: 3),
      ],
    ),
    child: const Center(
      child: Icon(
        Icons.arrow_back,
        size: 24,
        color: AppColors.white,
      ),
    ).p(6),
  ).p(5);
}
