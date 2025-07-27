import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_taske/core/errors/failures.dart';
import 'package:route_taske/domain/entities/photo_entities.dart';
import 'package:route_taske/domain/repositories/data_sources/local_data_source/photo_local_data_source.dart';
import 'package:route_taske/domain/repositories/data_sources/remote_data_source/photo_remote_data_source.dart';
import 'package:route_taske/domain/repositories/photo/photos_repo.dart';

import '../../core/di/d_injection.dart';

@Injectable(as: PhotosRepo)
class PhotoRepoImpl implements PhotosRepo{
  PhotoRemoteDataSource photoRemoteDataSource =getIt<PhotoRemoteDataSource>();
  PhotoLocalDataSource photoLocalDataSource=getIt<PhotoLocalDataSource>();
  PhotoRepoImpl();
  @override
  Future<Either<Failures, List<PhotoEntity>>> getPhotos({int page = 1, int perPage = 20}) async {
    final List<ConnectivityResult> connectivityResults = await Connectivity().checkConnectivity();

    if (connectivityResults.contains(ConnectivityResult.wifi) || connectivityResults.contains(ConnectivityResult.mobile)) {
      final either = await photoRemoteDataSource.getPhotos(page: page, perPage: perPage);
      return either.fold(
        (error) => Left(error),
        (photos) async {
          await photoLocalDataSource.savePhotos(photos);
          return Right(photos);
        },
      );
    } else {
      var offlinePhotos = await photoLocalDataSource.getSavedPhotos();
      return Right(offlinePhotos);
    }
  }
  
}