import 'package:dartz/dartz.dart';
import 'package:ecommerce_c10_maadi/core/api/api_manager.dart';
import 'package:ecommerce_c10_maadi/data/datasource_contract/brands_datasource.dart';
import 'package:ecommerce_c10_maadi/data/model/brands_response/BrandsResponse.dart';
import 'package:injectable/injectable.dart';

import '../../core/api/endpoints.dart';
@Injectable(as:  BrandsDataSource)
class BrandsDataSourceImpl extends BrandsDataSource{
  ApiManager apiManager;
  @factoryMethod
  BrandsDataSourceImpl(this.apiManager);
  @override
  Future<Either<BrandsResponse, String>> getBrands() async{
    try{
      var response = await apiManager.getRequest(endpoint: Endpoints.brandsEndpoint);
      BrandsResponse brandsResponse = BrandsResponse.fromJson(response.data);
      return Left(brandsResponse);
    }catch(error){
      return Right(error.toString());
    }
  }

}