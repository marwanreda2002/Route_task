import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:route_taske/core/api_manager/api_constant.dart';

import '../api_manager/api_service.dart';
import 'd_injection.config.dart';

final getIt = GetIt.instance;

@module
abstract class RegisterModule {
  @lazySingleton
  Dio get dio => Dio(BaseOptions(
    baseUrl: ApiConstant.baseUrl,
    headers: {
      'Authorization': ApiConstant.apiKey,
    },
  ));

  @lazySingleton
  ApiService get apiService => ApiService(dio);
}

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies() => getIt.init();