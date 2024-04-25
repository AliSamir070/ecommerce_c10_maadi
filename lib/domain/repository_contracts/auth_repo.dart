import 'package:dartz/dartz.dart';
import 'package:ecommerce_c10_maadi/domain/entites/AuthEntity/AuthEntity.dart';

abstract class AuthRepo{
  Future<Either<AuthEntity , String>> SignUp({
    required String email,required String password , required String name , required String mobile
  });
  Future<Either<AuthEntity , String>> SignIn({required String email , required String password});
}