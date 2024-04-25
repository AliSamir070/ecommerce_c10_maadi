import 'package:dartz/dartz.dart';
import 'package:ecommerce_c10_maadi/data/datasource_contract/auth_datasource.dart';
import 'package:ecommerce_c10_maadi/domain/entites/AuthEntity/AuthEntity.dart';
import 'package:ecommerce_c10_maadi/domain/repository_contracts/auth_repo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: AuthRepo)
class AuthRepoImpl extends AuthRepo{
  AuthDataSource apiDatasource;
  @factoryMethod
  AuthRepoImpl(this.apiDatasource);
  @override
  Future<Either<AuthEntity, String>> SignUp({required String email, required String password, required String name, required String mobile}) async{
    var result = await apiDatasource.SignUp(email: email, password: password, name: name, mobile: mobile);
    return result.fold(
            (response) {
              AuthEntity authEntity = response.toAuthEntity();
              return Left(authEntity);
            }, (error){
       return Right(error);
    });

  }

  @override
  Future<Either<AuthEntity, String>> SignIn({required String email, required String password}) async{
    var result = await apiDatasource.SignIn(email: email, password: password);
    return result.fold((authResponse){
      return Left(authResponse.toAuthEntity());
    }, (error){
      return Right(error);
    });
  }

}