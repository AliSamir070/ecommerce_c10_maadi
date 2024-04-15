import 'package:ecommerce_c10_maadi/domain/usecases/categories_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/entites/CategoryEntity.dart';
@injectable
class CategoriesViewModel extends Cubit<CategoriesStates>{
  @factoryMethod
  CategoriesViewModel(this.categoriesUseCase):super(CategoriesInitialState());
  static CategoriesViewModel get(BuildContext context)=>BlocProvider.of(context);

  CategoriesUseCase categoriesUseCase;

  GetCategories()async{
    emit(GetCategoriesLoadingState());
    var result = await categoriesUseCase.call();
    result.fold((categories){
      emit(GetCategoriesSuccessState(categories));
    }, (error){
      emit(GetCategoriesErrorState(error));
    } );
  }

}
abstract class CategoriesStates{}
class CategoriesInitialState extends CategoriesStates{}
class GetCategoriesLoadingState extends CategoriesStates{}
class GetCategoriesSuccessState extends CategoriesStates{
  List<CategoryEntity> categories;
  GetCategoriesSuccessState(this.categories);
}
class GetCategoriesErrorState extends CategoriesStates{
  String error;
  GetCategoriesErrorState(this.error);
}