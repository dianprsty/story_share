import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_entity.freezed.dart';

@freezed
abstract class PostEntity with _$PostEntity {

  factory PostEntity({
     String? id,
    String? name,
    String? description,
    String? photoUrl,
    String? createdAt,
    double? lat,
    double? lon,
  }) = _PostEntity;

}