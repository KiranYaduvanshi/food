import 'package:flutter/material.dart';
import 'package:food_user/common_widgets/common_app_bar.dart';
import 'package:food_user/utils/app_colors.dart';
import 'package:food_user/utils/app_strings.dart';
import 'package:food_user/utils/decorations.dart';
import 'package:food_user/utils/image_paths.dart';
import 'package:velocity_x/velocity_x.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: CommonAppBar(),
        title: "Setting".text.bold.color(AppColors.red).size(18).make(),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              decoration: CustomeBoxDecorations.squareDecoration(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        child: Image.asset(
                          ImagePaths.delivery,
                          height: 80,
                          width: 80,
                        ),
                      ).p(10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "User Name".text.bold.size(16).make(),
                          "user@gmail.com"
                              .text
                              .size(14)
                              .color(Colors.grey.shade300)
                              .make(),
                        ],
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.logout,
                    color: Colors.black,
                    size: 24,
                  ).p(10)
                ],
              ),
            ).p(10),
            Container(
              decoration: CustomeBoxDecorations.squareDecoration(),
              child: Column(
                children: [
                  commonWidget(Icons.person, AppStrings.account),
                  Divider(
                    color: Colors.grey.shade200,
                    thickness: 2,
                  ),
                  commonWidget(Icons.language, AppStrings.language),
                  Divider(
                    color: Colors.grey.shade200,
                    thickness: 2,
                  ),
                  commonWidget(Icons.notifications, AppStrings.notification),
                  Divider(
                    color: Colors.grey.shade200,
                    thickness: 2,
                  ),
                  commonWidget(Icons.bookmark, AppStrings.bookMark),
                ],
              ),
            ).p(10),
            Container(
              margin: const EdgeInsets.only(top: 8),
              decoration: CustomeBoxDecorations.squareDecoration(),
              child: Column(
                children: [
                  commonWidget(Icons.question_answer, AppStrings.faq),
                  Divider(
                    color: Colors.grey.shade200,
                    thickness: 2,
                  ),
                  commonWidget(Icons.privacy_tip, AppStrings.privacyPolicy),
                  Divider(
                    color: Colors.grey.shade200,
                    thickness: 2,
                  ),
                  commonWidget(Icons.help, AppStrings.helpCommunity),
                ],
              ),
            ).p(10)
          ],
        ),
      ),
    );
  }

  Widget commonWidget(IconData icon, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  color: AppColors.red,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade300, blurRadius: 3),
                  ]),
              child: Icon(
                icon,
                size: 19,
                color: Colors.white,
              ),
            ),
            "$title".text.size(15).semiBold.make().px(8),
          ],
        ),
        const Icon(
          Icons.arrow_forward_ios,
          color: Colors.black,
          size: 18,
        )
      ],
    ).p(12);
  }
}
