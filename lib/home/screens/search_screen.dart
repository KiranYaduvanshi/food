import 'package:flutter/material.dart';
import 'package:food_user/common_widgets/common_app_bar.dart';
import 'package:food_user/utils/app_colors.dart';
import 'package:food_user/utils/image_paths.dart';
import 'package:velocity_x/velocity_x.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: CommonAppBarRed(),
          backgroundColor: AppColors.red,
        ),
        body: Column(
          children: [
            "Recently Searched".text.size(16).semiBold.make(),
            ListView.builder(itemBuilder: (BuildContext context, int index) {
              return searchedList();
            })
          ],
        ));
  }

  Widget searchedList() {
    return Container(
      child: Row(
        children: [
          ClipRect(child: Image.asset(ImagePaths.apple)),
        ],
      ),
    );
  }
}
