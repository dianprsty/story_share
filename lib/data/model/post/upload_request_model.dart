import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_request_model.freezed.dart';

@freezed
abstract class UploadRequestModel with _$UploadRequestModel {

  factory UploadRequestModel({
    required File image,
    required String description
  }) = _UploadRequestModel;

}