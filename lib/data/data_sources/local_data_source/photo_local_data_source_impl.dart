import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:route_taske/domain/entities/photo_entities.dart';
import 'package:route_taske/domain/repositories/data_sources/local_data_source/photo_local_data_source.dart';

import '../../model/photo_model.dart';

@Injectable(as: PhotoLocalDataSource)
class PhotoLocalDataSourceImpl implements PhotoLocalDataSource{


  static const String _photosBoxName = 'photos_box';
  static const String _photosKey = 'cached_photos';

  @override
  Future<void> savePhotos(List<PhotoEntity> photos) async {
    try {
      final box = await Hive.openBox(_photosBoxName);
      final photosJson = jsonEncode(photos.map((photo) => (photo as Photo).toJson()).toList());
      await box.put(_photosKey, photosJson);
    } catch (e) {
      print('Error saving photos: $e');
    }
  }

  @override
  Future<List<PhotoEntity>> getSavedPhotos() async {
    print("marwan reda");
    try {
      final box = await Hive.openBox(_photosBoxName);
      final photosJson = box.get(_photosKey) as String?;
      
      if (photosJson == null) {
        return [];
      }
      
      final List<dynamic> photosList = jsonDecode(photosJson);
      return photosList.map((photoJson) => Photo.fromJson(photoJson)).toList();
    } catch (e) {
      print('Error getting saved photos: $e');
      return [];
    }
  }


}