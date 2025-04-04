// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthEvent {

 RegisterParam get params;
/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthEventCopyWith<AuthEvent> get copyWith => _$AuthEventCopyWithImpl<AuthEvent>(this as AuthEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEvent&&(identical(other.params, params) || other.params == params));
}


@override
int get hashCode => Object.hash(runtimeType,params);

@override
String toString() {
  return 'AuthEvent(params: $params)';
}


}

/// @nodoc
abstract mixin class $AuthEventCopyWith<$Res>  {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) _then) = _$AuthEventCopyWithImpl;
@useResult
$Res call({
 RegisterParam params
});




}
/// @nodoc
class _$AuthEventCopyWithImpl<$Res>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._self, this._then);

  final AuthEvent _self;
  final $Res Function(AuthEvent) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? params = null,}) {
  return _then(_self.copyWith(
params: null == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as RegisterParam,
  ));
}

}


/// @nodoc


class _Register implements AuthEvent {
  const _Register({required this.params});
  

@override final  RegisterParam params;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterCopyWith<_Register> get copyWith => __$RegisterCopyWithImpl<_Register>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Register&&(identical(other.params, params) || other.params == params));
}


@override
int get hashCode => Object.hash(runtimeType,params);

@override
String toString() {
  return 'AuthEvent.register(params: $params)';
}


}

/// @nodoc
abstract mixin class _$RegisterCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$RegisterCopyWith(_Register value, $Res Function(_Register) _then) = __$RegisterCopyWithImpl;
@override @useResult
$Res call({
 RegisterParam params
});




}
/// @nodoc
class __$RegisterCopyWithImpl<$Res>
    implements _$RegisterCopyWith<$Res> {
  __$RegisterCopyWithImpl(this._self, this._then);

  final _Register _self;
  final $Res Function(_Register) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? params = null,}) {
  return _then(_Register(
params: null == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as RegisterParam,
  ));
}


}


/// @nodoc
mixin _$AuthState {

 GeneralState get status; String get message; LoginResponse get loginResponse;
/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthStateCopyWith<AuthState> get copyWith => _$AuthStateCopyWithImpl<AuthState>(this as AuthState, _$identity);

  /// Serializes this AuthState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.loginResponse, loginResponse) || other.loginResponse == loginResponse));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,message,loginResponse);

@override
String toString() {
  return 'AuthState(status: $status, message: $message, loginResponse: $loginResponse)';
}


}

/// @nodoc
abstract mixin class $AuthStateCopyWith<$Res>  {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) _then) = _$AuthStateCopyWithImpl;
@useResult
$Res call({
 GeneralState status, String message, LoginResponse loginResponse
});


$LoginResponseCopyWith<$Res> get loginResponse;

}
/// @nodoc
class _$AuthStateCopyWithImpl<$Res>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._self, this._then);

  final AuthState _self;
  final $Res Function(AuthState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? message = null,Object? loginResponse = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as GeneralState,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,loginResponse: null == loginResponse ? _self.loginResponse : loginResponse // ignore: cast_nullable_to_non_nullable
as LoginResponse,
  ));
}
/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoginResponseCopyWith<$Res> get loginResponse {
  
  return $LoginResponseCopyWith<$Res>(_self.loginResponse, (value) {
    return _then(_self.copyWith(loginResponse: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _AuthState implements AuthState {
  const _AuthState({this.status = GeneralState.initial, this.message = '', this.loginResponse = const LoginResponse()});
  factory _AuthState.fromJson(Map<String, dynamic> json) => _$AuthStateFromJson(json);

@override@JsonKey() final  GeneralState status;
@override@JsonKey() final  String message;
@override@JsonKey() final  LoginResponse loginResponse;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthStateCopyWith<_AuthState> get copyWith => __$AuthStateCopyWithImpl<_AuthState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthState&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.loginResponse, loginResponse) || other.loginResponse == loginResponse));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,message,loginResponse);

@override
String toString() {
  return 'AuthState(status: $status, message: $message, loginResponse: $loginResponse)';
}


}

/// @nodoc
abstract mixin class _$AuthStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$AuthStateCopyWith(_AuthState value, $Res Function(_AuthState) _then) = __$AuthStateCopyWithImpl;
@override @useResult
$Res call({
 GeneralState status, String message, LoginResponse loginResponse
});


@override $LoginResponseCopyWith<$Res> get loginResponse;

}
/// @nodoc
class __$AuthStateCopyWithImpl<$Res>
    implements _$AuthStateCopyWith<$Res> {
  __$AuthStateCopyWithImpl(this._self, this._then);

  final _AuthState _self;
  final $Res Function(_AuthState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? message = null,Object? loginResponse = null,}) {
  return _then(_AuthState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as GeneralState,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,loginResponse: null == loginResponse ? _self.loginResponse : loginResponse // ignore: cast_nullable_to_non_nullable
as LoginResponse,
  ));
}

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoginResponseCopyWith<$Res> get loginResponse {
  
  return $LoginResponseCopyWith<$Res>(_self.loginResponse, (value) {
    return _then(_self.copyWith(loginResponse: value));
  });
}
}

// dart format on
