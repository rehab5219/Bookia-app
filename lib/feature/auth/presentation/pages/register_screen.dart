import 'package:bookia/core/constants/assets-manager.dart';
import 'package:bookia/core/extensions/navigator.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/core/widgets/custom_Button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import '../../../../core/utils/app_colors.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
        child: Column(
          children: [
            Text(
              'Hello! Register to get started',
              style: getHeadLineTextStyle(),
            ),
            const Gap(30),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Username'
              ),
            ),
            const Gap(15),
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
            const Gap(15),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Confirm Password',
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
              text: 'Register',
              onPressed: (){},
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: getSmallTextStyle(),
                ),
                const Gap(5),
                TextButton(
                  onPressed: () {
                    context.pushReplacement(RegisterScreen());
                  },
                  child: Text(
                    'Login Now',
                    style: getSmallTextStyle(color: AppColors.primaryColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
