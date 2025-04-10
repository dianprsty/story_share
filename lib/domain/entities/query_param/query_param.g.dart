// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_param.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QueryParam _$QueryParamFromJson(Map<String, dynamic> json) => _QueryParam(
  page: (json['page'] as num?)?.toInt() ?? 1,
  size: (json['size'] as num?)?.toInt() ?? 10,
  location: (json['location'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$QueryParamToJson(_QueryParam instance) =>
    <String, dynamic>{
      'page': instance.page,
      'size': instance.size,
      'location': instance.location,
    };
