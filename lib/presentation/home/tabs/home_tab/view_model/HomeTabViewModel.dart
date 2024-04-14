import 'package:ecommerce_c10_maadi/data/datasource_contract/products_datasource.dart';
import 'package:ecommerce_c10_maadi/domain/usecases/brands_usecase.dart';
import 'package:ecommerce_c10_maadi/domain/usecases/categories_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/entites/BrandEntity.dart';
import '../../../../../domain/entites/CategoryEntity.dart';
@injectable
class HomeTabViewModel extends Cubit<HomeTabStates>{
  @factoryMethod
  HomeTabViewModel(this.categoriesUseCase,this.brandsUseCase):super(HomeTabInitialState());

  CategoriesUseCase categoriesUseCase;
  BrandsUseCase brandsUseCase;
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
