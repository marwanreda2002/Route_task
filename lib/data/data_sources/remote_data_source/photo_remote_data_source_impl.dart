import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_taske/core/api_manager/api_service.dart';
import 'package:route_taske/core/errors/failures.dart';
import 'package:route_taske/data/model/photo_model.dart';
import 'package:route_taske/domain/repositories/data_sources/remote_data_source/photo_remote_data_source.dart';

@Injectable(as: PhotoRemoteDataSource)
class PhotoRemoteDataSourceImpl implements PhotoRemoteDataSource{
  final ApiService apiService;
  
  PhotoRemoteDataSourceImpl({required this.apiService});
  
  @override
  Future<Either<Failures, List<Photo>>> getPhotos({int page = 1, int perPage = 20}) async {
    try {
      final response = await apiService.getPhotos(page: page, perPage: perPage);
      return Right(response.photos);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}