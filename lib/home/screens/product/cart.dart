import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:food_user/common_widgets/common_app_bar.dart';
import 'package:food_user/home/controller/cart_controller.dart';
import 'package:food_user/utils/app_colors.dart';
import 'package:food_user/utils/app_strings.dart';
import 'package:food_user/utils/image_paths.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class CartScreen extends StatelessWidget {
  SlidableActionCallback? doNothing;
  CartController cartController = Get.find();

  CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: CommonAppBar(),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                    height: 500,
                    child: ListView.builder(
                        itemCount: 6,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Slidable(
                            // Specify a key if the Slidable is dismissible.
                            key: const ValueKey(2),

                            // The start action pane is the one at the left or the top side.
                            startActionPane: ActionPane(
                              // A motion is a widget used to control how the pane animates.
                              motion: const ScrollMotion(),

                              // A pane can dismiss the Slidable.
                              dismissible: DismissiblePane(onDismissed: () {}),

                              // All actions are defined in the children parameter.
                              children: [
                                // A SlidableAction can have an icon and/or a label.
                                SlidableAction(
                                  onPressed:
                                      cartController.doSomethimng(context),
                                  backgroundColor: Colors.black,
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                  label: 'Delete',
                                ),
                              ],
                            ),

                            // The end action pane is the one at the right or the bottom side.
                            endActionPane: ActionPane(
                              motion: ScrollMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: cartController.doSomethimng,
                                  backgroundColor: Colors.black,
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                  label: 'Delete',
                                ),
                              ],
                            ),

                            // The child of the Slidable is what the user sees when the
                            // component is not dragged.
                            child: cartListItems(),
                          );
                        }).expand(),
                  ),
                  paymentDetailsWidget().px12().py(8)
                ],
              ),
            ),
          ).expand(),
          Container(
            height: MediaQuery.of(context).size.height * .13,
            alignment: Alignment.center,
            width: double.infinity,
            decoration: BoxDecoration(color: AppColors.white, boxShadow: [
              BoxShadow(blurRadius: 3, color: Colors.grey.shade500)
            ]),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: AppColors.red,
                  onPrimary: AppColors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
              onPressed: () {},
              child: AppStrings.placeOrder.text.black.lg
                  .color(AppColors.white)
                  .make()
                  .p12(),
            ).wThreeForth(context).py(4),
          )
        ],
      ),
    );
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
              children: [
                "Payment Details".text.bold.size(16).make().py(8),
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
                        //  "ghbjnkm,".text.color(Colors.grey.shade700).make(),
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
                        // "vbnm".text.color(Colors.grey.shade700).make(),
                      ],
                    ).px12()
                  ],
                ).py(4),
                Container(
                  // color: AppColors.blueLight,
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

  Widget cartListItems() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(color: Colors.grey.shade200, blurRadius: 2),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(ImagePaths.apple).py(10),
              Column(
                children: [
                  "Cheese Corn Pizza".text.black.bold.make(),
                  "fghjkl;".text.make(),
                ],
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: const BorderRadius.all(
                  Radius.circular(6),
                ),
                boxShadow: [
                  BoxShadow(color: Colors.grey.shade100, blurRadius: 2)
                ]),
            child: Column(
              children: [
                "-".text.white.make(),
                "4".text.white.make(),
                "+".text.white.make(),
              ],
            ).px(6).py(2),
          )
        ],
      ).p(10),
    ).p(8);
  }
}
