import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_c10_maadi/core/utils/assets_manager.dart';
import 'package:ecommerce_c10_maadi/core/utils/strings_manager.dart';
import 'package:ecommerce_c10_maadi/domain/entites/ProductEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
class ProductWidget extends StatelessWidget {
  ProductEntity productEntity;
  ProductWidget({super.key,required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 191.w,
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
          width: 2.w
        ),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.r),
                  topRight: Radius.circular(15.r)
                ),
                child: CachedNetworkImage(
                    imageUrl: productEntity.imageCover??"",
                    height: 128.h,
                    width: 191.w,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Center(child: CircularProgressIndicator(),),
                    errorWidget: (context, url, error) => Center(child: Icon(Icons.error),),
                ),
              ),
              SvgPicture.asset(
                AssetsManager.addWhishlist,
                height: 30.h,
                width: 30.w,
              )
            ],
          ),
          SizedBox(height: 8.h,),
          Text(
            "${productEntity.title??""}\n",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400
            ),
          ),
          SizedBox(height: 8.h,),
          productEntity.priceAfterDiscount==null
              ?Text(
            "EGP ${productEntity.price}",
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400
            ),
          )
              :Row(
            children: [
              Text(
                "EGP ${productEntity.priceAfterDiscount}",
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400
                ),
              ),
              SizedBox(width: 16.w,),
              Text(
                "${productEntity.price}EGP",
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.6),
                    decoration: TextDecoration.lineThrough,
                    decorationColor: Theme.of(context).colorScheme.primary.withOpacity(0.6)
                ),
              )
            ],
          ),
          SizedBox(height: 8.h,),
          Row(
            children: [
              Text(
                "${StringsManager.review} (${productEntity.ratingsAverage})",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400
                ),
              ),
              SvgPicture.asset(
                AssetsManager.star,
                height: 15.h,
                width: 15.w,
              ),
              Spacer(),
              SvgPicture.asset(
                AssetsManager.plus,
                height: 30.h,
                width: 30.w,
              )
            ],
          ),
        ],
      ),
    );
  }
}
