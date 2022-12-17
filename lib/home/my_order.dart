import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_user/common_widgets/common_app_bar.dart';
import 'package:food_user/utils/app_colors.dart';
import 'package:food_user/utils/app_strings.dart';
import 'package:food_user/utils/decorations.dart';
import 'package:food_user/utils/image_paths.dart';
import 'package:velocity_x/velocity_x.dart';

class MyOrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: CommonAppBar(),
        title:
            AppStrings.myorders.text.color(AppColors.red).size(18).bold.make(),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return OrderListItems();
            }).expand(),
      ),
    );
  }

  Widget OrderListItems() {
    return Container(
      decoration: CustomeBoxDecorations.squareDecoration(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                ImagePaths.food,
                height: 100,
                width: 100,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  "Cheese Corn Pizza".text.size(16).bold.make(),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        color: Colors.grey.shade300,
                      ),
                      "Fri,April 30"
                          .text
                          .color(Colors.grey.shade300)
                          .size(14)
                          .make()
                          .py(16)
                    ],
                  )
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              "\$25.00".text.semiBold.make().py(14).px(10),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.red,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(6),
                  ),
                ),
                child: "Reorder".text.size(12).white.make().p(6),
              )
            ],
          ).px(12)
        ],
      ),
    ).p(10);
  }
}
