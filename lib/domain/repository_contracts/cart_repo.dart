import 'package:dartz/dartz.dart';
import 'package:ecommerce_c10_maadi/domain/entites/CartResponseEntity/CartResponseEntity.dart';

abstract class CartRepo{

  Future<Either<CartResponseEntity , String>> AddToCart({required productId});

}