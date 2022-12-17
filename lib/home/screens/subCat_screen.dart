import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_user/common_widgets/common_app_bar.dart';
import 'package:food_user/home/controller/cart_controller.dart';
import 'package:food_user/home/controller/subCat_controller.dart';
import 'package:food_user/home/screens/product/product_list_screen.dart';
import 'package:food_user/model/category_model.dart';
import 'package:food_user/utils/app_colors.dart';
import 'package:food_user/utils/image_paths.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class SubCatScreen extends StatelessWidget {
  
  String name;
  SubCatScreen(this.name);

  @override
  Widget build(BuildContext context) {
    SubCatController catController = Get.put(SubCatController(name));
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.red,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: CommonAppBarRed(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(
              () => Container(
                height: MediaQuery.of(context).size.height * .9,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: catController.list2.value.length,
                    itemBuilder: (context, index) {
                      var catController2 = catController;
                      return restaurentListItems(
                          catController2.list2.value, index);
                    }).p(10),
              ),
            ),
          ],
        ),
      ),
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
          Get.to(ProductListscreen("${list[index].id}"));
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
                child:
                    // Image.asset(
                    //   ImagePaths.apple,
                    //   fit: BoxFit.fitHeight,
                    //   width: double.infinity,
                    //   height: 190,
                    // )
                    Image.network(
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
                "${list[index].name!}".text.semiBold.make(),
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
            "${list[index].description}".text.size(14).make().px(10),
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
                          text: ' ${list[index].percentage} % OFF ',
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
