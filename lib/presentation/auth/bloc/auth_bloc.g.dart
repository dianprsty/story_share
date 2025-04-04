// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthState _$AuthStateFromJson(Map<String, dynamic> json) => _AuthState(
  status:
      $enumDecodeNullable(_$GeneralStateEnumMap, json['status']) ??
      GeneralState.initial,
  message: json['message'] as String? ?? '',
  loginResponse:
      json['loginResponse'] == null
          ? const LoginResponse()
          : LoginResponse.fromJson(
            json['loginResponse'] as Map<String, dynamic>,
          ),
);

Map<String, dynamic> _$AuthStateToJson(_AuthState instance) =>
    <String, dynamic>{
      'status': _$GeneralStateEnumMap[instance.status]!,
      'message': instance.message,
      'loginResponse': instance.loginResponse,
    };

const _$GeneralStateEnumMap = {
  GeneralState.initial: 'initial',
  GeneralState.loading: 'loading',
  GeneralState.success: 'success',
  GeneralState.error: 'error',
};
