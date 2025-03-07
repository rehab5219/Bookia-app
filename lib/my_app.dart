import 'package:bookia/core/constants/constants.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/feature/cart/congrats_screen.dart';
import 'package:bookia/feature/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/feature/profile/presentation/profile_screen.dart';
import 'package:bookia/feature/intro/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: AppConstants.fontFamily,
          scaffoldBackgroundColor: AppColors.whiteColor,
          appBarTheme: AppBarTheme(backgroundColor: AppColors.whiteColor),
          inputDecorationTheme: InputDecorationTheme(
            fillColor: AppColors.accentColor,
            filled: true,
            hintStyle: getSmallTextStyle(color: AppColors.greyColor),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.borderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.borderColor),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.redColor),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.redColor),
            ),
          ),
        ),
        home: SplashScreen(),
      ),
    );
  }
}
