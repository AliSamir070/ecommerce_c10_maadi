import 'package:dartz/dartz.dart';
import 'package:ecommerce_c10_maadi/data/model/subcategories_response/SubCategoriesResponse.dart';

abstract class SubCategoriesDatasource{
  Future<Either<SubCategoriesResponse,String>> getSubCategories(String categoryId);
}