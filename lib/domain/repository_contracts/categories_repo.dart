import 'package:dartz/dartz.dart';
import 'package:ecommerce_c10_maadi/domain/entites/CategoryEntity.dart';

abstract class CategoriesRepo{
  Future<Either<List<CategoryEntity>, String>> getCategories();
}