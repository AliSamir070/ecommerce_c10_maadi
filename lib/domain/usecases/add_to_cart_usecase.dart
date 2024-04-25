import 'package:dartz/dartz.dart';
import 'package:ecommerce_c10_maadi/domain/repository_contracts/cart_repo.dart';
import 'package:injectable/injectable.dart';

import '../entites/CartResponseEntity/CartResponseEntity.dart';
@injectable
class AddToCartUseCase{
  CartRepo cartRepo;
  @factoryMethod
  AddToCartUseCase(this.cartRepo);

  Future<Either<CartResponseEntity, String>> call({required String productId})=>cartRepo.AddToCart(productId: productId);
}