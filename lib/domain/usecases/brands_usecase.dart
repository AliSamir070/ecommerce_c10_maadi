import 'package:dartz/dartz.dart';
import 'package:ecommerce_c10_maadi/domain/repository_contracts/brands_repo.dart';
import 'package:injectable/injectable.dart';

import '../entites/BrandEntity.dart';

@injectable
class BrandsUseCase{
  BrandsRepo repo;
  @factoryMethod
  BrandsUseCase(this.repo);

  Future<Either<List<BrandEntity>, String>> call()=>repo.getBrands();
}