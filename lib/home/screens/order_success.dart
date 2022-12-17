import 'package:flutter/material.dart';
import 'package:food_user/common_widgets/common_app_bar.dart';
import 'package:food_user/utils/app_colors.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class OrderDoneScreen extends StatelessWidget {
  const OrderDoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: CommonAppBar(),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        child: Column(
          children: [
            Container(
              color: AppColors.white,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .6,
              child: Center(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 40),
                      child: Icon(
                        Icons.check_circle_outline,
                        size: 150,
                        color: AppColors.red,
                      ),
                    ),
                    Container(
                      width: 140,
                      margin: EdgeInsets.only(top: 50),
                      decoration: BoxDecoration(
                          color: AppColors.red,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade200,
                              blurRadius: 2,
                            )
                          ]),
                      child: Center(
                        child: "Awesome!"
                            .text
                            .size(16)
                            .bold
                            .color(AppColors.white)
                            .make()
                            .px(12)
                            .py(8),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 10),
                        child: "Congratulations."
                            .text
                            .color(AppColors.red)
                            .size(20)
                            .bold
                            .make()),
                    "your Order is Accepted!"
                        .text
                        .color(AppColors.red)
                        .size(18)
                        .bold
                        .make(),
                  ],
                ),
              ),
            ),
            Container(
              color: AppColors.red,
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    "Have Patience you can collect your  "
                        .text
                        .semiBold
                        .white
                        .make(),
                    "Order in 20 min".text.white.semiBold.make().py(8),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: AppColors.white),
                      onPressed: () {
                        // Get.toNamed(AppRoutes.home);
                      },
                      child: "more hungry , Let's do again"
                          .text
                          .semiBold
                          .color(AppColors.red)
                          .make()
                          .px(12)
                          .py(6),
                    ),
                  ],
                ),
              ),
            ).expand()
          ],
        ),
      ),
    );
  }
}
