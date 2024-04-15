import 'package:dartz/dartz.dart';
import 'package:ecommerce_c10_maadi/core/api/api_manager.dart';
import 'package:ecommerce_c10_maadi/data/datasource_contract/products_datasource.dart';
import 'package:ecommerce_c10_maadi/data/model/products_response/ProductsResponse.dart';
import 'package:injectable/injectable.dart';

import '../../core/api/endpoints.dart';

@Injectable(as: ProductsDataSource)
class ProductsDataSourceImpl extends ProductsDataSource{
  ApiManager apiManager;
  @factoryMethod
  ProductsDataSourceImpl(this.apiManager);
  @override
  Future<Either<ProductsResponse, String>> getProducts({String? sort}) async{
    try{
      var response = await apiManager.getRequest(endpoint: Endpoints.productsEndpoint,queryParameters: {
        "sort":sort
      });
      return Left(ProductsResponse.fromJson(response.data));
    }catch(error){
      return Right(error.toString());
    }
  }

}