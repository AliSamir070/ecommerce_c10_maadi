import 'package:dartz/dartz.dart';
import 'package:ecommerce_c10_maadi/domain/entites/AuthEntity/AuthEntity.dart';
import 'package:ecommerce_c10_maadi/domain/repository_contracts/auth_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class SignInUseCase{
  AuthRepo authRepo;
  @factoryMethod
  SignInUseCase(this.authRepo);

  Future<Either<AuthEntity, String>> call({required String email , required String password})=>authRepo.SignIn(email: email, password: password);
}