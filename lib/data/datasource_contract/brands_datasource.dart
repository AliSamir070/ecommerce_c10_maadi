import 'package:dartz/dartz.dart';
import 'package:ecommerce_c10_maadi/data/model/brands_response/BrandsResponse.dart';

abstract class BrandsDataSource{
  Future<Either<BrandsResponse , String>>getBrands();
}