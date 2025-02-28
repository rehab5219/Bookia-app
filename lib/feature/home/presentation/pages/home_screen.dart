import 'package:bookia/core/constants/assets-manager.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/core/widgets/dialogs.dart';
import 'package:bookia/feature/home/data/models/best_sellers_response/best_sellers_response.dart';
import 'package:bookia/feature/home/data/models/best_sellers_response/product.dart';
import 'package:bookia/feature/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/feature/home/presentation/cubit/home_states.dart';
import 'package:bookia/feature/home/presentation/widgets/book_container.dart';
import 'package:bookia/feature/home/presentation/widgets/home_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(AssetsManager.logoSvg, width: 110),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AssetsManager.notificationSvg),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AssetsManager.searchSvg),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            var cubit = context.read<HomeCubit>();
            if (state is BestSellerErrorState) {
              Navigator.pop(context);
              showErrorToast(context, state.error);
            } else if (state is BestSellerSuccessState) {
                Product.fromJson;
            } else if (state is BestSellerLoadingState) {
              showLoadingDialog(context);
            }
            
            return Column(
              children: [
                HomeBanner(),
                Gap(15),
                Row(
                  children: [Text('Popular Books', style: getBodyTextStyle())],
                ),
                Gap(15),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 15 / 25,
                    padding: EdgeInsets.all(5),
                    children: List.generate(4, (index) {
                      return BookContainer();
                    }),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
