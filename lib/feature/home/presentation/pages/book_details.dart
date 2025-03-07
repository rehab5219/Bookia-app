import 'package:bookia/core/constants/assets-manager.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class BookDetails extends StatelessWidget {
  const BookDetails({super.key});

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
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AssetsManager.bookmarkSvg),
          ),
        ],
      ),
      body: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Image.asset(AssetsManager.rectangle),
              Gap(11),
              Text('Black Heart', style: getHeadLineTextStyle()),
              Text(
                'Broché',
                style: getSmallTextStyle().copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
              Gap(16),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                maxLines: 10,
              ),
              Gap(50),
              Row(
                children: [
                  Text(
                    '\$285',
                    style: getSmallTextStyle(),
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: (){}, 
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 60, vertical: 18),
                      backgroundColor: AppColors.darkColor,
                     shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                     ), 
                    ),
                    child: Text(
                      'Add To Cart',
                      style: getSmallTextStyle().copyWith(
                        color: AppColors.whiteColor,
                      ),
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
