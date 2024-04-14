// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/datasource_contract/brands_datasource.dart' as _i4;
import '../../data/datasource_contract/categories_datasource.dart' as _i9;
import '../../data/datasource_contract/products_datasource.dart' as _i15;
import '../../data/datasource_impl/brands_datasource_impl.dart' as _i5;
import '../../data/datasource_impl/categories_datasource_impl.dart' as _i10;
import '../../data/datasource_impl/products_datasource_impl.dart' as _i16;
import '../../data/repository_impl/brands_repo_impl.dart' as _i7;
import '../../data/repository_impl/categories_repo_impl.dart' as _i12;
import '../../data/repository_impl/products_repo_impl.dart' as _i18;
import '../../domain/repository_contracts/brands_repo.dart' as _i6;
import '../../domain/repository_contracts/categories_repo.dart' as _i11;
import '../../domain/repository_contracts/products_repo.dart' as _i17;
import '../../domain/usecases/brands_usecase.dart' as _i8;
import '../../domain/usecases/categories_usecase.dart' as _i13;
import '../../presentation/home/tabs/home_tab/view_model/HomeTabViewModel.dart'
    as _i14;
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
    gh.factory<_i4.BrandsDataSource>(
        () => _i5.BrandsDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i6.BrandsRepo>(
        () => _i7.BrandsRepoImpl(gh<_i4.BrandsDataSource>()));
    gh.factory<_i8.BrandsUseCase>(
        () => _i8.BrandsUseCase(gh<_i6.BrandsRepo>()));
    gh.factory<_i9.CategoriesDataSource>(
        () => _i10.CategoriesDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i11.CategoriesRepo>(
        () => _i12.CategoriesRepoImpl(gh<_i9.CategoriesDataSource>()));
    gh.factory<_i13.CategoriesUseCase>(
        () => _i13.CategoriesUseCase(gh<_i11.CategoriesRepo>()));
    gh.factory<_i14.HomeTabViewModel>(() => _i14.HomeTabViewModel(
          gh<_i13.CategoriesUseCase>(),
          gh<_i8.BrandsUseCase>(),
        ));
    gh.factory<_i15.ProductsDataSource>(
        () => _i16.ProductsDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i17.ProductsRepo>(
        () => _i18.ProductsRepoImpl(gh<_i15.ProductsDataSource>()));
    return this;
  }
}
