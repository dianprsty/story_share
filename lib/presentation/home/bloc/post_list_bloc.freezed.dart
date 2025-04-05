// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PostListEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostListEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PostListEvent()';
}


}

/// @nodoc
class $PostListEventCopyWith<$Res>  {
$PostListEventCopyWith(PostListEvent _, $Res Function(PostListEvent) __);
}


/// @nodoc


class _GetPosts implements PostListEvent {
  const _GetPosts();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetPosts);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PostListEvent.getPosts()';
}


}




/// @nodoc
mixin _$PostListState {

 GeneralState get status; List<PostEntity> get posts; String get message;
/// Create a copy of PostListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostListStateCopyWith<PostListState> get copyWith => _$PostListStateCopyWithImpl<PostListState>(this as PostListState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostListState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.posts, posts)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(posts),message);

@override
String toString() {
  return 'PostListState(status: $status, posts: $posts, message: $message)';
}


}

/// @nodoc
abstract mixin class $PostListStateCopyWith<$Res>  {
  factory $PostListStateCopyWith(PostListState value, $Res Function(PostListState) _then) = _$PostListStateCopyWithImpl;
@useResult
$Res call({
 GeneralState status, List<PostEntity> posts, String message
});




}
/// @nodoc
class _$PostListStateCopyWithImpl<$Res>
    implements $PostListStateCopyWith<$Res> {
  _$PostListStateCopyWithImpl(this._self, this._then);

  final PostListState _self;
  final $Res Function(PostListState) _then;

/// Create a copy of PostListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? posts = null,Object? message = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as GeneralState,posts: null == posts ? _self.posts : posts // ignore: cast_nullable_to_non_nullable
as List<PostEntity>,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _PostListState implements PostListState {
  const _PostListState({this.status = GeneralState.initial, final  List<PostEntity> posts = const [], this.message = ''}): _posts = posts;
  

@override@JsonKey() final  GeneralState status;
 final  List<PostEntity> _posts;
@override@JsonKey() List<PostEntity> get posts {
  if (_posts is EqualUnmodifiableListView) return _posts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_posts);
}

@override@JsonKey() final  String message;

/// Create a copy of PostListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostListStateCopyWith<_PostListState> get copyWith => __$PostListStateCopyWithImpl<_PostListState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostListState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._posts, _posts)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_posts),message);

@override
String toString() {
  return 'PostListState(status: $status, posts: $posts, message: $message)';
}


}

/// @nodoc
abstract mixin class _$PostListStateCopyWith<$Res> implements $PostListStateCopyWith<$Res> {
  factory _$PostListStateCopyWith(_PostListState value, $Res Function(_PostListState) _then) = __$PostListStateCopyWithImpl;
@override @useResult
$Res call({
 GeneralState status, List<PostEntity> posts, String message
});




}
/// @nodoc
class __$PostListStateCopyWithImpl<$Res>
    implements _$PostListStateCopyWith<$Res> {
  __$PostListStateCopyWithImpl(this._self, this._then);

  final _PostListState _self;
  final $Res Function(_PostListState) _then;

/// Create a copy of PostListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? posts = null,Object? message = null,}) {
  return _then(_PostListState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as GeneralState,posts: null == posts ? _self._posts : posts // ignore: cast_nullable_to_non_nullable
as List<PostEntity>,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
