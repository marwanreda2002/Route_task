import 'package:json_annotation/json_annotation.dart';
import 'package:route_taske/domain/entities/photo_entities.dart';

part 'photo_model.g.dart';

@JsonSerializable()
class Photo extends PhotoEntity{
  final int id;
  @override
  final Src src;

  Photo({
    required this.id,
    required this.src,
  }) : super(id: id, src: src);

  factory Photo.fromJson(Map<String, dynamic> json) =>
      _$PhotoFromJson(json);
  Map<String, dynamic> toJson() => _$PhotoToJson(this);
}

@JsonSerializable()
class Src extends SrcEntity{
  final String original;
  final String medium;

  Src({
    required this.original,
    required this.medium,
  }) : super(original: original, medium: medium);

  factory Src.fromJson(Map<String, dynamic> json) =>
      _$SrcFromJson(json);
  Map<String, dynamic> toJson() => _$SrcToJson(this);
}

@JsonSerializable()
class PhotosResponse extends PhotosResponseEntity {
  @override
  final List<Photo> photos;

  PhotosResponse({
    required this.photos,
  }) : super(photos: photos);

  factory PhotosResponse.fromJson(Map<String, dynamic> json) => 
      _$PhotosResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PhotosResponseToJson(this);
}
