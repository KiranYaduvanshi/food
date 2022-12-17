import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_user/common_widgets/common_app_bar.dart';
import 'package:food_user/routes/app_routes.dart';
import 'package:food_user/utils/app_colors.dart';
import 'package:food_user/utils/app_strings.dart';
import 'package:food_user/utils/decorations.dart';
import 'package:food_user/utils/image_paths.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class CheckOutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.red,
        leading: CommonAppBarRed(),
      ),
      //  body:
      // NestedScrollView(
      //     headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
      //       return <Widget>[
      //         SliverAppBar(
      //           expandedHeight: 200.0,
      //           floating: true,
      //           pinned: true,
      //           stretch: true,
      //           backgroundColor: AppColors.red,
      //           flexibleSpace: FlexibleSpaceBar(
      //             collapseMode: CollapseMode.parallax,
      //             centerTitle: true,
      //             titlePadding: EdgeInsets.all(10),
      //             title: const Text("Cheese Corn Pizza",
      //                 style: TextStyle(
      //                   color: Colors.white,
      //                   fontSize: 14.0,
      //                 )),
      //             background: DecoratedBox(
      //               decoration: BoxDecoration(
      //                 gradient: LinearGradient(
      //                   begin: Alignment.bottomCenter,
      //                   end: Alignment.center,
      //                   colors: [
      //                     Colors.red[200]!,
      //                     Colors.transparent,
      //                   ],
      //                 ),
      //               ),
      //               child: Image.network(
      //                 "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
      //                 fit: BoxFit.cover,
      //               ),
      //             ),
      //           ),
      //         ),
      //         SliverPadding(
      //           padding: EdgeInsets.all(16.0),
      //           sliver: SliverList(
      //             delegate: SliverChildListDelegate(
      //               [],
      //             ),
      //           ),
      //         ),
      //       ];
      //     },

      body: Column(
        children: [
          Container(
            alignment: Alignment.topCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppStrings.yourOrder.text.bold.size(16).make().px(12).py(8),
                Container(
                  height: 200,
                  child: ListView.builder(
                      itemCount: 2,
                      itemBuilder: (BuildContext context, int index) {
                        return itemList();
                      }),
                ),
                paymentDetailsWidget().px(20).py(20),
              ],
            ),
          ).expand(),
          Container(
            // height: 100,
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(color: Colors.grey.shade200, blurRadius: 6)
                ]),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: AppColors.red,
                          size: 16,
                        ),
                        "industrial Area Phase 1"
                            .text
                            .size(14)
                            .color(AppColors.red)
                            .make(),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.address);
                      },
                      child: AppStrings.changeAddress.text
                          .size(13)
                          .bold
                          .color(Colors.blue)
                          .make(),
                    )
                  ],
                ).p(10),
                const Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.payment);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.red,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade100,
                                  blurRadius: 2,
                                )
                              ]),
                          child: " \$236".text.color(AppColors.red).make().p(5),
                        ).py(6),
                        AppStrings.placeOrder.text
                            .size(14)
                            .bold
                            .white
                            .make()
                            .p(8),
                      ],
                    ).px(10).py(6),
                  ).p(10),
                )
              ],
            ),
          )
        ],
      ),
      //   ),
    );
  }

  Widget itemList() {
    return Container(
        height: 90,
        decoration: BoxDecoration(
            color: AppColors.white,
            boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 3)]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                "Cheese Corrn Pizza".text.bold.make(),
                Container(
                  width: 100,
                  height: 30,
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      color: AppColors.red,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(6),
                      ),
                      boxShadow: [
                        BoxShadow(color: Colors.grey.shade100, blurRadius: 2)
                      ]),
                  child:
                      //Obx(
                      //  () =>
                      Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            // controller.decrement();
                          },
                          child:
                              Container(child: "-".text.white.make().px(10))),
                      Container(child: "${5}".text.white.make()),
                      InkWell(
                          onTap: () {
                            //  controller.increment();
                          },
                          child: "+".text.white.make().px(10)),
                    ],
                  ).px(6).py(2),
                  // ),
                ).px(6),
              ],
            ).px(20).py(8),
            "\$ 40.0".text.semiBold.make().px(20),
          ],
        )).py(6);
  }

  Container paymentDetailsWidget() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(blurRadius: 1, color: Colors.grey.shade500)]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                "Payment Details".text.bold.size(16).make().py(8).px(12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "Total Price:  "
                        .text
                        .color(Colors.grey.shade700)
                        .base
                        .make()
                        .px12(),
                    Row(
                      children: [
                        "Rs.75"
                            .text
                            .fontFamily("Roboto")
                            .color(Colors.grey.shade700)
                            .make(),
                        //   "gvhjbkn".text.color(Colors.grey.shade700).make(),
                      ],
                    ).px12()
                  ],
                ).py(4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "Delivery Charges:  "
                        .text
                        .color(Colors.grey.shade700)
                        .base
                        .make()
                        .px12(),
                    Row(
                      children: [
                        "Rs 50"
                            .text
                            .fontFamily("Roboto")
                            .color(Colors.grey.shade700)
                            .make(),
                      ],
                    ).px12()
                  ],
                ).py(4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "Additional Discount:  "
                        .text
                        .color(Colors.grey.shade700)
                        .base
                        .make()
                        .px12(),
                    Row(
                      children: [
                        "40%"
                            .text
                            .fontFamily("Roboto")
                            .color(Colors.grey.shade700)
                            .make(),
                      ],
                    ).px12()
                  ],
                ).py(4),
                Container(
                  color: Colors.red.shade200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Total Amount:  "
                          .text
                          .color(Colors.black)
                          .bold
                          .size(16)
                          .make()
                          .px12(),
                      Row(
                        children: [
                          "Rs.140"
                              .text
                              .fontFamily("Roboto")
                              .color(Colors.grey.shade700)
                              .make(),
                          //  "xfcghvjbkn,".text.color(Colors.grey.shade700).make(),
                        ],
                      ).px12()
                    ],
                  ).py(8),
                ).py(8),
              ],
            ),
          ).py(10),
        ],
      ),
    );
  }
}
