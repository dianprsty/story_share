import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/user/user_entity.dart';

part 'login_response.freezed.dart';
part 'login_response.g.dart';

@freezed
abstract class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    String? userId,
    String? token,
    String? name,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}


extension LoginResponseExtension on LoginResponse {
  UserEntity toUserEntity() => UserEntity(userId: userId, token: token, name: name);
}