// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/datasource_contract/auth_datasource.dart' as _i4;
import '../../data/datasource_contract/brands_datasource.dart' as _i8;
import '../../data/datasource_contract/cart_datasource.dart' as _i13;
import '../../data/datasource_contract/categories_datasource.dart' as _i17;
import '../../data/datasource_contract/products_datasource.dart' as _i22;
import '../../data/datasource_contract/subcategories_datasource.dart' as _i30;
import '../../data/datasource_impl/auth_datasource_impl.dart' as _i5;
import '../../data/datasource_impl/brands_datasource_impl.dart' as _i9;
import '../../data/datasource_impl/cart_datasource_impl.dart' as _i14;
import '../../data/datasource_impl/categories_datasource_impl.dart' as _i18;
import '../../data/datasource_impl/products_datasource_impl.dart' as _i23;
import '../../data/datasource_impl/subactegories_datasource_impl.dart' as _i31;
import '../../data/repository_impl/auth_repo_impl.dart' as _i7;
import '../../data/repository_impl/brands_repo_impl.dart' as _i11;
import '../../data/repository_impl/cart_repo_impl.dart' as _i16;
import '../../data/repository_impl/categories_repo_impl.dart' as _i20;
import '../../data/repository_impl/products_repo_impl.dart' as _i25;
import '../../data/repository_impl/subcategories_repo_impl.dart' as _i33;
import '../../domain/repository_contracts/auth_repo.dart' as _i6;
import '../../domain/repository_contracts/brands_repo.dart' as _i10;
import '../../domain/repository_contracts/cart_repo.dart' as _i15;
import '../../domain/repository_contracts/categories_repo.dart' as _i19;
import '../../domain/repository_contracts/products_repo.dart' as _i24;
import '../../domain/repository_contracts/subcategories_repo.dart' as _i32;
import '../../domain/usecases/add_to_cart_usecase.dart' as _i34;
import '../../domain/usecases/brands_usecase.dart' as _i12;
import '../../domain/usecases/categories_usecase.dart' as _i21;
import '../../domain/usecases/getsubcategories_specific_category.dart' as _i35;
import '../../domain/usecases/most_selling_products_usecase.dart' as _i36;
import '../../domain/usecases/signin_usecase.dart' as _i26;
import '../../domain/usecases/signup_usecase.dart' as _i28;
import '../../presentation/home/tabs/categories_tab/view_model/CategoriesViewModel.dart'
    as _i37;
import '../../presentation/home/tabs/home_tab/view_model/HomeTabViewModel.dart'
    as _i38;
import '../../presentation/signin_user/view_model/sign_in_view_model_cubit.dart'
    as _i27;
import '../../presentation/signup_user/view_model/signup_view_model_cubit.dart'
    as _i29;
import '../api/api_manager.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ApiManager>(() => _i3.ApiManager());
    gh.factory<_i4.AuthDataSource>(
        () => _i5.AuthDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i6.AuthRepo>(() => _i7.AuthRepoImpl(gh<_i4.AuthDataSource>()));
    gh.factory<_i8.BrandsDataSource>(
        () => _i9.BrandsDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i10.BrandsRepo>(
        () => _i11.BrandsRepoImpl(gh<_i8.BrandsDataSource>()));
    gh.factory<_i12.BrandsUseCase>(
        () => _i12.BrandsUseCase(gh<_i10.BrandsRepo>()));
    gh.factory<_i13.CartDataSource>(
        () => _i14.CartDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i15.CartRepo>(
        () => _i16.CartRepoImpl(gh<_i13.CartDataSource>()));
    gh.factory<_i17.CategoriesDataSource>(
        () => _i18.CategoriesDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i19.CategoriesRepo>(
        () => _i20.CategoriesRepoImpl(gh<_i17.CategoriesDataSource>()));
    gh.factory<_i21.CategoriesUseCase>(
        () => _i21.CategoriesUseCase(gh<_i19.CategoriesRepo>()));
    gh.factory<_i22.ProductsDataSource>(
        () => _i23.ProductsDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i24.ProductsRepo>(
        () => _i25.ProductsRepoImpl(gh<_i22.ProductsDataSource>()));
    gh.factory<_i26.SignInUseCase>(
        () => _i26.SignInUseCase(gh<_i6.AuthRepo>()));
    gh.factory<_i27.SignInViewModel>(
        () => _i27.SignInViewModel(gh<_i26.SignInUseCase>()));
    gh.factory<_i28.SignUpUseCase>(
        () => _i28.SignUpUseCase(gh<_i6.AuthRepo>()));
    gh.factory<_i29.SignupViewModel>(
        () => _i29.SignupViewModel(gh<_i28.SignUpUseCase>()));
    gh.factory<_i30.SubCategoriesDatasource>(
        () => _i31.SubCategoriesDatasourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i32.SubCategoriesRepo>(
        () => _i33.SubCategoriesRepoImpl(gh<_i30.SubCategoriesDatasource>()));
    gh.factory<_i34.AddToCartUseCase>(
        () => _i34.AddToCartUseCase(gh<_i15.CartRepo>()));
    gh.factory<_i35.GetSubcategoriesSpecificCategoryUseCase>(() =>
        _i35.GetSubcategoriesSpecificCategoryUseCase(
            gh<_i32.SubCategoriesRepo>()));
    gh.factory<_i36.MostSellingProductsUseCase>(
        () => _i36.MostSellingProductsUseCase(gh<_i24.ProductsRepo>()));
    gh.factory<_i37.CategoriesViewModel>(() => _i37.CategoriesViewModel(
          gh<_i21.CategoriesUseCase>(),
          gh<_i35.GetSubcategoriesSpecificCategoryUseCase>(),
        ));
    gh.factory<_i38.HomeTabViewModel>(() => _i38.HomeTabViewModel(
          gh<_i34.AddToCartUseCase>(),
          gh<_i21.CategoriesUseCase>(),
          gh<_i12.BrandsUseCase>(),
          gh<_i36.MostSellingProductsUseCase>(),
        ));
    return this;
  }
}
