import 'package:freezed_annotation/freezed_annotation.dart';

part 'query_param.freezed.dart';
part 'query_param.g.dart';

@freezed
abstract class QueryParam with _$QueryParam {
  const factory QueryParam({
    @Default(1) int page,
    @Default(10) int size,
    @Default(1) int location,
  }) = _QueryParam;

  factory QueryParam.fromJson(Map<String, dynamic> json) =>
      _$QueryParamFromJson(json);
}
