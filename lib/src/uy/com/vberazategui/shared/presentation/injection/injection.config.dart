// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i8;

import '../../../demo/application/usecases/cache_demo.dart' as _i13;
import '../../../demo/application/usecases/clear_cache_demo.dart' as _i14;
import '../../../demo/application/usecases/demo.dart' as _i15;
import '../../../demo/application/usecases/get_cached_demo.dart' as _i12;
import '../../../demo/domain/repositories/demo_repository.dart' as _i10;
import '../../../demo/infrastructure/datasources/demo_local_data_source.dart'
    as _i5;
import '../../../demo/infrastructure/datasources/demo_remote_data_source.dart'
    as _i9;
import '../../../demo/infrastructure/repositories/demo_repository_impl.dart'
    as _i11;
import '../../../demo/presentation/blocs/demo_page_bloc.dart' as _i16;
import '../../infrastructure/log/log_injectable_module.dart' as _i18;
import '../../infrastructure/network/http_handle_error.dart' as _i7;
import '../../infrastructure/network/http_injectable_module.dart' as _i17;
import '../blocs/configuration_bloc.dart' as _i3;
import '../enums/flavour.dart' as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final httpInjectableModule = _$HttpInjectableModule();
  final logInjectableModule = _$LogInjectableModule();
  gh.lazySingleton<_i3.ConfigurationBLoC>(
      () => _i3.ConfigurationBLoC(flavour: get<_i4.Flavour>()));
  gh.lazySingleton<_i5.DemoLocalDataSource>(
      () => _i5.DemoLocalDataSourceImpl());
  gh.factory<_i6.Dio>(() => httpInjectableModule.client);
  gh.lazySingleton<_i7.HttpHandleError>(() => _i7.HttpHandleError());
  gh.factory<_i8.Logger>(() => logInjectableModule.logger);
  gh.lazySingleton<_i9.DemoRemoteDataSource>(
      () => _i9.DemoRemoteDataSourceImpl(client: get<_i6.Dio>()));
  gh.lazySingleton<_i10.DemoRepository>(() => _i11.DemoRepositoryImpl(
      logger: get<_i8.Logger>(),
      localDataSource: get<_i5.DemoLocalDataSource>(),
      remoteDataSource: get<_i9.DemoRemoteDataSource>(),
      httpHandleError: get<_i7.HttpHandleError>()));
  gh.lazySingleton<_i12.GetCachedDemo>(
      () => _i12.GetCachedDemo(repository: get<_i10.DemoRepository>()));
  gh.lazySingleton<_i13.CacheDemo>(
      () => _i13.CacheDemo(repository: get<_i10.DemoRepository>()));
  gh.lazySingleton<_i14.ClearCacheDemo>(
      () => _i14.ClearCacheDemo(repository: get<_i10.DemoRepository>()));
  gh.lazySingleton<_i15.Demo>(
      () => _i15.Demo(repository: get<_i10.DemoRepository>()));
  gh.factory<_i16.DemoPageBLoC>(() => _i16.DemoPageBLoC(
      demoUseCase: get<_i15.Demo>(),
      cacheDemoUseCase: get<_i13.CacheDemo>(),
      getCachedDemoUseCase: get<_i12.GetCachedDemo>(),
      clearCacheDemoUseCase: get<_i14.ClearCacheDemo>()));
  return get;
}

class _$HttpInjectableModule extends _i17.HttpInjectableModule {}

class _$LogInjectableModule extends _i18.LogInjectableModule {}
