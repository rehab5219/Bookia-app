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
        ),
      ),
    );
  }
}
