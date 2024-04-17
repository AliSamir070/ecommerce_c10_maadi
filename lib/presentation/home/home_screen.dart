import 'package:ecommerce_c10_maadi/presentation/home/home_view_model.dart';
import 'package:ecommerce_c10_maadi/presentation/home/tabs/categories_tab/CategoriesTab.dart';
import 'package:ecommerce_c10_maadi/presentation/home/tabs/home_tab/homeTab.dart';
import 'package:ecommerce_c10_maadi/presentation/home/tabs/profile_tab/ProfileTab.dart';
import 'package:ecommerce_c10_maadi/presentation/home/tabs/whishlit_tab/WhishlistTab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/utils/assets_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static List<Widget> tabs = [
    HomeTab(),
    CategoriesTab(),
    WhishlistTab(),
    ProfileTab()
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeViewModel, HomeStates>(
  builder: (context, state) {
    HomeViewModel homeViewModel = HomeViewModel.get(context);
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(
          AssetsManager.route,
          height: 22.h,
          width: 66.w,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: homeViewModel.currentTabIndex,
          onTap: (newIndex) {
            homeViewModel.changeBottomNavTab(newIndex);
          },
          showUnselectedLabels: false,
          showSelectedLabels: false,
          items: [
            BottomNavigationBarItem(icon: SvgPicture.asset(
              AssetsManager.homeUnSelected,
              height: 40.h,
              width: 40.w,
            ),activeIcon: SvgPicture.asset(
              AssetsManager.homeSelected,
              height: 40.h,
              width: 40.w,
            ),backgroundColor: Theme.of(context).colorScheme.primary,label: ''),
            BottomNavigationBarItem(icon: SvgPicture.asset(
              AssetsManager.categoriesUnSelected,
              height: 40.h,
              width: 40.w,
            ),activeIcon: SvgPicture.asset(
              AssetsManager.categoriesSelected,
              height: 40.h,
              width: 40.w,
            ),backgroundColor: Theme.of(context).colorScheme.primary,label: ''),
            BottomNavigationBarItem(icon: SvgPicture.asset(
              AssetsManager.whishlistUnSelected,
              height: 40.h,
              width: 40.w,
            ),activeIcon: SvgPicture.asset(
              AssetsManager.whishlistSelected,
              height: 40.h,
              width: 40.w,
            ),backgroundColor: Theme.of(context).colorScheme.primary,label: ''),
            BottomNavigationBarItem(icon: SvgPicture.asset(
              AssetsManager.profileUnSelected,
              height: 40.h,
              width: 40.w,
            ),activeIcon: SvgPicture.asset(
              AssetsManager.profileSelected,
              height: 40.h,
              width: 40.w,
            ),backgroundColor: Theme.of(context).colorScheme.primary,label: ''),
          ]
      ),
      body: tabs[homeViewModel.currentTabIndex],
    );
  },
);
  }
}
