import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_user/utils/app_colors.dart';
import 'package:velocity_x/velocity_x.dart';

Widget searchWidget(BuildContext context) {
  return Container(
    height: 60,
    width: MediaQuery.of(context).size.width * 1,
    alignment: AlignmentDirectional.topCenter,
    child: Container(
      child: TextField(
        cursorColor: Colors.grey.shade900,
        decoration: InputDecoration(
          suffixIcon: Icon(
            Icons.mic,
            color: AppColors.red,
          ),
          isDense: false,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          fillColor: Colors.grey.shade300,
          filled: true,
          hintText: "search Here",
          hintStyle: const TextStyle(color: Colors.black, fontSize: 14),
          prefixIcon: Icon(
            CupertinoIcons.search,
            size: 18,
            color: AppColors.red,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ).py12().px(10),
    ),
  );
}
