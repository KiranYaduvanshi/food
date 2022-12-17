import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_user/authentication/auth_controller/registerController.dart';
import 'package:food_user/utils/app_colors.dart';
import 'package:food_user/utils/app_strings.dart';
import 'package:food_user/utils/inpuFieldDecoration.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class SignUpScren extends StatelessWidget {
  FocusNode fullName = FocusNode();
  FocusNode emailFn = FocusNode();
  FocusNode mobileFn = FocusNode();
  FocusNode passFn = FocusNode();
  FocusNode conPassFn = FocusNode();
  FocusNode myFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    RegisterContoller controller = Get.find();
    final bottom = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              SingleChildScrollView(
                reverse: true,
                padding: EdgeInsets.only(bottom: bottom),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                            alignment: Alignment.topCenter,
                            child: AppStrings.createAccount.text.bold
                                .size(20)
                                .make())
                        .py(20),
                    AppStrings.fullName.text.bold.size(12).make().px(20),
                    TextFormField(
                      controller: controller.nameController,
                      focusNode: myFocusNode,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
                      ],
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        return controller.handleName();
                      },
                      onFieldSubmitted: (String value) {
                        FocusScope.of(context).requestFocus(emailFn);
                      },
                      decoration: CustomeInputDecoration.formDecorationSquare(
                          "eg- Ajay", AppStrings.fullName),
                    ).px(20).py(8),
                    AppStrings.email.text.bold.size(12).make().px(20),
                    TextFormField(
                      controller: controller.emailController,
                      focusNode: emailFn,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp('[a-zA-Z0-9@.]')),
                      ],
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        return controller.handleEmail();
                      },
                      onFieldSubmitted: (String value) {
                        FocusScope.of(context).requestFocus(passFn);
                        fullName.unfocus();
                      },
                      decoration: CustomeInputDecoration.formDecorationSquare(
                          "example@gmail.com", AppStrings.email),
                    ).px(20).py8(),
                    AppStrings.password.text.bold.size(12).make().px(20),
                    TextFormField(
                      controller: controller.passwordController,
                      focusNode: passFn,
                      inputFormatters: [FilteringTextInputFormatter.deny(' ')],
                      obscureText: true,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        return controller.handlePassword();
                      },
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (String value) {
                        FocusScope.of(context).requestFocus(conPassFn);
                      },
                      decoration: CustomeInputDecoration.formDecorationSquare(
                          "**********", AppStrings.password),
                    ).px(20).py8(),
                    AppStrings.confirmPass.text.bold.size(12).make().px(20),
                    TextFormField(
                      controller: controller.conPssController,
                      focusNode: conPassFn,
                      inputFormatters: [FilteringTextInputFormatter.deny(' ')],
                      obscureText: true,
                      textInputAction: TextInputAction.done,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        return controller.handleConfirmPassword();
                      },
                      decoration: CustomeInputDecoration.formDecorationSquare(
                          "********", AppStrings.confirmPass),
                    ).px(20).py8(),
                  ],
                ),
              ).expand(),
              Container(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      child: Obx(
                        () => ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: AppColors.red,
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          onPressed: () {
                            controller.userRegistration();
                          },
                          child: controller.loading.value == true
                              ? Transform.scale(
                                  scale: .8,
                                  child: const CircularProgressIndicator(
                                      color: Colors.white))
                              : AppStrings.signUp.text.lg
                                  .color(AppColors.white)
                                  .bold
                                  .make()
                                  .py12(),
                        ),
                      ),
                    ).px(20).py8(),
                    InkWell(
                      onTap: () {},
                      child: RichText(
                        text: TextSpan(
                          text: AppStrings.alreadyAccount,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: AppStrings.signIn,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.red),
                            ),
                          ],
                        ),
                      ).py(10),
                    )
                  ],
                ).py(8),
              ).py(10)
            ],
          ),
        ),
      ),
    );
  }
}
