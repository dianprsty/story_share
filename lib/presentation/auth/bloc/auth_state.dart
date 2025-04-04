part of 'auth_bloc.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    @Default(GeneralState.initial) GeneralState status,
    @Default('') String message,
    @Default(LoginResponse()) LoginResponse loginResponse,
  }) = _AuthState;

  factory AuthState.fromJson(Map<String, dynamic> json) =>
      _$AuthStateFromJson(json);
}
