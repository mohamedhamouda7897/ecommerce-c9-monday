// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/api/api_manager.dart' as _i3;
import '../features/home/data/data_sources/home_remote_ds.dart' as _i4;
import '../features/home/data/data_sources/home_remote_ds_impl.dart' as _i5;
import '../features/home/data/repositories/home_repo_impl.dart' as _i7;
import '../features/home/domain/repositories/home_repo.dart' as _i6;
import '../features/home/domain/use_cases/add_to_cart_usecase.dart' as _i15;
import '../features/home/domain/use_cases/get_brands_use_case.dart' as _i16;
import '../features/home/domain/use_cases/get_category_use_case.dart' as _i17;
import '../features/home/presentation/bloc/home_bloc.dart' as _i18;
import '../features/login/data/data_sources/local/login_local_ds.dart' as _i8;
import '../features/login/data/data_sources/local/login_local_ds_impl.dart'
    as _i9;
import '../features/login/data/data_sources/remote/login_remote_ds_impl.dart'
    as _i11;
import '../features/login/data/data_sources/remote/remote_ds.dart' as _i10;
import '../features/login/data/repositories/login_repo_impl.dart' as _i13;
import '../features/login/domain/repositories/login_repo.dart' as _i12;
import '../features/login/domain/use_cases/login_usecase.dart' as _i14;
import '../features/login/presentation/bloc/login_bloc.dart' as _i19;

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
    gh.singleton<_i3.ApiManager>(_i3.ApiManager());
    gh.factory<_i4.HomeRemoteDS>(
        () => _i5.HomeRemoteDSImpl(gh<_i3.ApiManager>()));
    gh.factory<_i6.HomeRepo>(() => _i7.HomeRepoImpl(gh<_i4.HomeRemoteDS>()));
    gh.factory<_i8.LoginLocalDS>(() => _i9.LoginLocalDSImpl());
    gh.factory<_i10.LoginRemoteDS>(
        () => _i11.LoginRemoteDSImpl(gh<_i3.ApiManager>()));
    gh.factory<_i12.LoginRepo>(() => _i13.LoginRepoImpl(
          gh<_i10.LoginRemoteDS>(),
          gh<_i8.LoginLocalDS>(),
        ));
    gh.factory<_i14.LoginUseCase>(
        () => _i14.LoginUseCase(gh<_i12.LoginRepo>()));
    gh.factory<_i15.AddCartUseCase>(
        () => _i15.AddCartUseCase(gh<_i6.HomeRepo>()));
    gh.factory<_i16.GetBrandsUseCase>(
        () => _i16.GetBrandsUseCase(gh<_i6.HomeRepo>()));
    gh.factory<_i17.GetCategoryUseCase>(
        () => _i17.GetCategoryUseCase(gh<_i6.HomeRepo>()));
    gh.factory<_i18.HomeBloc>(() => _i18.HomeBloc(
          gh<_i16.GetBrandsUseCase>(),
          gh<_i17.GetCategoryUseCase>(),
          gh<_i15.AddCartUseCase>(),
        ));
    gh.factory<_i19.LoginBloc>(() => _i19.LoginBloc(gh<_i14.LoginUseCase>()));
    return this;
  }
}
