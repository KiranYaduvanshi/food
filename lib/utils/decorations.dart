import 'package:flutter/material.dart';

import 'app_colors.dart';

class CustomeBoxDecorations {
  static BoxDecoration circularBorderLightBlue() {
    return BoxDecoration(
      color: Colors.white,
      border: Border.all(color: AppColors.blueExtraLight),
      borderRadius: const BorderRadius.all(Radius.circular(15.0)),
    );
  }

  static BoxDecoration circularInputField(
      {Color borderColor = Colors.black, Color? backColor}) {
    return BoxDecoration(
      color: Colors.white,
      border: Border.all(color: borderColor),
      borderRadius: const BorderRadius.all(Radius.circular(25)),
    );
  }

  static BoxDecoration circularBorderLinearGradient() {
    return const BoxDecoration(
      gradient: LinearGradient(
          colors: [AppColors.blueDark, AppColors.blueExtraLight],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter),
      borderRadius: BorderRadius.all(Radius.circular(0.0)),
    );
  }

  static BoxDecoration circularAgree(
      {Color borderColor = Colors.black, required Color backColor}) {
    return BoxDecoration(
      color: backColor,
      borderRadius: const BorderRadius.all(Radius.circular(8)),
    );
  }

  static BoxDecoration squareDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.all(
        Radius.circular(10),
      ),
      boxShadow: [
        BoxShadow(color: Colors.grey.shade300, blurRadius: 3),
      ],
    );
  }
}
