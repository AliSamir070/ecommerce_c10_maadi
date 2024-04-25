import 'package:dartz/dartz.dart';
import 'package:ecommerce_c10_maadi/core/api/api_manager.dart';
import 'package:ecommerce_c10_maadi/core/api/endpoints.dart';
import 'package:ecommerce_c10_maadi/core/local/prefs_helper.dart';
import 'package:ecommerce_c10_maadi/data/datasource_contract/cart_datasource.dart';
import 'package:ecommerce_c10_maadi/data/model/cart_response/CartResponseModel.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: CartDataSource)
class CartDataSourceImpl extends CartDataSource{
  ApiManager apiManager;
  @factoryMethod
  CartDataSourceImpl(this.apiManager);
  @override
  Future<Either<CartResponseModel, String>> AddToCart({required String productId}) async{
    try{
      var response = await apiManager.postRequest(endpoint: Endpoints.cartEndpoint,body: {
        "productId":productId
      },headers: {
        "token":PrefsHelper.getToken()
      });
      return Left(CartResponseModel.fromJson(response.data));
    }catch(error){
      return Right(error.toString());
    }
  }

}