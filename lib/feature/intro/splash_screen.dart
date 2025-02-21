import 'package:bookia/core/constants/assets-manager.dart';
import 'package:bookia/core/extensions/navigator.dart';
import 'package:bookia/core/utils/text_styles.dart';
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
  void initState(){
    super.initState();

    Future.delayed(const Duration(seconds: 3),(){
      context.pushReplacement(WelcomeScreen());
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AssetsManager.logoSvg,
              width: 210,
            ),
            const Gap(10),
            Text(
              'Order Your Book Now!',
              style: getBodyTextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
