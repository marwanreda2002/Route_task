import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:route_taske/data/model/photo_model.dart';

import 'api_constant.dart';

part 'api_service.g.dart';

@factoryMethod
@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET(ApiConstant.getPhotosEndPoint)
  Future<PhotosResponse> getPhotos({
    @Query('page') int page = 1,
    @Query('per_page') int perPage = 20,
  });
}