// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DetailEvent {

 String get id;
/// Create a copy of DetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DetailEventCopyWith<DetailEvent> get copyWith => _$DetailEventCopyWithImpl<DetailEvent>(this as DetailEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetailEvent&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'DetailEvent(id: $id)';
}


}

/// @nodoc
abstract mixin class $DetailEventCopyWith<$Res>  {
  factory $DetailEventCopyWith(DetailEvent value, $Res Function(DetailEvent) _then) = _$DetailEventCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$DetailEventCopyWithImpl<$Res>
    implements $DetailEventCopyWith<$Res> {
  _$DetailEventCopyWithImpl(this._self, this._then);

  final DetailEvent _self;
  final $Res Function(DetailEvent) _then;

/// Create a copy of DetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _GetPostById implements DetailEvent {
  const _GetPostById(this.id);
  

@override final  String id;

/// Create a copy of DetailEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetPostByIdCopyWith<_GetPostById> get copyWith => __$GetPostByIdCopyWithImpl<_GetPostById>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetPostById&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'DetailEvent.getPostById(id: $id)';
}


}

/// @nodoc
abstract mixin class _$GetPostByIdCopyWith<$Res> implements $DetailEventCopyWith<$Res> {
  factory _$GetPostByIdCopyWith(_GetPostById value, $Res Function(_GetPostById) _then) = __$GetPostByIdCopyWithImpl;
@override @useResult
$Res call({
 String id
});




}
/// @nodoc
class __$GetPostByIdCopyWithImpl<$Res>
    implements _$GetPostByIdCopyWith<$Res> {
  __$GetPostByIdCopyWithImpl(this._self, this._then);

  final _GetPostById _self;
  final $Res Function(_GetPostById) _then;

/// Create a copy of DetailEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_GetPostById(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$DetailState {

 GeneralState get status; PostEntity? get post; String get message;
/// Create a copy of DetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DetailStateCopyWith<DetailState> get copyWith => _$DetailStateCopyWithImpl<DetailState>(this as DetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetailState&&(identical(other.status, status) || other.status == status)&&(identical(other.post, post) || other.post == post)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,status,post,message);

@override
String toString() {
  return 'DetailState(status: $status, post: $post, message: $message)';
}


}

/// @nodoc
abstract mixin class $DetailStateCopyWith<$Res>  {
  factory $DetailStateCopyWith(DetailState value, $Res Function(DetailState) _then) = _$DetailStateCopyWithImpl;
@useResult
$Res call({
 GeneralState status, PostEntity? post, String message
});


$PostEntityCopyWith<$Res>? get post;

}
/// @nodoc
class _$DetailStateCopyWithImpl<$Res>
    implements $DetailStateCopyWith<$Res> {
  _$DetailStateCopyWithImpl(this._self, this._then);

  final DetailState _self;
  final $Res Function(DetailState) _then;

/// Create a copy of DetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? post = freezed,Object? message = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as GeneralState,post: freezed == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as PostEntity?,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of DetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostEntityCopyWith<$Res>? get post {
    if (_self.post == null) {
    return null;
  }

  return $PostEntityCopyWith<$Res>(_self.post!, (value) {
    return _then(_self.copyWith(post: value));
  });
}
}


/// @nodoc


class _DetailState implements DetailState {
  const _DetailState({this.status = GeneralState.initial, this.post, this.message = ''});
  

@override@JsonKey() final  GeneralState status;
@override final  PostEntity? post;
@override@JsonKey() final  String message;

/// Create a copy of DetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DetailStateCopyWith<_DetailState> get copyWith => __$DetailStateCopyWithImpl<_DetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DetailState&&(identical(other.status, status) || other.status == status)&&(identical(other.post, post) || other.post == post)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,status,post,message);

@override
String toString() {
  return 'DetailState(status: $status, post: $post, message: $message)';
}


}

/// @nodoc
abstract mixin class _$DetailStateCopyWith<$Res> implements $DetailStateCopyWith<$Res> {
  factory _$DetailStateCopyWith(_DetailState value, $Res Function(_DetailState) _then) = __$DetailStateCopyWithImpl;
@override @useResult
$Res call({
 GeneralState status, PostEntity? post, String message
});


@override $PostEntityCopyWith<$Res>? get post;

}
/// @nodoc
class __$DetailStateCopyWithImpl<$Res>
    implements _$DetailStateCopyWith<$Res> {
  __$DetailStateCopyWithImpl(this._self, this._then);

  final _DetailState _self;
  final $Res Function(_DetailState) _then;

/// Create a copy of DetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? post = freezed,Object? message = null,}) {
  return _then(_DetailState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as GeneralState,post: freezed == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as PostEntity?,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of DetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostEntityCopyWith<$Res>? get post {
    if (_self.post == null) {
    return null;
  }

  return $PostEntityCopyWith<$Res>(_self.post!, (value) {
    return _then(_self.copyWith(post: value));
  });
}
}

// dart format on
