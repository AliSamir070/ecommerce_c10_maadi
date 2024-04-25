import 'package:dartz/dartz.dart';
import 'package:ecommerce_c10_maadi/data/model/cart_response/CartResponseModel.dart';

abstract class CartDataSource{
  Future<Either<CartResponseModel , String>>AddToCart({required String productId});
}