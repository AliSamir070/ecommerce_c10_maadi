import 'package:dartz/dartz.dart';
import 'package:ecommerce_c10_maadi/data/datasource_contract/products_datasource.dart';
import 'package:ecommerce_c10_maadi/domain/repository_contracts/products_repo.dart';
import 'package:injectable/injectable.dart';

import '../entites/ProductEntity.dart';
@injectable
class MostSellingProductsUseCase{
  ProductsRepo productsRepo;
  @factoryMethod
  MostSellingProductsUseCase(this.productsRepo);

  Future<Either<List<ProductEntity>, String>> call()=>productsRepo.getProducts(sort: ProductsSorting.MostSelling.sort);
}