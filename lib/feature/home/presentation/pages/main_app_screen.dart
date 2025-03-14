import 'package:bookia/core/constants/assets-manager.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/feature/cart/presentation/pages/cart_screen.dart';
import 'package:bookia/feature/home/presentation/pages/home_screen.dart';
import 'package:bookia/feature/profile/presentation/pages/profile_screen.dart';
import 'package:bookia/feature/wishlist/presentation/pages/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class MainAppScreen extends StatefulWidget {
  const MainAppScreen({super.key});

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  List<Widget> views = [
    HomeScreen(),
    WishlistScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: views[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.greyColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: currentPage,

        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },

        items: [
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              AssetsManager.homeSvg,
              colorFilter: ColorFilter.mode(
                AppColors.primaryColor,
                BlendMode.srcIn,
              ),
            ),
            icon: SvgPicture.asset(AssetsManager.homeSvg),
            label: '',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              AssetsManager.bookmarkSvg,
              colorFilter: ColorFilter.mode(
                AppColors.primaryColor,
                BlendMode.srcIn,
              ),
            ),
            icon: SvgPicture.asset(AssetsManager.bookmarkSvg),
            label: '',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              AssetsManager.cartSvg,
              colorFilter: ColorFilter.mode(
                AppColors.primaryColor,
                BlendMode.srcIn,
              ),
            ),
            icon: SvgPicture.asset(AssetsManager.cartSvg),
            label: '',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              AssetsManager.profileSvg,
              colorFilter: ColorFilter.mode(
                AppColors.primaryColor,
                BlendMode.srcIn,
              ),
            ),
            icon: SvgPicture.asset(AssetsManager.profileSvg),
            label: '',
          ),
        ],
      ),
    );
  }
}
