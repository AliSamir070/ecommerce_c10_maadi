import 'package:dartz/dartz.dart';
import 'package:ecommerce_c10_maadi/domain/repository_contracts/subcategories_repo.dart';
import 'package:injectable/injectable.dart';

import '../entites/SubcategoryEntity.dart';
@injectable
class GetSubcategoriesSpecificCategoryUseCase{
  SubCategoriesRepo subCategoriesRepo;
  @factoryMethod
  GetSubcategoriesSpecificCategoryUseCase(this.subCategoriesRepo);

  Future<Either<List<SubcategoryEntity>, String>> call(String categoryId)=>subCategoriesRepo.getSubCategories(categoryId);
}