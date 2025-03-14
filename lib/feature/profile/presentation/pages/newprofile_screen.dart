import 'package:bookia/core/constants/assets-manager.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/core/widgets/custom_Button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class NewprofileScreen extends StatelessWidget {
  const NewprofileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Image.asset(AssetsManager.back, width: 60, height: 60),
        title: Text('Edit Profile', style: getBodyTextStyle()),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Stack(
            children: [
              Column(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(AssetsManager.welcome),
                    radius: 60,
                  ),
                  PositionedDirectional(
                    top: 20,
                    // bottom: 20,
                    child: CircleAvatar(radius: 15),
                  ),
                  Gap(50),
                  TextField(decoration: InputDecoration(hintText: 'Full Name')),
                  Gap(26),
                  TextField(decoration: InputDecoration(hintText: 'Phone')),
                  Gap(26),
                  TextField(decoration: InputDecoration(hintText: 'Address')),
                  Spacer(),
                  CustomButton(onPressed: () {}, text: 'Update Profile'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
