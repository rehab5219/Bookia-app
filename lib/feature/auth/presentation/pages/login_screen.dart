import 'package:bookia/core/constants/assets-manager.dart';
import 'package:bookia/core/extensions/navigator.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/core/widgets/custom_Button.dart';
import 'package:bookia/feature/auth/presentation/pages/register_screen.dart';
import 'package:bookia/feature/intro/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(AssetsManager.back, width: 40, height: 40),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Welcome back! Glad to see you, Again!',
                style: getHeadLineTextStyle(),
              ),
              const Gap(30),
              TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Email'
                  ),
              ),
              const Gap(15),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Password',
                  suffixIconConstraints: BoxConstraints(
                    maxHeight: 30, maxWidth: 40, minHeight: 30, minWidth: 30,
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: SvgPicture.asset(
                      AssetsManager.eyeSvg,
                    ),
                  ),
                ),
              ),
              const Gap(30),
              CustomButton(
                  text: 'Login', onPressed: (){},
              ),
              const Gap(30),
              Row(
                children: [
                  Expanded(child: Divider()),
                  Gap(10),
                  Text(
                    'Or Login with',
                    style: getSmallTextStyle(),
                  ),
                  Gap(10),
                  Expanded(child: Divider()
                  ),
                ],
              ),
              const Gap(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.borderColor),
                      ),
                      child: SvgPicture.asset(AssetsManager.facebookSvg),
                    ),
                  ),
                  const Gap(10),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.borderColor),
                      ),
                      child: SvgPicture.asset(AssetsManager.googleSvg),
                    ),
                  ),
                  const Gap(10),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.borderColor),
                      ),
                      child: SvgPicture.asset(AssetsManager.appleSvg),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don’t have an account?',
                    style: getSmallTextStyle(),
                  ),
                  const Gap(5),
                  TextButton(
                    onPressed: () {
                      context.pushReplacement(RegisterScreen());
                    },
                    child: Text(
                      'Register Now',
                      style: getSmallTextStyle(color: AppColors.primaryColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
