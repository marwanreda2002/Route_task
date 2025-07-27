import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:route_taske/core/api_manager/api_constant.dart';

import 'd_injection.config.dart';

final getIt = GetIt.instance;

@module
abstract class RegisterModule {
  @injectable
  Dio get dio => Dio(BaseOptions(
    baseUrl: ApiConstant.baseUrl,
    headers: {
      'Authorization': ApiConstant.apiKey,
    },
  ));
}

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies() => getIt.init();