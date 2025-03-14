import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/feature/profile/models/profile_model.dart';
import 'package:flutter/material.dart';

class HomeContainer extends StatelessWidget {
  final ProfileModel data;
  const HomeContainer({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 50,
        width: 300,
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: AppColors.darkColor)],
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          children: [
            Text(data.text, style: getSmallTextStyle()),
            Icon(Icons.arrow_forward),
          ],
        ),
      ),
    );
  }
}
