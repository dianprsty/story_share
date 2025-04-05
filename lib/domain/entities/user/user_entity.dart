import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';

@freezed
 abstract class UserEntity with _$UserEntity {
  const factory UserEntity({String? userId, String? token, String? name}) =
      _UserEntity;
}
