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

 QueryParam get queryParams;
/// Create a copy of PostListEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostListEventCopyWith<PostListEvent> get copyWith => _$PostListEventCopyWithImpl<PostListEvent>(this as PostListEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostListEvent&&(identical(other.queryParams, queryParams) || other.queryParams == queryParams));
}


@override
int get hashCode => Object.hash(runtimeType,queryParams);

@override
String toString() {
  return 'PostListEvent(queryParams: $queryParams)';
}


}

/// @nodoc
abstract mixin class $PostListEventCopyWith<$Res>  {
  factory $PostListEventCopyWith(PostListEvent value, $Res Function(PostListEvent) _then) = _$PostListEventCopyWithImpl;
@useResult
$Res call({
 QueryParam queryParams
});


$QueryParamCopyWith<$Res> get queryParams;

}
/// @nodoc
class _$PostListEventCopyWithImpl<$Res>
    implements $PostListEventCopyWith<$Res> {
  _$PostListEventCopyWithImpl(this._self, this._then);

  final PostListEvent _self;
  final $Res Function(PostListEvent) _then;

/// Create a copy of PostListEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? queryParams = null,}) {
  return _then(_self.copyWith(
queryParams: null == queryParams ? _self.queryParams : queryParams // ignore: cast_nullable_to_non_nullable
as QueryParam,
  ));
}
/// Create a copy of PostListEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QueryParamCopyWith<$Res> get queryParams {
  
  return $QueryParamCopyWith<$Res>(_self.queryParams, (value) {
    return _then(_self.copyWith(queryParams: value));
  });
}
}


/// @nodoc


class _GetPosts implements PostListEvent {
  const _GetPosts(this.queryParams);
  

@override final  QueryParam queryParams;

/// Create a copy of PostListEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetPostsCopyWith<_GetPosts> get copyWith => __$GetPostsCopyWithImpl<_GetPosts>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetPosts&&(identical(other.queryParams, queryParams) || other.queryParams == queryParams));
}


@override
int get hashCode => Object.hash(runtimeType,queryParams);

@override
String toString() {
  return 'PostListEvent.getPosts(queryParams: $queryParams)';
}


}

/// @nodoc
abstract mixin class _$GetPostsCopyWith<$Res> implements $PostListEventCopyWith<$Res> {
  factory _$GetPostsCopyWith(_GetPosts value, $Res Function(_GetPosts) _then) = __$GetPostsCopyWithImpl;
@override @useResult
$Res call({
 QueryParam queryParams
});


@override $QueryParamCopyWith<$Res> get queryParams;

}
/// @nodoc
class __$GetPostsCopyWithImpl<$Res>
    implements _$GetPostsCopyWith<$Res> {
  __$GetPostsCopyWithImpl(this._self, this._then);

  final _GetPosts _self;
  final $Res Function(_GetPosts) _then;

/// Create a copy of PostListEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? queryParams = null,}) {
  return _then(_GetPosts(
null == queryParams ? _self.queryParams : queryParams // ignore: cast_nullable_to_non_nullable
as QueryParam,
  ));
}

/// Create a copy of PostListEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QueryParamCopyWith<$Res> get queryParams {
  
  return $QueryParamCopyWith<$Res>(_self.queryParams, (value) {
    return _then(_self.copyWith(queryParams: value));
  });
}
}

/// @nodoc
mixin _$PostListState {

 GeneralState get status; List<PostEntity> get posts; String get message; bool get isMaxPage; QueryParam get queryParams;
/// Create a copy of PostListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostListStateCopyWith<PostListState> get copyWith => _$PostListStateCopyWithImpl<PostListState>(this as PostListState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostListState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.posts, posts)&&(identical(other.message, message) || other.message == message)&&(identical(other.isMaxPage, isMaxPage) || other.isMaxPage == isMaxPage)&&(identical(other.queryParams, queryParams) || other.queryParams == queryParams));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(posts),message,isMaxPage,queryParams);

@override
String toString() {
  return 'PostListState(status: $status, posts: $posts, message: $message, isMaxPage: $isMaxPage, queryParams: $queryParams)';
}


}

