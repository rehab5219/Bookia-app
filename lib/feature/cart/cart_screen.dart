import 'dart:math';

import 'package:bookia/core/constants/assets-manager.dart';
import 'package:bookia/core/extensions/navigator.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/core/widgets/custom_Button.dart';
import 'package:bookia/feature/cart/congrats_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, 
        title: Text('My Cart')
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(AssetsManager.cover),
                  Gap(20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('The Republic', style: getSmallTextStyle()),
                            SvgPicture.asset(AssetsManager.shape),
                          ],
                        ),
                        Gap(9),
                        Text('\$285', style: getSmallTextStyle()),
                        Gap(27),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: AppColors.borderColor,
                                ),
                                child: Icon(Icons.add),
                              ),
                            ),
                            Gap(10),
                            Text('01'),
                            Gap(10),
                            IconButton(
                              onPressed: () {},
                              icon: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: AppColors.borderColor,
                                ),
                                child: SvgPicture.asset(AssetsManager.min),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Gap(16),
              Divider(),
              Gap(20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(AssetsManager.cover),
                  Gap(20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('The Republic', style: getSmallTextStyle()),
                            SvgPicture.asset(AssetsManager.shape),
                          ],
                        ),
                        Gap(9),
                        Text('\$285', style: getSmallTextStyle()),
                        Gap(27),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: AppColors.borderColor,
                                ),
                                child: Icon(Icons.add),
                              ),
                            ),
                            Gap(10),
                            Text('01'),
                            Gap(10),
                            IconButton(
                              onPressed: () {},
                              icon: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: AppColors.borderColor,
                                ),
                                child: SvgPicture.asset(AssetsManager.min),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Divider(),
              Gap(200),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total:',
                    style: getBodyTextStyle().copyWith(
                      color: AppColors.greyColor,
                    ),
                  ),
                  Gap(170),
                  Text('\$ 95.00', style: getBodyTextStyle()),
                ],
              ),
              Gap(19),
              CustomButton(
                text: 'Checkout',
                onPressed: () {
                  context.pushTo(CongratsScreen());
                },
                width: 330,
                height: 55,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
