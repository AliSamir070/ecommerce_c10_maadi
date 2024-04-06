import 'package:dartz/dartz.dart';
import 'package:ecommerce_c10_maadi/data/datasource_contract/brands_datasource.dart';

import 'package:ecommerce_c10_maadi/domain/entites/BrandEntity.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repository_contracts/brands_repo.dart';
@Injectable(as: BrandsRepo)
class BrandsRepoImpl extends BrandsRepo{
  BrandsDataSource apiDataSource;
  @factoryMethod
  BrandsRepoImpl(this.apiDataSource);
  @override
  Future<Either<List<BrandEntity>, String>> getBrands() async{
    var result = await  apiDataSource.getBrands();
    return result.fold((response) {
      var brandsListModel = response.data??[];
      var brands = brandsListModel.map((brand) => brand.toBrandEntity()).toList();
      return Left(brands);
    }, (error){
      return Right(error);
    }
    );
  }

}