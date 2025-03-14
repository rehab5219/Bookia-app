import 'package:bookia/core/constants/assets-manager.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';



showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    builder:
        (context) => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Lottie.asset(AssetsManager.bookJson, width: 200)],
        ),
  );
}

showSuccessToast(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text), 
      backgroundColor: Colors.green,
    ),
  );
}

showErrorToast(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(text), backgroundColor: AppColors.primaryColor),
  );
}
