import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/post/post_entity.dart';

part 'post_model.freezed.dart';
part 'post_model.g.dart';

@freezed
abstract class PostModel with _$PostModel {
  factory PostModel({
    String? id,
    String? name,
    String? description,
    String? photoUrl,
    String? createdAt,
    double? lat,
    double? lon,
  }) = _PostModel;

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);
}

extension PostModelExtension on PostModel {
  PostEntity toPostEntity() => PostEntity(
    id: id,
    name: name,
    description: description,
    photoUrl: photoUrl,
    createdAt: createdAt,
    lat: lat,
    lon: lon,
  );
}
