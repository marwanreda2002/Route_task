import '../../../entities/photo_entities.dart';

abstract class PhotoLocalDataSource {
  Future<void> savePhotos(List<PhotoEntity> photos);

  Future<List<PhotoEntity>> getSavedPhotos();
}