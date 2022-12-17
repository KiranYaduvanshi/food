import 'package:flutter/material.dart';
import 'package:food_user/home/controller/product_list_controller.dart';
import 'package:food_user/home/screens/product/product_list_widget.dart';
import 'package:food_user/routes/app_routes.dart';
import 'package:food_user/utils/app_colors.dart';
import 'package:food_user/utils/app_strings.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductListscreen extends StatelessWidget {
  String id;
  ProductListscreen(this.id);

  @override
  Widget build(BuildContext context) {
    ProductListController controller = Get.put(ProductListController(id));

    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                elevation: 0,
                backgroundColor: AppColors.red,
                expandedHeight: 80.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(),
              ),
            ];
          },
          body:
              // Obx(
              //  () =>
              Column(
            children: [
              Container(
                alignment: Alignment.topCenter,
                height: MediaQuery.of(context).size.height * .8,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "${controller.restrorent.name}"
                                .text
                                .size(16)
                                .bold
                                .make(),
                            "${controller.restrorent.description}"
                                .text
                                .size(14)
                                .semiBold
                                .make(),
                            "${controller.restrorent.address}".text.make(),
                            Row(
                              children: [
                                "Industrial Area,Chandigarh.".text.make(),
                                Row(
                                  children: [
                                    "2 km".text.black.bold.make(),
                                    Icon(
                                      Icons.arrow_drop_down,
                                      size: 20,
                                      color: AppColors.red,
                                    ),
                                  ],
                                ).px(5)
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                                height: 30,
                                width: 60,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.shade200,
                                          blurRadius: 3)
                                    ]),
                                child: Center(
                                    child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    "4.3".text.white.size(12).make(),
                                    const Icon(
                                      Icons.star,
                                      size: 14,
                                      color: AppColors.white,
                                    )
                                  ],
                                ))),
                            Container(
                              height: 40,
                              width: 60,
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.shade200,
                                        blurRadius: 3)
                                  ]),
                              child: Center(
                                child: Column(
                                  children: [
                                    "439".text.make(),
                                    "Reviews".text.size(10).make()
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ).p(10),
                    Container(
                      height: 400,
                      child: ListView.builder(
                        itemCount: controller.restrorent.subcategory!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return listItems(
                              controller.restrorent.subcategory!, index);
                        },
                      ),
                    ).expand(),
                  ],
                ),
              ).expand(),
              // (controller.cartBool.value = controller.cartStatus.value != 0)
              //  ?
              Obx(
                () => AnimatedContainer(
                  duration: Duration(milliseconds: 700),
                  height: (controller.cartBool.value =
                          controller.cartStatus.value != 0)
                      ? 80
                      : 0,
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      boxShadow: [
                        BoxShadow(color: AppColors.red, blurRadius: 2)
                      ]),
                  curve: Curves.linear,
                  alignment: Alignment.center,
                  child: AnimatedContainer(
                    decoration: BoxDecoration(
                      color: AppColors.red,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    duration: Duration(milliseconds: 700),
                    curve: Curves.linear,
                    height: (controller.cartBool.value =
                            controller.cartStatus.value != 0)
                        ? 50
                        : 0,
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.checkout);
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AnimatedContainer(
                            height: (controller.cartBool.value =
                                    controller.cartStatus.value != 0)
                                ? 30
                                : 0,
                            curve: Curves.linear,
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
                            duration: Duration(microseconds: 700),
                            child:
                                //  Obx(
                                //   () =>
                                Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.red,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: "1".text.size(8).white.make().px4(),
                                ),
                                " \$236"
                                    .text
                                    .size(14)
                                    .color(AppColors.red)
                                    .make()
                                    .px(1),
                              ],
                            ).px8(),
                            //   ),
                          ),
                          AppStrings.placeOrder.text
                              .size(14)
                              .bold
                              .white
                              .make()
                              .px(8),
                        ],
                      ).px(10),
                    ),
                  ).px(10),
                ),
              )
              //  : "".text.make(),
            ],
          ),
          //  ),
        ),
      ),
    );
  }
}
