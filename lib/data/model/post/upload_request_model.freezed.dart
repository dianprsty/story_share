// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UploadRequestModel {

 File get image; String get description; double? get lat; double? get lon;
/// Create a copy of UploadRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UploadRequestModelCopyWith<UploadRequestModel> get copyWith => _$UploadRequestModelCopyWithImpl<UploadRequestModel>(this as UploadRequestModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UploadRequestModel&&(identical(other.image, image) || other.image == image)&&(identical(other.description, description) || other.description == description)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lon, lon) || other.lon == lon));
}


@override
int get hashCode => Object.hash(runtimeType,image,description,lat,lon);

@override
String toString() {
  return 'UploadRequestModel(image: $image, description: $description, lat: $lat, lon: $lon)';
}


}

/// @nodoc
abstract mixin class $UploadRequestModelCopyWith<$Res>  {
  factory $UploadRequestModelCopyWith(UploadRequestModel value, $Res Function(UploadRequestModel) _then) = _$UploadRequestModelCopyWithImpl;
@useResult
$Res call({
 File image, String description, double? lat, double? lon
});




}
/// @nodoc
class _$UploadRequestModelCopyWithImpl<$Res>
    implements $UploadRequestModelCopyWith<$Res> {
  _$UploadRequestModelCopyWithImpl(this._self, this._then);

  final UploadRequestModel _self;
  final $Res Function(UploadRequestModel) _then;

/// Create a copy of UploadRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? image = null,Object? description = null,Object? lat = freezed,Object? lon = freezed,}) {
  return _then(_self.copyWith(
image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as File,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lon: freezed == lon ? _self.lon : lon // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// @nodoc


class _UploadRequestModel implements UploadRequestModel {
   _UploadRequestModel({required this.image, required this.description, this.lat, this.lon});
  

@override final  File image;
@override final  String description;
@override final  double? lat;
@override final  double? lon;

/// Create a copy of UploadRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UploadRequestModelCopyWith<_UploadRequestModel> get copyWith => __$UploadRequestModelCopyWithImpl<_UploadRequestModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UploadRequestModel&&(identical(other.image, image) || other.image == image)&&(identical(other.description, description) || other.description == description)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lon, lon) || other.lon == lon));
}


@override
int get hashCode => Object.hash(runtimeType,image,description,lat,lon);

@override
String toString() {
  return 'UploadRequestModel(image: $image, description: $description, lat: $lat, lon: $lon)';
}


}

/// @nodoc
abstract mixin class _$UploadRequestModelCopyWith<$Res> implements $UploadRequestModelCopyWith<$Res> {
  factory _$UploadRequestModelCopyWith(_UploadRequestModel value, $Res Function(_UploadRequestModel) _then) = __$UploadRequestModelCopyWithImpl;
@override @useResult
$Res call({
 File image, String description, double? lat, double? lon
});




}
/// @nodoc
class __$UploadRequestModelCopyWithImpl<$Res>
    implements _$UploadRequestModelCopyWith<$Res> {
  __$UploadRequestModelCopyWithImpl(this._self, this._then);

  final _UploadRequestModel _self;
  final $Res Function(_UploadRequestModel) _then;

/// Create a copy of UploadRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? image = null,Object? description = null,Object? lat = freezed,Object? lon = freezed,}) {
  return _then(_UploadRequestModel(
image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as File,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lon: freezed == lon ? _self.lon : lon // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
