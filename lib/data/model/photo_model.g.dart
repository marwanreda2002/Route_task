// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Photo _$PhotoFromJson(Map<String, dynamic> json) => Photo(
  id: Photo._idFromJson(json['id']),
  src: Src.fromJson(json['src'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PhotoToJson(Photo instance) => <String, dynamic>{
  'id': instance.id,
  'src': instance.src,
};

Src _$SrcFromJson(Map<String, dynamic> json) => Src(
  original: Src._stringFromJson(json['original']),
  medium: Src._stringFromJson(json['medium']),
);

Map<String, dynamic> _$SrcToJson(Src instance) => <String, dynamic>{
  'original': instance.original,
  'medium': instance.medium,
};

PhotosResponse _$PhotosResponseFromJson(Map<String, dynamic> json) =>
    PhotosResponse(
      photos: (json['photos'] as List<dynamic>)
          .map((e) => Photo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PhotosResponseToJson(PhotosResponse instance) =>
    <String, dynamic>{'photos': instance.photos};
