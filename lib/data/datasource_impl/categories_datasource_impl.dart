import 'package:dartz/dartz.dart';
import 'package:ecommerce_c10_maadi/core/api/api_manager.dart';
import 'package:ecommerce_c10_maadi/core/api/endpoints.dart';
import 'package:ecommerce_c10_maadi/data/model/categories_response/CategoriesResponse.dart';
import 'package:injectable/injectable.dart';

import '../datasource_contract/categories_datasource.dart';
@Injectable(as: CategoriesDataSource)
class CategoriesDataSourceImpl extends CategoriesDataSource{
  ApiManager apiManager;
  @factoryMethod
  CategoriesDataSourceImpl(this.apiManager);
  @override
  Future<Either<CategoriesResponse, String>> getCategories() async{
    try{
      var response = await apiManager.getRequest(endpoint: Endpoints.categoriesEndpoint);
      CategoriesResponse categoriesResponse = CategoriesResponse.fromJson(response.data);
      return Left(categoriesResponse);
    }catch(error){
      return Right(error.toString());
    }
  }

}