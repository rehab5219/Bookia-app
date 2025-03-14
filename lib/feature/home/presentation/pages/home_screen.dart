import 'package:bookia/core/constants/assets-manager.dart';
import 'package:bookia/feature/home/presentation/cubit/home_cubit.dart';

import 'package:bookia/feature/home/presentation/widgets/home_banner.dart';
import 'package:bookia/feature/home/presentation/widgets/popular_books_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Scaffold(
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
        body: SingleChildScrollView(
          child: Column(
            children: [HomeBanner(), Gap(10), PopularBooksBuilder()],
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
            if (state is BestSellerLoadingState) {
              return showLoadingDialog(context);
            } else if (state is BestSellerSuccessState) {
              return Column(
                children: [
                  HomeBanner(),
                  Gap(15),
                  Row(
                    children: [
                      Text('Popular Books', style: getBodyTextStyle()),
                    ],
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
            } else if (state is BestSellerLoadingState) {
              return showLoadingDialog(context);
            } else if (state is BestSellerErrorState) {
              Navigator.pop(context);
              return showErrorToast(context, state.error);
            } else {
              return Text('error');
            }
          },
        ),
      ),
    );
  }
}
