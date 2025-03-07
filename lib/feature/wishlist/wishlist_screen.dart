import 'package:bookia/core/constants/assets-manager.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/core/widgets/custom_Button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, 
        title: Text('Wishlist')),
      body: Padding(
        padding: const EdgeInsets.all(20),
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
                      Text('\$285', 
                      style: getSmallTextStyle()),
                      Gap(27),
                      Align(
                        alignment: Alignment.centerRight,
                        child: CustomButton(
                          text: 'Add To Cart',
                          onPressed: () {},
                          width: 181,
                          height: 45,
                        ),
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
                      Text('\$285', 
                      style: getSmallTextStyle()),
                      Gap(27),
                      Align(
                        alignment: Alignment.centerRight,
                        child: CustomButton(
                          text: 'Add To Cart',
                          onPressed: () {},
                          width: 181,
                          height: 45,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
