import 'package:dartz/dartz.dart';
import 'package:ecommerce_c10_maadi/data/model/auth_response/AuthResponseModel.dart';

abstract class AuthDataSource{
  Future<Either<AuthResponseModel , String>>SignUp({required String email,required String password , required String name , required String mobile});
  Future<Either<AuthResponseModel , String>>SignIn({required String email , required String password});
}