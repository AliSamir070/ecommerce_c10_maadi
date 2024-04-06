import 'package:dartz/dartz.dart';
import 'package:ecommerce_c10_maadi/data/model/categories_response/CategoriesResponse.dart';

abstract class CategoriesDataSource{
  Future<Either<CategoriesResponse, String>> getCategories();
}