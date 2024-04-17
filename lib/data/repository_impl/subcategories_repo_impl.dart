import 'package:dartz/dartz.dart';
import 'package:ecommerce_c10_maadi/data/datasource_contract/subcategories_datasource.dart';
import 'package:ecommerce_c10_maadi/domain/entites/SubcategoryEntity.dart';
import 'package:ecommerce_c10_maadi/domain/repository_contracts/subcategories_repo.dart';
import 'package:injectable/injectable.dart';

import '../model/products_response/SubcategoryModel.dart';

@Injectable(as: SubCategoriesRepo)
class SubCategoriesRepoImpl extends SubCategoriesRepo{
  SubCategoriesDatasource apiDatasource;
  @factoryMethod
  SubCategoriesRepoImpl(this.apiDatasource);
  @override
  Future<Either<List<SubcategoryEntity>, String>> getSubCategories(String categoryId) async{
    var result = await apiDatasource.getSubCategories(categoryId);
    return result.fold((response) {
      List<SubcategoryModel> subcategoriesModelList = response.data??[];
      List<SubcategoryEntity> subCategoryEntityList = subcategoriesModelList.map((subcategoryModel)=>subcategoryModel.toSubCategoryEntity()).toList();
      return Left(subCategoryEntityList);
    }, (error){
      return Right(error);
    });
  }

}