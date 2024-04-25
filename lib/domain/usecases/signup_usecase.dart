import 'package:dartz/dartz.dart';
import 'package:ecommerce_c10_maadi/domain/entites/AuthEntity/AuthEntity.dart';
import 'package:ecommerce_c10_maadi/domain/repository_contracts/auth_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class SignUpUseCase{
  AuthRepo authRepo;
  @factoryMethod
  SignUpUseCase(this.authRepo);

  Future<Either<AuthEntity, String>> call({required String email,required String password , required String name , required String mobile})=>authRepo.SignUp(email: email, password: password, name: name, mobile: mobile);
}