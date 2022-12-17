import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_user/common_widgets/common_app_bar.dart';
import 'package:food_user/home/controller/product_details_controller.dart';
import 'package:food_user/model/category_model.dart';
import 'package:food_user/routes/app_routes.dart';
import 'package:food_user/utils/app_colors.dart';
import 'package:food_user/utils/app_strings.dart';
import 'package:food_user/utils/image_paths.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductDetailsController controller = Get.find();
    var data = Get.arguments;
    List<Subcategory> list = data[0];
    int index = data[1];
    // var price = list[index]["price"];
    // String countPrice = controller.price.value.toString();
    // String amount = (countPrice = price);
    // print("amount ---- $amount");

    return Scaffold(
      //   backgroundColor: AppColors.red,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: CommonAppBar()),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        child: Column(
          children: [
            Container(
              // color: AppColors.red,
              width: double.infinity,
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * .2,
              child: Container(
                // margin: const EdgeInsets.only(bottom: 2),
                alignment: Alignment.bottomLeft,
                child: Image.network(
                  list[index].image!,
                  //  height: MediaQuery.of(context).size.height * .2,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
            ).expand(),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .6,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [BoxShadow(color: AppColors.red, blurRadius: 5)]),
              child: Column(
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(
                          () => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              "${AppStrings.rupee} ${list[index].price}"
                                  .text
                                  .color(Colors.green)
                                  .bold
                                  .size(15)
                                  .make(),
                              controller.loading.value == true
                                  ? InkWell(
                                      onTap: () {
                                        controller.dislikeItem();
                                      },
                                      child: Icon(
                                        Icons.favorite,
                                        color: AppColors.red,
                                      ),
                                    )
                                  : InkWell(
                                      onTap: () {
                                        controller.likeItem();
                                      },
                                      child: const Icon(
                                        Icons.favorite_outline,
                                        color: Colors.grey,
                                      ),
                                    )
                            ],
                          ).px(10).py(10),
                        ),
                        "${list[index].name}"
                            .text
                            .size(16)
                            .semiBold
                            .make()
                            .px(10),
                        Row(
                          children: [
                            "4.5".text.make(),
                            VxRating(
                                maxRating: 5.0,
                                count: 5,
                                size: 18,
                                value: 4,
                                selectionColor: Colors.orange.shade200,
                                onRatingUpdate: (String value) {})
                          ],
                        ).px(10),
                        "${list[index].description}"
                            .text
                            .size(12)
                            .color(Colors.grey)
                            .make()
                            .px(10),
                        Row(
                          
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                controller.decrement();
                              },
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                          color: AppColors.red, blurRadius: 2),
                                    ]),
                                child: Center(
                                  child: "-"
                                      .text
                                      .size(24)
                                      .color(AppColors.red)
                                      .make()
                                      .px(10),
                                ),
                              ),
                            ).px(5),
                            Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                          color: AppColors.red, blurRadius: 2),
                                    ]),
                                child: Obx(
                                  () => Center(
                                      child: "${controller.count}"
                                          .text
                                          .color(AppColors.red)
                                          .make()),
                                )),
                            InkWell(
                              onTap: () {
                                controller.increment();
                              },
                              child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                            color: AppColors.red,
                                            blurRadius: 2),
                                      ]),
                                  child: Center(
                                    child: "+"
                                        .text
                                        .color(AppColors.red)
                                        .make()
                                        .px(10),
                                  )),
                            ).px(5),
                          ],
                        ).px(6).py(2).px(10).py(10),
                      ],
                    ),
                  ).p(12).expand(),
                  Container(
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
                          width: 100,
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
                          child: Center(
                            child: "Add to Cart"
                                .text
                                .size(14)
                                .bold
                                .color(AppColors.red)
                                .make()
                                .p(5),
                          ),
                        ).py(6),
                        InkWell(
                          onTap: () {
                            Get.toNamed(AppRoutes.checkout);
                          },
                          child: Container(
                              width: 100,
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
                              child: Center(
                                child: AppStrings.proceed.text
                                    .size(14)
                                    .bold
                                    .color(AppColors.red)
                                    .make()
                                    .p(5),
                              )),
                        ),
                      ],
                    ).px(10),
                  ).p(10),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
