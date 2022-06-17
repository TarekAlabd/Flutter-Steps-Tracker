// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i8;

import '../core/data/data_sources/cache_helper.dart' as _i15;
import '../core/data/data_sources/database.dart' as _i5;
import '../features/bottom_navbar/data/repositories/bottom_navbar_repository_impl.dart'
    as _i14;
import '../features/bottom_navbar/domain/repositories/bottom_navbar_repository.dart'
    as _i13;
import '../features/bottom_navbar/domain/use_cases/get_rewards_use_case.dart'
    as _i16;
import '../features/bottom_navbar/presentation/manager/home_cubit/home_cubit.dart'
    as _i6;
import '../features/bottom_navbar/presentation/manager/rewards_cubit/rewards_cubit.dart'
    as _i17;
import '../features/intro/data/data_sources/auth_local_data_source.dart' as _i9;
import '../features/intro/data/data_sources/auth_remote_data_source.dart'
    as _i4;
import '../features/intro/data/repositories/auth_repository_impl.dart' as _i11;
import '../features/intro/data/services/auth_services.dart' as _i3;
import '../features/intro/domain/repositories/auth_repository.dart' as _i10;
import '../features/intro/domain/use_cases/auth_status_use_case.dart' as _i12;
import '../features/intro/domain/use_cases/sign_in_anonymously_use_case.dart'
    as _i18;
import '../features/intro/presentation/manager/auth_actions/auth_cubit.dart'
    as _i19;
import '../features/intro/presentation/manager/auth_status/auth_status_cubit.dart'
    as _i20;
import '../utilities/locale/cubit/locale_cubit.dart' as _i7;
import 'app_module.dart' as _i21; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final appModule = _$AppModule();
  gh.singleton<_i3.AuthBase>(_i3.Auth());
  gh.singleton<_i4.AuthRemoteDataSource>(
      _i4.AuthRemoteDataSourceImpl(authBase: get<_i3.AuthBase>()));
  gh.singleton<_i5.Database>(_i5.FireStoreDatabase());
  gh.factory<_i6.HomeCubit>(() => _i6.HomeCubit());
  gh.singleton<_i7.LocaleCubit>(_i7.LocaleCubit());
  await gh.factoryAsync<_i8.SharedPreferences>(() => appModule.prefs,
      preResolve: true);
  gh.singleton<_i9.AuthLocalDataSource>(
      _i9.AuthLocalDataSourceImpl(get<_i8.SharedPreferences>()));
  gh.singleton<_i10.AuthRepository>(_i11.AuthRepositoryImpl(
      get<_i4.AuthRemoteDataSource>(),
      get<_i9.AuthLocalDataSource>(),
      get<_i5.Database>()));
  gh.factory<_i12.AuthStatusUseCase>(
      () => _i12.AuthStatusUseCase(get<_i10.AuthRepository>()));
  gh.singleton<_i13.BottomNavbarRepository>(
      _i14.BottomNavbarRepositoryImpl(get<_i5.Database>()));
  gh.singleton<_i15.CacheHelper>(
      _i15.CacheHelperImpl(get<_i8.SharedPreferences>()));
  gh.factory<_i16.GetRewardsUseCase>(
      () => _i16.GetRewardsUseCase(get<_i13.BottomNavbarRepository>()));
  gh.factory<_i17.RewardsCubit>(
      () => _i17.RewardsCubit(get<_i16.GetRewardsUseCase>()));
  gh.factory<_i18.SignInAnonymouslyUseCase>(() => _i18.SignInAnonymouslyUseCase(
      authRepository: get<_i10.AuthRepository>()));
  gh.singleton<_i19.AuthCubit>(
      _i19.AuthCubit(get<_i18.SignInAnonymouslyUseCase>()));
  gh.singleton<_i20.AuthStatusCubit>(
      _i20.AuthStatusCubit(get<_i12.AuthStatusUseCase>()));
  return get;
}

class _$AppModule extends _i21.AppModule {}
