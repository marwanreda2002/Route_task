class PhotoEntity {
  final int id;
  final SrcEntity src;

  PhotoEntity({
    required this.id,
    required this.src,
  });

}

class SrcEntity {
  final String original;
  final String medium;

  SrcEntity({required this.original, required this.medium});
}

class PhotosResponseEntity {
  final List<PhotoEntity> photos;

  PhotosResponseEntity({
    required this.photos,
  });
}