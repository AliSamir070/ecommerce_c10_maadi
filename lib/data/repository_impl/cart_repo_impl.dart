import 'package:dartz/dartz.dart';
import 'package:ecommerce_c10_maadi/data/datasource_contract/cart_datasource.dart';
import 'package:ecommerce_c10_maadi/domain/entites/CartResponseEntity/CartResponseEntity.dart';
import 'package:ecommerce_c10_maadi/domain/repository_contracts/cart_repo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: CartRepo)
class CartRepoImpl extends CartRepo{
  CartDataSource apiDatasource;
  @factoryMethod
  CartRepoImpl(this.apiDatasource);

  @override
  Future<Either<CartResponseEntity, String>> AddToCart({required productId}) async{
    var result = await apiDatasource.AddToCart(productId: productId);
    return result.fold((response){
      return Left(response.toCartResponseEntity());
    }, (error){
      return Right(error);
    } );
  }
}