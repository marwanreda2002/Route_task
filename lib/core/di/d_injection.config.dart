// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/data_sources/local_data_source/photo_local_data_source_impl.dart'
    as _i999;
import '../../data/data_sources/remote_data_source/photo_remote_data_source_impl.dart'
    as _i212;
import '../../data/repositories/photo_repo_impl.dart' as _i514;
import '../../domain/repositories/data_sources/local_data_source/photo_local_data_source.dart'
    as _i286;
import '../../domain/repositories/data_sources/remote_data_source/photo_remote_data_source.dart'
    as _i960;
import '../../domain/repositories/photo/photos_repo.dart' as _i682;
import '../../domain/use_cases/get_photo_usecase.dart' as _i642;
import '../api_manager/api_service.dart' as _i1065;
import 'd_injection.dart' as _i22;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.factory<_i642.GetPhotosUseCase>(() => _i642.GetPhotosUseCase());
    gh.factory<_i361.Dio>(() => registerModule.dio);
    gh.factory<_i682.PhotosRepo>(() => _i514.PhotoRepoImpl());
    gh.factory<_i286.PhotoLocalDataSource>(
      () => _i999.PhotoLocalDataSourceImpl(),
    );
    gh.factory<_i960.PhotoRemoteDataSource>(
      () =>
          _i212.PhotoRemoteDataSourceImpl(apiService: gh<_i1065.ApiService>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i22.RegisterModule {}
