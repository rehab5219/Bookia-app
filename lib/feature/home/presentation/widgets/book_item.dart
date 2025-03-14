import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/core/widgets/custom_Button.dart';
import 'package:bookia/feature/home/data/models/best_sellers_response/product.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BookItem extends StatelessWidget {
  const BookItem({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Hero(
              tag: product.id ?? '',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: product.image ?? '',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
          ),
          Gap(10),
          Text(
            product.name ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: getBodyTextStyle(),
          ),
          Gap(10),
          Row(
            children: [
              Text(
                '\$${product.priceAfterDiscount}',
                style: getSmallTextStyle(),
              ),
              const Spacer(),
              CustomButton(
                height: 30,
                bgColor: AppColors.darkColor,
                width: 80,
                radius: 4,
                text: 'Buy',
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
