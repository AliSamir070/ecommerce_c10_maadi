import 'package:ecommerce_c10_maadi/domain/entites/CategoryEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategorySelectionWidget extends StatelessWidget {
  CategoryEntity categoryEntity;
  bool isSelected;
  CategorySelectionWidget({super.key,required this.categoryEntity,this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72.h,
      decoration: BoxDecoration(
        color: isSelected ?Colors.white:Colors.transparent,
        borderRadius: BorderRadius.circular(10.r)
      ),
      child: Padding(
        padding: REdgeInsets.all(5.0),
        child: Row(
          children: [
            Visibility(
              visible: isSelected,
              child: Container(
                width: 7.w,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(20.r)
                ),
              ),
            ),
            SizedBox(width: 5.w,),
            Text(
              categoryEntity.name??'',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500
              ),
            )
          ],
        ),
      ),
    );
  }
}
