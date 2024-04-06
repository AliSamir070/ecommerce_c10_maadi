import 'package:dartz/dartz.dart';
import 'package:ecommerce_c10_maadi/domain/entites/BrandEntity.dart';

abstract class BrandsRepo{
  Future<Either<List<BrandEntity> , String>> getBrands();
}