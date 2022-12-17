import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_user/authentication/auth_controller/login_contoller.dart';
import 'package:food_user/routes/app_routes.dart';
import 'package:food_user/utils/app_colors.dart';
import 'package:food_user/utils/app_strings.dart';
import 'package:food_user/utils/image_paths.dart';
import 'package:food_user/utils/inpuFieldDecoration.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginScreen extends StatelessWidget {
  // final _formKey = GlobalKey<FormState>();
  FocusNode emailFn = FocusNode();
  FocusNode passFn = FocusNode();

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.find();

    return SafeArea(
      child: Scaffold(
        // backgroundColor: AppColors.red,
        body: SingleChildScrollView(
          child: Form(
            // autovalidateMode: AutovalidateMode.onUserInteraction,
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 40,
                ),
                const Placeholder(
                  fallbackHeight: 80,
                ),
                // Image.asset(
                //   ImagePaths.,
                //   height: 80,
                // ),
                // Center(
                //   child: "Vendors App"
                //       .text
                //       .bold
                //       .white
                //       .size(20)
                //       .align(TextAlign.center)
                //       .make()
                //       .py(8),
                // ),
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: AppStrings.loginWithEmail.text
                          .color(AppColors.red)
                          .align(TextAlign.left)
                          .size(14)
                          .make()),
                ).px(20).py(8),
                // Obx(
                //   () =>
                TextFormField(
                  controller: controller.emailController,
                  focusNode: emailFn,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9@.]')),
                    FilteringTextInputFormatter.deny(' '),
                  ],
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    return controller.handleEmail();
                  },
                  onFieldSubmitted: (String value) {
                    FocusScope.of(context).requestFocus(passFn);
                  },
                  decoration: CustomeInputDecoration.formDecorationSquare(
                      "example@gmail.com", AppStrings.email),
                ).px(20).py8(),
                //   ),

                TextFormField(
                  controller: controller.passwordController,
                  focusNode: passFn,
                  inputFormatters: [FilteringTextInputFormatter.deny(' ')],
                  obscureText: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    return controller.handlePassword();
                  },
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (String value) {},
                  decoration: CustomeInputDecoration.formDecorationSquare(
                      "**********", AppStrings.password),
                ).px(20).py8(),
                // Obx(
                //   () =>
                Obx(
                  () => SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: AppColors.red,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                      onPressed: () {
                        controller.userVerification();
                        //Get.toNamed(AppRoutes.home);
                      },
                      child: controller.loading.value == true
                          ? Transform.scale(
                              scale: .8,
                              child: const CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : AppStrings.login.text.lg
                              .color(AppColors.white)
                              .bold
                              .make()
                              .py12(),
                    ),
                  ).px(20).py8(),
                ),
                // ),
                InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.forgotPass);
                  },
                  child: Align(
                          alignment: Alignment.bottomRight,
                          child: AppStrings.forgotPassword.text
                              .color(AppColors.red)
                              .align(TextAlign.left)
                              .size(14)
                              .underline
                              .make())
                      .px(20)
                      .py(8),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const DottedLine(
                      direction: Axis.horizontal,
                      lineLength: 100,
                      lineThickness: 1.0,
                      dashLength: 4.0,
                      dashColor: AppColors.black,
                      dashRadius: 0.0,
                      dashGapLength: 4.0,
                      dashGapColor: Colors.transparent,
                      dashGapRadius: 0.0,
                    ),
                    "OR".text.color(AppColors.red).make(),
                    const DottedLine(
                      direction: Axis.horizontal,
                      lineLength: 100,
                      lineThickness: 1.0,
                      dashLength: 4.0,
                      dashColor: AppColors.black,
                      dashRadius: 0.0,
                      dashGapLength: 4.0,
                      dashGapColor: Colors.transparent,
                      dashGapRadius: 0.0,
                    ),
                  ],
                ).px(20).py(8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: AppColors.white,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.facebook,
                        size: 30,
                        color: AppColors.blueLight,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      AppStrings.facebook.text.size(16).black.make().p12(),
                    ],
                  ).px(10),
                ).py(10).px(20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: AppColors.white,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        ImagePaths.google,
                        width: 25,
                        height: 25,
                        fit: BoxFit.fill,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      AppStrings.google.text.size(16).black.make().p12(),
                    ],
                  ).px(10),
                ).py(10).px(20),
                Container(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.register);
                    },
                    child: RichText(
                      text: TextSpan(
                        text: AppStrings.donthaveAccount,
                        style:
                            const TextStyle(fontSize: 13, color: Colors.white),
                        children: <TextSpan>[
                          TextSpan(
                              text: ' ${AppStrings.signUp}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: AppColors.red)),
                        ],
                      ),
                    ).py(10),
                  ),
                ).px(20)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
