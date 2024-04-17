import 'package:dartz/dartz.dart';
import 'package:ecommerce_c10_maadi/core/api/api_manager.dart';
import 'package:ecommerce_c10_maadi/core/api/endpoints.dart';
import 'package:ecommerce_c10_maadi/data/datasource_contract/subcategories_datasource.dart';
import 'package:ecommerce_c10_maadi/data/model/subcategories_response/SubCategoriesResponse.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:SubCategoriesDatasource)
class SubCategoriesDatasourceImpl extends SubCategoriesDatasource{
  ApiManager apiManager;
  @factoryMethod
  SubCategoriesDatasourceImpl(this.apiManager);
  @override
  Future<Either<SubCategoriesResponse, String>> getSubCategories(String categoryId) async{
    try{
      var response = await apiManager.getRequest(endpoint: Endpoints.subCategoriesEndpoint(categoryId));
      return Left(SubCategoriesResponse.fromJson(response.data));
    }catch(error){
      return Right(error.toString());
    }
  }

}