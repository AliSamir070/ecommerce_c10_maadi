import 'package:dartz/dartz.dart';
import 'package:ecommerce_c10_maadi/domain/entites/ProductEntity.dart';

abstract class ProductsRepo{
  Future<Either<List<ProductEntity>,String>> getProducts({String? sort});
}