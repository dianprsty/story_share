part of 'auth_bloc.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    @Default(GeneralState.initial) GeneralState status,
    @Default('') String message,
    UserEntity? userEntity,
  }) = _AuthState;
}
