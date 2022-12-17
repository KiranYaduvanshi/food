import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_user/utils/app_colors.dart';
import 'package:food_user/utils/app_strings.dart';
import 'package:food_user/utils/image_paths.dart';
import 'package:food_user/utils/inpuFieldDecoration.dart';
import 'package:velocity_x/velocity_x.dart';

class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.red,
        leading: const BackButton(
          color: AppColors.white,
        ),
        title: AppStrings.forgotPasswordtitle.text.size(18).make(),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              ImagePaths.lock,
              height: 80,
            ).py(20),
            AppStrings.forgotPasscontent.text.make().px(16).py(10),
            TextFormField(
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9@.]')),
              ],
              textInputAction: TextInputAction.done,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {},
              decoration: CustomeInputDecoration.formDecorationSquare(
                  "example@gmail.com", AppStrings.email),
            ).px(20).py8(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: AppColors.red,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                onPressed: () {},
                child: AppStrings.next.text.lg
                    .color(AppColors.white)
                    .bold
                    .make()
                    .py12(),
              ),
            ).px(20).py(20),
          ],
        ),
      ),
    );
  }
}
