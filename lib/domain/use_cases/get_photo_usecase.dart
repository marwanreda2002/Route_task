import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_taske/domain/repositories/photo/photos_repo.dart';

import '../../core/di/d_injection.dart';
import '../../core/errors/failures.dart';
import '../entities/photo_entities.dart';
@injectable
class GetPhotosUseCase{
  PhotosRepo photosRepo =getIt<PhotosRepo>();
  GetPhotosUseCase();

  Future<Either<Failures, List<PhotoEntity>>> invoke({int page = 1, int perPage = 20}) {
    return photosRepo.getPhotos(page: page, perPage: perPage);
  }

}