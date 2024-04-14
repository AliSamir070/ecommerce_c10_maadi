import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_c10_maadi/core/utils/assets_manager.dart';
import 'package:ecommerce_c10_maadi/core/utils/strings_manager.dart';
import 'package:ecommerce_c10_maadi/presentation/home/tabs/home_tab/view_model/HomeTabViewModel.dart';
import 'package:ecommerce_c10_maadi/presentation/home/tabs/home_tab/widgets/brands_list_widget.dart';
import 'package:ecommerce_c10_maadi/presentation/home/tabs/home_tab/widgets/categorieslist_widget.dart';
import 'package:ecommerce_c10_maadi/presentation/home/tabs/home_tab/widgets/category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/DI/di.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);
  static List<String> ads = [
    AssetsManager.ad1,
    AssetsManager.ad2,
    AssetsManager.ad3,
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeTabViewModel>(),
      child: Padding(
        padding: REdgeInsets.all(16.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: CarouselSlider.builder(
                itemCount: 3,
                options: CarouselOptions(
                    height: 200.h,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 0.8
                ),
                itemBuilder: (context, index, index2) =>
                    Image.asset(ads[index]),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 24.h,)),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    StringsManager.categories,
                    style: Theme
                        .of(context)
                        .textTheme
                        .headlineLarge,
                  ),
                  Text(
                    StringsManager.viewAll,
                    style: Theme
                        .of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 16.h,)),
            CategoriesLitWidget(),
            SliverToBoxAdapter(child: SizedBox(height: 24.h,)),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    StringsManager.brands,
                    style: Theme
                        .of(context)
                        .textTheme
                        .headlineLarge,
                  ),
                  Text(
                    StringsManager.viewAll,
                    style: Theme
                        .of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 16.h,)),
            SliverToBoxAdapter(
              child: BrandsListWidget(),
            )
          ],
        ),
      ),
    );
  }
}
