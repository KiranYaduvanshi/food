import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_user/common_widgets/common_app_bar.dart';
import 'package:food_user/routes/app_routes.dart';
import 'package:food_user/utils/app_colors.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class AddressScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: CommonAppBar(),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              Get.toNamed(AppRoutes.addAddress);
            },
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.red,
                    width: 1,
                  ),
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(blurRadius: 3, color: Colors.grey.shade500)
                  ]),
              child: RichText(
                text: TextSpan(
                  children: [
                    WidgetSpan(
                        child: Icon(
                      Icons.add,
                      color: AppColors.red,
                      size: 20,
                    )),
                    TextSpan(
                        text: "Add New Address",
                        style: TextStyle(color: AppColors.red, fontSize: 16)),
                  ],
                ),
              ).px(8).py(10),
            ).p(16),
          ),
          Container(
            height: 500,
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return addressList();
                }),
          ).expand()
        ],
      ),
    );
  }

  Widget addressList() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 3,
            )
          ]),
      child: Column(
        children: [
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              decoration: BoxDecoration(
                  color: AppColors.red,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(50),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade100,
                      blurRadius: 2,
                    )
                  ]),
              child: const Icon(
                Icons.location_on_outlined,
                color: Colors.white,
                size: 24,
              ).p(4),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                "Sector 23D, House no:778".text.make(),
                "Chandigarh , Chandigarh".text.make(),
                "160062".text.make(),
                "798000908".text.make(),
              ],
            ).px(10),
          ]).p(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {},
                child: RichText(
                    text: const TextSpan(children: [
                  WidgetSpan(
                      child: Icon(
                    Icons.edit_outlined,
                    color: Colors.black,
                    size: 18,
                  )),
                  TextSpan(
                      text: "Edit   ",
                      style: TextStyle(color: Colors.black, fontSize: 12))
                ])).py(8),
              ),
              InkWell(
                onTap: () {},
                child: RichText(
                    text: const TextSpan(children: [
                  WidgetSpan(
                      child: Icon(
                    Icons.delete_outline,
                    color: Colors.black,
                    size: 18,
                  )),
                  TextSpan(
                      text: "Remove   ",
                      style: TextStyle(color: Colors.black, fontSize: 12))
                ])).py(8),
              )
            ],
          ).py(8)
        ],
      ).p(10),
    ).p(10);
  }
}
