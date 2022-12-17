import 'package:flutter/material.dart';
import 'package:food_user/home/controller/product_list_widget_controller.dart';
import 'package:food_user/routes/app_routes.dart';
import 'package:food_user/utils/app_colors.dart';
import 'package:food_user/utils/app_strings.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

Widget listItems(List<dynamic> list, int index) {
  ProductwidgetController controller =
      Get.put(ProductwidgetController(index), tag: "$index");

  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(25),
        ),
        boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 2)]),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(
          () => InkWell(
            onTap: () {
              Get.toNamed(AppRoutes.productDetails, arguments: [list, index]);
            },
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      list[index].image!,
                      height: 100,
                      width: 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                controller.count.value != 0
                    ? Container(
                        width: 100,
                        height: 30,
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                            color: AppColors.red,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(6),
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade100, blurRadius: 2)
                            ]),
                        child: Obx(
                          () => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                  onTap: () {
                                    controller.decrement();
                                  },
                                  child: Container(
                                      child: "-".text.white.make().px(10))),
                              Container(
                                  child: "${controller.count.value}"
                                      .text
                                      .white
                                      .make()),
                              InkWell(
                                  onTap: () {
                                    controller.increment();
                                  },
                                  child: "+".text.white.make().px(10)),
                            ],
                          ).px(6).py(2),
                        ),
                      )
                    : Container(
                        width: 100,
                        height: 30,
                        margin: EdgeInsets.only(bottom: 10),
                        child: ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(primary: AppColors.red),
                          onPressed: () {
                            controller.addItem();
                          },
                          child: "ADD +".text.white.make(),
                        ),
                      )
              ],
            ).px(5),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: 160,
                child:
                    "${list[index].name}".text.size(15).bold.ellipsis.make()),
            Row(
              children: [
                "${AppStrings.rupee} ${list[index].price}"
                    .text
                    .size(12)
                    .semiBold
                    .make(),
                "40% OFF".text.color(AppColors.red).size(12).make().px(5)
              ],
            ),
            Container(
              width: 100,
              child:
                  "${list[index].description}".text.maxLines(2).ellipsis.make(),
            ),
          ],
        ).px(8).py(10),
      ],
    ),
  ).p(10);
}
