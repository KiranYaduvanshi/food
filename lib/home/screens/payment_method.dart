import 'package:flutter/material.dart';
import 'package:food_user/common_widgets/common_app_bar.dart';
import 'package:food_user/routes/app_routes.dart';
import 'package:food_user/utils/app_colors.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class PaymentMethodScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.red,
      appBar: AppBar(
        backgroundColor: AppColors.red,
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: CommonAppBarRed()),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        child: Column(
          children: [
            Container(
              color: AppColors.red,
              width: double.infinity,
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * .1,
              child: Container(
                margin: const EdgeInsets.only(bottom: 20),
                alignment: Alignment.bottomLeft,
                child: "\$89.0".text.bold.white.size(25).make().px(20),
              ),
            ).expand(),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .776,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 10),
                      child: "Debit Or Credit Card"
                          .text
                          .bold
                          .size(16)
                          .make()
                          .px(16)
                          .py(16)),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 35,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey.shade700,
                                      width: 1,
                                    ),
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(6),
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 0,
                                          color: Colors.grey.shade500)
                                    ]),
                                child: Center(
                                  child: Image.asset(
                                          "assets/images/creditcard.png")
                                      .p(2),
                                ),
                              ),
                              "Add a Card".text.base.make().px(10)
                            ],
                          ),
                          const Icon(Icons.arrow_forward_ios, size: 16)
                        ],
                      ).px(16),
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                  ).py(10),
                  "Wallet".text.bold.size(16).make().px(16).py(12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 35,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey.shade700,
                                  width: 0,
                                ),
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(6),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 1,
                                      color: Colors.grey.shade500)
                                ]),
                            child: Center(
                              child:
                                  Image.asset("assets/images/wallet.png").p(2),
                            ),
                          ),
                          "Paystack ".text.base.make().px(10)
                        ],
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                      )
                    ],
                  ).px(16),
                  const Divider(
                    color: Colors.grey,
                  ).py(10),
                  "UPI".text.bold.size(16).make().px(16).py(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 38,
                            height: 30,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey.shade700,
                                  width: 0,
                                ),
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(6),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 1,
                                      color: Colors.grey.shade500)
                                ]),
                            child: Center(
                              child: Image.asset("assets/images/googlePay.png")
                                  .p(2),
                            ),
                          ),
                          "Google Pay ".text.base.make().px(10)
                        ],
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                      )
                    ],
                  ).px(16).py(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 38,
                            height: 30,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey.shade700,
                                  width: 0,
                                ),
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(6),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 0,
                                      color: Colors.grey.shade500)
                                ]),
                            child: Center(
                              child: Image.asset("assets/images/upi.png").p(4),
                            ),
                          ),
                          "Pay via another UPI ID ".text.base.make().px(10)
                        ],
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                      )
                    ],
                  ).px(16).py(8),
                  InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.orderDone);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 38,
                              height: 30,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey.shade700,
                                    width: 0,
                                  ),
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(6),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 0,
                                        color: Colors.grey.shade500)
                                  ]),
                            ),
                            "Cash on Delivery ".text.base.make().px(10)
                          ],
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                        )
                      ],
                    ).px(16).py(8),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
