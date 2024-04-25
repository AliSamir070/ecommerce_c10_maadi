import 'package:dartz/dartz.dart';
import 'package:ecommerce_c10_maadi/core/api/api_manager.dart';
import 'package:ecommerce_c10_maadi/core/api/endpoints.dart';
import 'package:ecommerce_c10_maadi/data/datasource_contract/auth_datasource.dart';
import 'package:ecommerce_c10_maadi/data/model/auth_response/AuthResponseModel.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthDataSource)
class AuthDataSourceImpl extends AuthDataSource{
  ApiManager apiManager;
  @factoryMethod
  AuthDataSourceImpl(this.apiManager);
  @override
  Future<Either<AuthResponseModel, String>> SignUp({required String email, required String password, required String name, required String mobile}) async{
    try{
      var response = await apiManager.postRequest(endpoint: Endpoints.signupEndpoint,body: {
        "name": name,
        "email":email,
        "password":password,
        "rePassword":password,
        "phone":mobile
      });
      AuthResponseModel responseModel = AuthResponseModel.fromJson(response.data);
      if(responseModel.statusMsg!=null){
        return Right(responseModel.message??"");
      }else{
        return Left(responseModel);
      }
    }catch(e){
      return Right(e.toString());
    }
  }

  @override
  Future<Either<AuthResponseModel, String>> SignIn({required String email, required String password}) async{
    try{
      var response = await apiManager.postRequest(endpoint: Endpoints.signInEndpoint,body: {
        "email":email,
        "password":password
      });
      var authResponseModel = AuthResponseModel.fromJson(response.data);
      if(authResponseModel.statusMsg != null){
        return Right(authResponseModel.message??"");
      }else{
        return Left(authResponseModel);
      }
    }catch(error){
      return Right(error.toString());
    }
  }

}