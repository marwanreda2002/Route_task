import 'package:dartz/dartz.dart';
import 'package:route_taske/domain/entities/photo_entities.dart';

import '../../../core/errors/failures.dart';

abstract class PhotosRepo{
  Future<Either<Failures, List<PhotoEntity>>> getPhotos({int page=1, int perPage=20});
}