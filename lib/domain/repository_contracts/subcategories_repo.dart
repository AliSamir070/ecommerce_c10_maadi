import 'package:dartz/dartz.dart';
import 'package:ecommerce_c10_maadi/domain/entites/SubcategoryEntity.dart';

abstract class SubCategoriesRepo{
  Future<Either<List<SubcategoryEntity>,String>> getSubCategories(String categoryId);
}