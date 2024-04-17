import 'package:ecommerce_c10_maadi/core/utils/assets_manager.dart';
import 'package:ecommerce_c10_maadi/domain/entites/SubcategoryEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SubCategoryWidget extends StatelessWidget {
  SubcategoryEntity subcategory;
  SubCategoryWidget({super.key,required this.subcategory});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70.h,
          width: 70.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            color: Theme.of(context).colorScheme.primary
          ),
          child: SvgPicture.asset(
            AssetsManager.route,
            colorFilter: ColorFilter.mode(Colors.white,BlendMode.srcIn ),
          ),
        ),
        SizedBox(height: 8.h,),
        Text(
          subcategory.name??"",
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400
          ),
        )
      ],
    );
  }
}
