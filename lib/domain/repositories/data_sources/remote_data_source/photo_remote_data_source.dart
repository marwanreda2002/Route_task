import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../entities/photo_entities.dart';

abstract class PhotoRemoteDataSource{
  Future<Either<Failures, List<PhotoEntity>>> getPhotos({int page=1, int perPage=20});

}