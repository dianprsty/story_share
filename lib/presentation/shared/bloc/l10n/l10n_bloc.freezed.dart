// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'l10n_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$L10nEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is L10nEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'L10nEvent()';
}


}

/// @nodoc
class $L10nEventCopyWith<$Res>  {
$L10nEventCopyWith(L10nEvent _, $Res Function(L10nEvent) __);
}


/// @nodoc


class _GetLanguage implements L10nEvent {
  const _GetLanguage();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetLanguage);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'L10nEvent.getLanguage()';
}


}




/// @nodoc


class _ChangeLanguage implements L10nEvent {
  const _ChangeLanguage(this.language);
  

 final  String language;

/// Create a copy of L10nEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeLanguageCopyWith<_ChangeLanguage> get copyWith => __$ChangeLanguageCopyWithImpl<_ChangeLanguage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeLanguage&&(identical(other.language, language) || other.language == language));
}


@override
int get hashCode => Object.hash(runtimeType,language);

@override
String toString() {
  return 'L10nEvent.changeLanguage(language: $language)';
}


}

/// @nodoc
abstract mixin class _$ChangeLanguageCopyWith<$Res> implements $L10nEventCopyWith<$Res> {
  factory _$ChangeLanguageCopyWith(_ChangeLanguage value, $Res Function(_ChangeLanguage) _then) = __$ChangeLanguageCopyWithImpl;
@useResult
$Res call({
 String language
});




}
/// @nodoc
class __$ChangeLanguageCopyWithImpl<$Res>
    implements _$ChangeLanguageCopyWith<$Res> {
  __$ChangeLanguageCopyWithImpl(this._self, this._then);

  final _ChangeLanguage _self;
  final $Res Function(_ChangeLanguage) _then;

/// Create a copy of L10nEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? language = null,}) {
  return _then(_ChangeLanguage(
null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$L10nState {

 GeneralState get status; Locale get locale;
/// Create a copy of L10nState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$L10nStateCopyWith<L10nState> get copyWith => _$L10nStateCopyWithImpl<L10nState>(this as L10nState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is L10nState&&(identical(other.status, status) || other.status == status)&&(identical(other.locale, locale) || other.locale == locale));
}


@override
int get hashCode => Object.hash(runtimeType,status,locale);

@override
String toString() {
  return 'L10nState(status: $status, locale: $locale)';
}


}

/// @nodoc
abstract mixin class $L10nStateCopyWith<$Res>  {
  factory $L10nStateCopyWith(L10nState value, $Res Function(L10nState) _then) = _$L10nStateCopyWithImpl;
@useResult
$Res call({
 GeneralState status, Locale locale
});




}
/// @nodoc
class _$L10nStateCopyWithImpl<$Res>
    implements $L10nStateCopyWith<$Res> {
  _$L10nStateCopyWithImpl(this._self, this._then);

  final L10nState _self;
  final $Res Function(L10nState) _then;

/// Create a copy of L10nState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? locale = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as GeneralState,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as Locale,
  ));
}

}


/// @nodoc


class _L10nState implements L10nState {
  const _L10nState({this.status = GeneralState.initial, this.locale = const Locale('id')});
  

@override@JsonKey() final  GeneralState status;
@override@JsonKey() final  Locale locale;

/// Create a copy of L10nState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$L10nStateCopyWith<_L10nState> get copyWith => __$L10nStateCopyWithImpl<_L10nState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _L10nState&&(identical(other.status, status) || other.status == status)&&(identical(other.locale, locale) || other.locale == locale));
}


@override
int get hashCode => Object.hash(runtimeType,status,locale);

@override
String toString() {
  return 'L10nState(status: $status, locale: $locale)';
}


}

/// @nodoc
abstract mixin class _$L10nStateCopyWith<$Res> implements $L10nStateCopyWith<$Res> {
  factory _$L10nStateCopyWith(_L10nState value, $Res Function(_L10nState) _then) = __$L10nStateCopyWithImpl;
@override @useResult
$Res call({
 GeneralState status, Locale locale
});




}
/// @nodoc
class __$L10nStateCopyWithImpl<$Res>
    implements _$L10nStateCopyWith<$Res> {
  __$L10nStateCopyWithImpl(this._self, this._then);

  final _L10nState _self;
  final $Res Function(_L10nState) _then;

/// Create a copy of L10nState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? locale = null,}) {
  return _then(_L10nState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as GeneralState,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as Locale,
  ));
}


}

// dart format on
