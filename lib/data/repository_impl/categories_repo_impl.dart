import 'package:dartz/dartz.dart';
import 'package:ecommerce_c10_maadi/data/datasource_contract/categories_datasource.dart';
import 'package:ecommerce_c10_maadi/domain/entites/CategoryEntity.dart';
import 'package:ecommerce_c10_maadi/domain/repository_contracts/categories_repo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: CategoriesRepo)
class CategoriesRepoImpl extends CategoriesRepo{
  CategoriesDataSource apiDatasource;
  @factoryMethod
  CategoriesRepoImpl(this.apiDatasource);
  @override
  Future<Either<List<CategoryEntity>, String>> getCategories() async{
    var result = await  apiDatasource.getCategories();
    return result.fold((response) {
      var categoriesListModel = response.data??[];
      var categories = categoriesListModel.map((category) => category.toCategoryEntity()).toList();
      return Left(categories);
    }, (error){
      return Right(error);
    }
    );
  }

}