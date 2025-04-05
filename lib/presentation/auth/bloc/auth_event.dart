part of 'auth_bloc.dart';

@freezed
abstract class AuthEvent with _$AuthEvent {
  const factory AuthEvent.register({required RegisterParam params}) = _Register;
  const factory AuthEvent.login({required LoginParam params}) = _Login;
  const factory AuthEvent.logout() = _Logout;
}