import 'package:bookia/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'app_colors.dart';

TextStyle getHeadLineTextStyle({double? fontSize, Color? color}) {
  return TextStyle(
    fontFamily: AppConstants.fontFamily,
    color: color ?? AppColors.darkColor,
    fontSize: fontSize ?? 30,
  );
}

TextStyle getTitleTextStyle({double? fontSize, Color? color}) {
  return TextStyle(
    fontFamily: AppConstants.fontFamily,
    color: color ?? AppColors.darkColor,
    fontSize: fontSize ?? 24,
  );
}

TextStyle getBodyTextStyle({double? fontSize, Color? color}) {
  return TextStyle(
    fontFamily: AppConstants.fontFamily,
    color: color ?? AppColors.darkColor,
    fontSize: fontSize ?? 18,
  );
}

TextStyle getSmallTextStyle({double? fontSize, Color? color}) {
  return TextStyle(
    fontFamily: AppConstants.fontFamily,
    color: color ?? AppColors.darkColor,
    fontSize: fontSize ?? 16,
  );
}
