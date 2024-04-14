import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_c10_maadi/domain/entites/BrandEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandWidget extends StatelessWidget {
  BrandEntity  brand;
  BrandWidget({super.key,required this.brand});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
          imageUrl: brand.image??"",
          errorWidget: (context, url, error) => Icon(Icons.error,size: 25.sp,),
          placeholder: (context, url) => Center(child: CircularProgressIndicator(),),
          imageBuilder: (context, imageProvider) {
            return Container(
              height: 100.h,
              width: 100.w,
              decoration: BoxDecoration(
                image: DecorationImage(image: imageProvider)
              ),
            );
          },
        ),
        SizedBox(height: 8.h,),
        Text(brand.name??"",maxLines: 2,overflow: TextOverflow.ellipsis,)
      ],
    );
  }
}
