// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'query_param.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QueryParam {

 int get page; int get size; int get location;
/// Create a copy of QueryParam
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QueryParamCopyWith<QueryParam> get copyWith => _$QueryParamCopyWithImpl<QueryParam>(this as QueryParam, _$identity);

  /// Serializes this QueryParam to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QueryParam&&(identical(other.page, page) || other.page == page)&&(identical(other.size, size) || other.size == size)&&(identical(other.location, location) || other.location == location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,size,location);

@override
String toString() {
  return 'QueryParam(page: $page, size: $size, location: $location)';
}


}

/// @nodoc
abstract mixin class $QueryParamCopyWith<$Res>  {
  factory $QueryParamCopyWith(QueryParam value, $Res Function(QueryParam) _then) = _$QueryParamCopyWithImpl;
@useResult
$Res call({
 int page, int size, int location
});




}
/// @nodoc
class _$QueryParamCopyWithImpl<$Res>
    implements $QueryParamCopyWith<$Res> {
  _$QueryParamCopyWithImpl(this._self, this._then);

  final QueryParam _self;
  final $Res Function(QueryParam) _then;

/// Create a copy of QueryParam
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? page = null,Object? size = null,Object? location = null,}) {
  return _then(_self.copyWith(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _QueryParam implements QueryParam {
  const _QueryParam({this.page = 1, this.size = 10, this.location = 0});
  factory _QueryParam.fromJson(Map<String, dynamic> json) => _$QueryParamFromJson(json);

@override@JsonKey() final  int page;
@override@JsonKey() final  int size;
@override@JsonKey() final  int location;

/// Create a copy of QueryParam
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QueryParamCopyWith<_QueryParam> get copyWith => __$QueryParamCopyWithImpl<_QueryParam>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QueryParamToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QueryParam&&(identical(other.page, page) || other.page == page)&&(identical(other.size, size) || other.size == size)&&(identical(other.location, location) || other.location == location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,size,location);

@override
String toString() {
  return 'QueryParam(page: $page, size: $size, location: $location)';
}


}

/// @nodoc
abstract mixin class _$QueryParamCopyWith<$Res> implements $QueryParamCopyWith<$Res> {
  factory _$QueryParamCopyWith(_QueryParam value, $Res Function(_QueryParam) _then) = __$QueryParamCopyWithImpl;
@override @useResult
$Res call({
 int page, int size, int location
});




}
/// @nodoc
class __$QueryParamCopyWithImpl<$Res>
    implements _$QueryParamCopyWith<$Res> {
  __$QueryParamCopyWithImpl(this._self, this._then);

  final _QueryParam _self;
  final $Res Function(_QueryParam) _then;

/// Create a copy of QueryParam
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = null,Object? size = null,Object? location = null,}) {
  return _then(_QueryParam(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
