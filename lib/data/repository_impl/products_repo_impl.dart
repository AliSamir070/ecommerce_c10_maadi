import 'package:dartz/dartz.dart';
import 'package:ecommerce_c10_maadi/data/datasource_contract/products_datasource.dart';
import 'package:ecommerce_c10_maadi/data/model/products_response/ProductModel.dart';
import 'package:ecommerce_c10_maadi/domain/entites/ProductEntity.dart';
import 'package:ecommerce_c10_maadi/domain/repository_contracts/products_repo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: ProductsRepo)
class ProductsRepoImpl extends ProductsRepo{
  ProductsDataSource apiDatasource;
  @factoryMethod
  ProductsRepoImpl(this.apiDatasource);
  @override
  Future<Either<List<ProductEntity>, String>> getProducts({String? sort}) async{
    var result = await apiDatasource.getProducts(sort: sort);
    return result.fold((response) {
      List<ProductModel> productModelList = response.data??[];
      List<ProductEntity> productEntityList = productModelList.map((productModel)=>productModel.ConvertToProductEntity()).toList();
      return Left(productEntityList);
    }, (error){
      return Right(error);
    });
  }

}