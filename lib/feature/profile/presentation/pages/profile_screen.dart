import 'package:bookia/core/constants/assets-manager.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/feature/profile/models/profile_model.dart';
import 'package:bookia/feature/profile/presentation/widgets/home_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Profile', style: getTitleTextStyle()),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AssetsManager.logout),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(28),
        child: Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(AssetsManager.welcome),
                    radius: 40,
                  ),
                  Gap(13),
                  Text('Sayed Abdul-Aziz', style: getBodyTextStyle()),
                ],
              ),
              Gap(6),
              Text(
                'sayed@gmail.com',
                style: getSmallTextStyle().copyWith(color: AppColors.greyColor),
              ),
              ListView.separated(
                itemBuilder:
                    (context, index) => HomeContainer(data: data[index]),
                separatorBuilder: (context, index) => Gap(10),
                itemCount: data.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
