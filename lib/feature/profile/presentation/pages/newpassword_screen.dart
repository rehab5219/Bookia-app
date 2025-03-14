import 'package:bookia/core/constants/assets-manager.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/core/widgets/custom_Button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class NewpasswordScreen extends StatefulWidget {
  const NewpasswordScreen({super.key});

  @override
  State<NewpasswordScreen> createState() => _NewpasswordScreenState();
}

class _NewpasswordScreenState extends State<NewpasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(AssetsManager.back, width: 40, height: 40),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Text('New Password', style: getTitleTextStyle()),
              Gap(70),
              TextField(
                decoration: InputDecoration(hintText: 'Current Password'),
              ),
              Gap(26),
              TextField(decoration: InputDecoration(hintText: 'New Password')),
              Gap(26),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Confirm password',
                  suffixIconConstraints: BoxConstraints(
                    maxHeight: 30,
                    maxWidth: 40,
                    minHeight: 30,
                    minWidth: 30,
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: SvgPicture.asset(AssetsManager.eyeSvg),
                  ),
                ),
              ),
              Spacer(),
              CustomButton(onPressed: () {}, text: 'Update Password'),
            ],
          ),
        ),
      ),
    );
  }
}
