// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UploadEvent {

 UploadPostParam get data;
/// Create a copy of UploadEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UploadEventCopyWith<UploadEvent> get copyWith => _$UploadEventCopyWithImpl<UploadEvent>(this as UploadEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UploadEvent&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'UploadEvent(data: $data)';
}


}

/// @nodoc
abstract mixin class $UploadEventCopyWith<$Res>  {
  factory $UploadEventCopyWith(UploadEvent value, $Res Function(UploadEvent) _then) = _$UploadEventCopyWithImpl;
@useResult
$Res call({
 UploadPostParam data
});




}
/// @nodoc
class _$UploadEventCopyWithImpl<$Res>
    implements $UploadEventCopyWith<$Res> {
  _$UploadEventCopyWithImpl(this._self, this._then);

  final UploadEvent _self;
  final $Res Function(UploadEvent) _then;

/// Create a copy of UploadEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as UploadPostParam,
  ));
}

}


/// @nodoc


class _Upload implements UploadEvent {
  const _Upload(this.data);
  

@override final  UploadPostParam data;

/// Create a copy of UploadEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UploadCopyWith<_Upload> get copyWith => __$UploadCopyWithImpl<_Upload>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Upload&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'UploadEvent.upload(data: $data)';
}


}

/// @nodoc
abstract mixin class _$UploadCopyWith<$Res> implements $UploadEventCopyWith<$Res> {
  factory _$UploadCopyWith(_Upload value, $Res Function(_Upload) _then) = __$UploadCopyWithImpl;
@override @useResult
$Res call({
 UploadPostParam data
});




}
/// @nodoc
class __$UploadCopyWithImpl<$Res>
    implements _$UploadCopyWith<$Res> {
  __$UploadCopyWithImpl(this._self, this._then);

  final _Upload _self;
  final $Res Function(_Upload) _then;

/// Create a copy of UploadEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_Upload(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as UploadPostParam,
  ));
}


}

/// @nodoc
mixin _$UploadState {

 GeneralState get status; String get message;
/// Create a copy of UploadState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UploadStateCopyWith<UploadState> get copyWith => _$UploadStateCopyWithImpl<UploadState>(this as UploadState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UploadState&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,status,message);

@override
String toString() {
  return 'UploadState(status: $status, message: $message)';
}


}

/// @nodoc
abstract mixin class $UploadStateCopyWith<$Res>  {
  factory $UploadStateCopyWith(UploadState value, $Res Function(UploadState) _then) = _$UploadStateCopyWithImpl;
@useResult
$Res call({
 GeneralState status, String message
});




}
/// @nodoc
class _$UploadStateCopyWithImpl<$Res>
    implements $UploadStateCopyWith<$Res> {
  _$UploadStateCopyWithImpl(this._self, this._then);

  final UploadState _self;
  final $Res Function(UploadState) _then;

/// Create a copy of UploadState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? message = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as GeneralState,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _UploadState implements UploadState {
  const _UploadState({this.status = GeneralState.initial, this.message = ''});
  

@override@JsonKey() final  GeneralState status;
@override@JsonKey() final  String message;

/// Create a copy of UploadState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UploadStateCopyWith<_UploadState> get copyWith => __$UploadStateCopyWithImpl<_UploadState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UploadState&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,status,message);

@override
String toString() {
  return 'UploadState(status: $status, message: $message)';
}


}

/// @nodoc
abstract mixin class _$UploadStateCopyWith<$Res> implements $UploadStateCopyWith<$Res> {
  factory _$UploadStateCopyWith(_UploadState value, $Res Function(_UploadState) _then) = __$UploadStateCopyWithImpl;
@override @useResult
$Res call({
 GeneralState status, String message
});




}
/// @nodoc
class __$UploadStateCopyWithImpl<$Res>
    implements _$UploadStateCopyWith<$Res> {
  __$UploadStateCopyWithImpl(this._self, this._then);

  final _UploadState _self;
  final $Res Function(_UploadState) _then;

/// Create a copy of UploadState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? message = null,}) {
  return _then(_UploadState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as GeneralState,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
