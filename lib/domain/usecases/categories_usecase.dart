import 'package:dartz/dartz.dart';
import 'package:ecommerce_c10_maadi/domain/repository_contracts/categories_repo.dart';
import 'package:injectable/injectable.dart';

import '../entites/CategoryEntity.dart';
@injectable
class CategoriesUseCase{
  CategoriesRepo categoriesRepo;
  @factoryMethod
  CategoriesUseCase(this.categoriesRepo);

  Future<Either<List<CategoryEntity>, String>> call(){
    return categoriesRepo.getCategories();
  }
}