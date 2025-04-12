import 'dart:io';

class UploadPostParam {
  final File image;
  final String description;
  final double? lat, lon;

  UploadPostParam({
    required this.image,
    required this.description,
    this.lat,
    this.lon,
  });

  UploadPostParam copyWith({
    File? image,
    String? description,
    double? lat,
    double? lon,
  }) {
    return UploadPostParam(
      image: image ?? this.image,
      description: description ?? this.description,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
    );
  }
}
