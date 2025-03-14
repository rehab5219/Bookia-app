import 'package:bookia/core/constants/assets-manager.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/core/widgets/custom_Button.dart';
import 'package:bookia/core/widgets/dialogs.dart';
import 'package:bookia/feature/home/data/models/best_sellers_response/product.dart';
import 'package:bookia/feature/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/feature/home/presentation/cubit/home_states.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      listener: (context, state) {
        if(state is AddToWishlistSuccessState){
          Navigator.pop(context);
          showSuccessToast(context, 'Added To Wishlist');
        }else if(state is AddToWishlistLoadingState){
          showLoadingDialog(context);
        }else if(state is AddToWishlistErrorState){
          Navigator.pop(context);
          showErrorToast(context, state.error);
        }
      },
      child: Scaffold(
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
              const Spacer(),
              IconButton(
                onPressed: () {
                  context.read<HomeCubit>().addToWishlist(product.id ?? 0);
                },
                icon: SvgPicture.asset(AssetsManager.bookmarkSvg),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Hero(
                    tag: product.id ?? '',
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl: product.image ?? '',
                        fit: BoxFit.cover,
                        width: 200,
                      ),
                    ),
                  ),
                  Gap(10),
                  Text(
                    product.name ?? '',
                    style: getTitleTextStyle(color: AppColors.primaryColor),
                  ),
                  Gap(10),
                  Text(product.category ?? '', style: getBodyTextStyle()),
                  Gap(20),
                  Text(
                    product.description ?? '',
                    textAlign: TextAlign.justify,
                    style: getSmallTextStyle(),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
            child: Row(
              children: [
                Text(
                  '\$${product.priceAfterDiscount}',
                  style: getTitleTextStyle(),
                ),
                const Spacer(),
                CustomButton(
                  bgColor: AppColors.darkColor,
                  width: 200,
                  radius: 8,
                  text: 'Add To Cart',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
