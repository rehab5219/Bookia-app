import 'package:bookia/core/constants/assets-manager.dart';
import 'package:bookia/core/constants/constants.dart';
import 'package:bookia/core/extensions/navigator.dart';
import 'package:bookia/core/services/local_storage.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/feature/home/presentation/pages/main_app_screen.dart';
import 'package:bookia/feature/intro/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    String? token = AppLocalStorage.getData(AppConstants.kToken);

    Future.delayed(const Duration(seconds: 3), () {
      if (token != null) {
        context.pushReplacement(WelcomeScreen());
      } else {
        context.pushReplacement(MainAppScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AssetsManager.logoSvg, width: 210),
            const Gap(10),
            Text('Order Your Book Now!', style: getBodyTextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