/// @nodoc
abstract mixin class $PostListStateCopyWith<$Res>  {
  factory $PostListStateCopyWith(PostListState value, $Res Function(PostListState) _then) = _$PostListStateCopyWithImpl;
@useResult
$Res call({
 GeneralState status, List<PostEntity> posts, String message, bool isMaxPage, QueryParam queryParams
});


$QueryParamCopyWith<$Res> get queryParams;

}
/// @nodoc
class _$PostListStateCopyWithImpl<$Res>
    implements $PostListStateCopyWith<$Res> {
  _$PostListStateCopyWithImpl(this._self, this._then);

  final PostListState _self;
  final $Res Function(PostListState) _then;

/// Create a copy of PostListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? posts = null,Object? message = null,Object? isMaxPage = null,Object? queryParams = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as GeneralState,posts: null == posts ? _self.posts : posts // ignore: cast_nullable_to_non_nullable
as List<PostEntity>,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,isMaxPage: null == isMaxPage ? _self.isMaxPage : isMaxPage // ignore: cast_nullable_to_non_nullable
as bool,queryParams: null == queryParams ? _self.queryParams : queryParams // ignore: cast_nullable_to_non_nullable
as QueryParam,
  ));
}
/// Create a copy of PostListState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QueryParamCopyWith<$Res> get queryParams {
  
  return $QueryParamCopyWith<$Res>(_self.queryParams, (value) {
    return _then(_self.copyWith(queryParams: value));
  });
}
}


/// @nodoc


class _PostListState implements PostListState {
  const _PostListState({this.status = GeneralState.initial, final  List<PostEntity> posts = const [], this.message = '', this.isMaxPage = false, this.queryParams = const QueryParam()}): _posts = posts;
  

@override@JsonKey() final  GeneralState status;
 final  List<PostEntity> _posts;
@override@JsonKey() List<PostEntity> get posts {
  if (_posts is EqualUnmodifiableListView) return _posts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_posts);
}

@override@JsonKey() final  String message;
@override@JsonKey() final  bool isMaxPage;
@override@JsonKey() final  QueryParam queryParams;

/// Create a copy of PostListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostListStateCopyWith<_PostListState> get copyWith => __$PostListStateCopyWithImpl<_PostListState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostListState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._posts, _posts)&&(identical(other.message, message) || other.message == message)&&(identical(other.isMaxPage, isMaxPage) || other.isMaxPage == isMaxPage)&&(identical(other.queryParams, queryParams) || other.queryParams == queryParams));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_posts),message,isMaxPage,queryParams);

@override
String toString() {
  return 'PostListState(status: $status, posts: $posts, message: $message, isMaxPage: $isMaxPage, queryParams: $queryParams)';
}


}

/// @nodoc
abstract mixin class _$PostListStateCopyWith<$Res> implements $PostListStateCopyWith<$Res> {
  factory _$PostListStateCopyWith(_PostListState value, $Res Function(_PostListState) _then) = __$PostListStateCopyWithImpl;
@override @useResult
$Res call({
 GeneralState status, List<PostEntity> posts, String message, bool isMaxPage, QueryParam queryParams
});


@override $QueryParamCopyWith<$Res> get queryParams;

}
/// @nodoc
class __$PostListStateCopyWithImpl<$Res>
    implements _$PostListStateCopyWith<$Res> {
  __$PostListStateCopyWithImpl(this._self, this._then);

  final _PostListState _self;
  final $Res Function(_PostListState) _then;

/// Create a copy of PostListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? posts = null,Object? message = null,Object? isMaxPage = null,Object? queryParams = null,}) {
  return _then(_PostListState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as GeneralState,posts: null == posts ? _self._posts : posts // ignore: cast_nullable_to_non_nullable
as List<PostEntity>,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,isMaxPage: null == isMaxPage ? _self.isMaxPage : isMaxPage // ignore: cast_nullable_to_non_nullable
as bool,queryParams: null == queryParams ? _self.queryParams : queryParams // ignore: cast_nullable_to_non_nullable
as QueryParam,
  ));
}

/// Create a copy of PostListState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QueryParamCopyWith<$Res> get queryParams {
  
  return $QueryParamCopyWith<$Res>(_self.queryParams, (value) {
    return _then(_self.copyWith(queryParams: value));
  });
}
}

// dart format on
