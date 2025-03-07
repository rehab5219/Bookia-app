import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/feature/cart/cart_screen.dart';
import 'package:bookia/feature/home/presentation/pages/home_screen.dart';
import 'package:bookia/feature/profile/presentation/profile_screen.dart';
import 'package:bookia/feature/wishlist/wishlist_screen.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() => _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
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
        currentIndex: currentPage,

        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color:AppColors.primaryColor),
            // icon: SvgPicture.asset(AssetsManager.homeSvg),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark,color:AppColors.primaryColor),
            // icon: SvgPicture.asset(AssetsManager.bookmarkSvg),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_travel_sharp,color:AppColors.primaryColor) ,
            // icon: SvgPicture.asset(AssetsManager.cartSvg),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,color:AppColors.primaryColor),
            // icon: SvgPicture.asset(AssetsManager.profileSvg),
            label: '',
          ),
        ],
      ),
    );
  }
}