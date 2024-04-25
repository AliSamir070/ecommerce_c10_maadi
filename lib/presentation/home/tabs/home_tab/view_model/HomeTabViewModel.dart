import 'package:ecommerce_c10_maadi/data/datasource_contract/products_datasource.dart';
import 'package:ecommerce_c10_maadi/domain/entites/CartResponseEntity/CartResponseEntity.dart';
import 'package:ecommerce_c10_maadi/domain/usecases/add_to_cart_usecase.dart';
import 'package:ecommerce_c10_maadi/domain/usecases/brands_usecase.dart';
import 'package:ecommerce_c10_maadi/domain/usecases/categories_usecase.dart';
import 'package:ecommerce_c10_maadi/domain/usecases/most_selling_products_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/entites/BrandEntity.dart';
import '../../../../../domain/entites/CategoryEntity.dart';
import '../../../../../domain/entites/ProductEntity.dart';
@injectable
class HomeTabViewModel extends Cubit<HomeTabStates>{
  @factoryMethod
  HomeTabViewModel(this.addToCartUseCase,this.categoriesUseCase,this.brandsUseCase,this.mostSellingProductsUseCase):super(HomeTabInitialState());

  static HomeTabViewModel get(BuildContext context) =>BlocProvider.of(context);
  CategoriesUseCase categoriesUseCase;
  BrandsUseCase brandsUseCase;
  MostSellingProductsUseCase mostSellingProductsUseCase;
  AddToCartUseCase addToCartUseCase;
  GetCategories()async{
    emit(HomeTabLoadingState());
    var result = await categoriesUseCase.call();
    result.fold((categories){
      emit(HomeTabSuccessState(categories));
    }, (error){
      emit(HomeTabErrorState(error));
    });
  }

  GetBrands()async{
    emit(BrandsLoadingState());
    var result = await brandsUseCase.call();
    result.fold((brands){
      emit(BrandsSuccessState(brands));
    }, (error){
      emit(BrandsErrorState(error));
    } );
  }

  GetMostSellingProducts()async{
    emit(MostSellingProductsLoadingState());
    var result = await mostSellingProductsUseCase.call();
    result.fold((products){
      emit(MostSellingProductsSuccessState(products));
    }, (error) {
      emit(MostSellingProductsErrorState(error));
    });
  }
  AddProductToCart({required String productId})async{
    emit(AddToCartLoadingState(productId));
    var result = await addToCartUseCase.call(productId: productId);
    result.fold((cartResponseEntity){
      emit(AddToCartSuccessState(cartResponseEntity,productId));
    }, (error) {
      emit(AddToCartErrorState(error,productId));
    });
  }
}

abstract class HomeTabStates{}
class HomeTabInitialState extends HomeTabStates{}
class HomeTabLoadingState extends HomeTabStates{}
class HomeTabSuccessState extends HomeTabStates{
  List<CategoryEntity> categories;
  HomeTabSuccessState(this.categories);
}
class HomeTabErrorState extends HomeTabStates{
  String error;
  HomeTabErrorState(this.error);
}
class BrandsLoadingState extends HomeTabStates{}
class BrandsSuccessState extends HomeTabStates{
  List<BrandEntity> brands;
  BrandsSuccessState(this.brands);
}
class BrandsErrorState extends HomeTabStates{
  String error;
  BrandsErrorState(this.error);
}
class MostSellingProductsLoadingState extends HomeTabStates{}
class MostSellingProductsSuccessState extends HomeTabStates{
  List<ProductEntity> products;
  MostSellingProductsSuccessState(this.products);
}
class MostSellingProductsErrorState extends HomeTabStates{
  String error;
  MostSellingProductsErrorState(this.error);
}
class AddToCartLoadingState extends HomeTabStates{
  String productId;
  AddToCartLoadingState(this.productId);
}
class AddToCartErrorState extends HomeTabStates{
  String error;
  String productId;
  AddToCartErrorState(this.error,this.productId);
}
class AddToCartSuccessState extends HomeTabStates{
  CartResponseEntity cartResponseEntity;
  String productId;
  AddToCartSuccessState(this.cartResponseEntity,this.productId);
}
