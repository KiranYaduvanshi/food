import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_user/home/binding/sub_cat1-binding.dart';
import 'package:food_user/home/controller/home_controller.dart';
import 'package:food_user/home/screens/product/home_product_list_screen.dart';
import 'package:food_user/home/screens/product/product_list_screen.dart';
import 'package:food_user/home/screens/subCat_screen.dart';
import 'package:food_user/home/search_widget.dart';
import 'package:food_user/model/category_model.dart';
import 'package:food_user/routes/app_pages.dart';
import 'package:food_user/routes/app_routes.dart';
import 'package:food_user/utils/app_colors.dart';
import 'package:food_user/utils/app_strings.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                elevation: 0,
                backgroundColor: AppColors.red,
                expandedHeight: 80.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: AppColors.white,
                        size: 20,
                      ),
                      "industrial Area Phase 1"
                          .text
                          .size(14)
                          .color(AppColors.white)
                          .make(),
                    ],
                  ).px(10),
                  centerTitle: true,
                ),
              ),
            ];
          },
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                searchWidget(context),
                Container(
                    height: 30,
                    child: "Eat What makes you happy"
                        .text
                        .bold
                        .size(16)
                        .make()
                        .px(10)),
                Obx(
                  () => Container(
                    height: 200,
                    child: GridView.builder(
                        itemCount: controller.subCat.value.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return gridListItem(
                            controller.subCat.value[index].name!,
                            controller.subCat.value[index].image!,
                            controller.subCat.value[index].cid!,
                          );
                        }),
                  ),
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(8),
                      ),
                      boxShadow: [
                        BoxShadow(blurRadius: 3, color: Colors.grey.shade300)
                      ]),
                  child: Container(
                    width: 130,
                    child: Row(
                      children: [
                        "see more".text.make(),
                        const Icon(Icons.arrow_drop_down)
                      ],
                    ).p(8),
                  ),
                ).px(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "Recommended for you".text.semiBold.size(16).make(),
                    "see all".text.color(AppColors.red).size(14).make()
                  ],
                ).px(10).py(6),
                Obx(
                  () => Container(
                    height: 280,
                    child: ListView.builder(
                        primary: true,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.popularItems.length,
                        itemBuilder: (context, index) {
                          return recomendeListItem(
                              context, controller.popularItems, index);
                        }).p(10),
                  ),
                ),
                Obx(
                  () => Container(
                    child: ListView.builder(
                        primary: true,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: controller.list.value.length,
                        itemBuilder: (context, index) {
                          return restaurentListItems(
                              controller.list.value, index);
                        }).p(10),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget gridListItem(String name, String imageUrl, String id) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            boxShadow: [
              BoxShadow(
                color: AppColors.red,
                blurRadius: 1,
              )
            ]),
        child: InkWell(
          onTap: () {
            // controller.naviagte(id);
            Get.to(SubCatScreen(name));
            print("$name");
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 3),
                child: Image.network(
                  imageUrl,
                  height: 50,
                  width: 50,
                ),
              ),
              "$name".text.size(10).semiBold.make().py(1).px(2).centered(),
            ],
          ),
        ),
      ),
    );
  }

  Widget recomendeListItem(BuildContext context, List list, int index) {
    return InkWell(
      onTap: () {
        //  Get.toNamed(AppRoutes.productDetails, arguments: [list, index]);
      },
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(color: Colors.grey.shade200, blurRadius: 3),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.network(
                list[index]["image"],
                height: 140,
                width: 200,
                fit: BoxFit.fitHeight,
              ).py(4),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                "${list[index]["name"]}".text.semiBold.make(),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      " 4.3".text.white.sm.make(),
                      const Icon(
                        Icons.star,
                        color: Colors.white,
                        size: 14,
                      ).px2()
                    ],
                  ),
                ),
              ],
            ).px(10),
            "${AppStrings.rupee} ${list[index]["price"]}"
                .text
                .size(16)
                .make()
                .px(10),
            Row(
              children: [
                Icon(
                  Icons.timer,
                  size: 13,
                  color: AppColors.red,
                ),
                "32 min . 7 km".text.size(10).make().px(2),
              ],
            ).px(10).py(5),
            // Row(
            //   children: [
            //     Container(
            //       decoration: BoxDecoration(
            //         color: Colors.red.shade200,
            //         borderRadius: const BorderRadius.all(
            //           Radius.circular(50),
            //         ),
            //       ),
            //       child: Image.asset(
            //         ImagePaths.rupee,
            //         height: 8,
            //         width: 8,
            //       ).p(2),
            //     ),
            //    "100 for one".text.size(10).make().px(2),
            //   ],
            // ).px(10),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 30,
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  color: AppColors.red,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: const Radius.circular(10),
                  ),
                ),
                child: Center(
                  child: "${list[index]["percentage"]}% OFF".text.white.make(),
                ),
              ),
            ).expand(),
          ],
        ),
      ).p(8),
    );
  }

  Widget restaurentListItems(List<Items> list, int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(color: Colors.grey.shade200, blurRadius: 3),
        ],
      ),
      child: InkWell(
        onTap: () {
          Get.to(HomeProductListscreen("${list[index].id}"));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Container(
                //margin: const EdgeInsets.only(top: 10),
                child: Image.network(
                  list[index].image!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 190,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                "${list[index].name}".text.semiBold.make(),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      " 4.3".text.white.sm.make(),
                      const Icon(
                        Icons.star,
                        color: Colors.white,
                        size: 14,
                      ).px2()
                    ],
                  ),
                ),
              ],
            ).px(8).py(5),
            "Biryani ,Mughlai ,Lucknown".text.size(14).make().px(10),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  const Icon(
                    Icons.timer,
                    size: 13,
                  ),
                  RichText(
                    text: TextSpan(
                      text: '32 min . 7 km ',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontSize: 12),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' ${list[index].percentage}% OFF ',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                              fontSize: 12),
                        ),
                        TextSpan(
                          text: ' Pro 10% OFF',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.red,
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ).px(2),
                ],
              ).px(8).py(6),
            ),
          ],
        ),
      ),
    ).p(10);
  }
}
