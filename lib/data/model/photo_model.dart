import 'package:json_annotation/json_annotation.dart';
import 'package:route_taske/domain/entities/photo_entities.dart';

part 'photo_model.g.dart';

@JsonSerializable()
class Photo extends PhotoEntity{
  @JsonKey(fromJson: _idFromJson)
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

  // Custom converter to handle null id values
  static int _idFromJson(dynamic value) {
    if (value == null) {
      return 0; // Default value when id is null
    }
    if (value is int) {
      return value;
    }
    if (value is num) {
      return value.toInt();
    }
    return 0; // Fallback default value
  }
}

@JsonSerializable()
class Src extends SrcEntity{
  @JsonKey(fromJson: _stringFromJson)
  final String original;
  @JsonKey(fromJson: _stringFromJson)
  final String medium;

  Src({
    required this.original,
    required this.medium,
  }) : super(original: original, medium: medium);

  factory Src.fromJson(Map<String, dynamic> json) =>
      _$SrcFromJson(json);
  Map<String, dynamic> toJson() => _$SrcToJson(this);

  // Custom converter to handle null string values
  static String _stringFromJson(dynamic value) {
    if (value == null) {
      return ''; // Default empty string when value is null
    }
    return value.toString();
  }
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
