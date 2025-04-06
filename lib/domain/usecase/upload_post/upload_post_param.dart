import 'dart:io';

class UploadPostParam {
  final File image;
  final String description;

  UploadPostParam({required this.image, required this.description});
}
