import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/core/widgets/custom_Button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CongratsScreen extends StatelessWidget {
  const CongratsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/Sticker.png', width: 150),
            Gap(20),
            Text('SUCCESS!!', style: getHeadLineTextStyle()),
            Gap(10),
            Text('Your order will be delivered soon.'),
            Gap(5),
            Text('Thank you for choosing our app!'),
            Gap(20),
            CustomButton(
              onPressed: () {},
              text: 'Back To Home',
              width: 330,
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}
