import 'package:ecommerce_c10_maadi/domain/usecases/categories_usecase.dart';
import 'package:ecommerce_c10_maadi/domain/usecases/getsubcategories_specific_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/entites/CategoryEntity.dart';
import '../../../../../domain/entites/SubcategoryEntity.dart';
@injectable
class CategoriesViewModel extends Cubit<CategoriesStates>{
  @factoryMethod
  CategoriesViewModel(this.categoriesUseCase,this.subcategoriesSpecificCategoryUseCase):super(CategoriesInitialState());
  static CategoriesViewModel get(BuildContext context)=>BlocProvider.of(context);

  CategoriesUseCase categoriesUseCase;
  GetSubcategoriesSpecificCategoryUseCase subcategoriesSpecificCategoryUseCase;
  GetCategories()async{
    emit(GetCategoriesLoadingState());
    var result = await categoriesUseCase.call();
    result.fold((categories){
      emit(GetCategoriesSuccessState(categories));
    }, (error){
      emit(GetCategoriesErrorState(error));
    } );
  }

  GetSubCategories(String categoryId)async{
    emit(GetSubCategoriesLoadingState());
    var result = await subcategoriesSpecificCategoryUseCase.call(categoryId);
    result.fold((subcategories){
      emit(GetSubCategoriesSuccessState(subcategories));
    } , (error){
      emit(GetSubCategoriesErrorState(error));
    });
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
class GetSubCategoriesLoadingState extends CategoriesStates{}
class GetSubCategoriesErrorState extends CategoriesStates{
  String error;
  GetSubCategoriesErrorState(this.error);
}
class GetSubCategoriesSuccessState extends CategoriesStates{
  List<SubcategoryEntity> subcategories;
  GetSubCategoriesSuccessState(this.subcategories);
}