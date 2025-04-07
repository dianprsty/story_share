part of 'detail_bloc.dart';

@freezed
abstract class DetailState with _$DetailState {
  const factory DetailState({
    @Default(GeneralState.initial) GeneralState status,
    PostEntity? post,
    @Default('') String message
  }) = _DetailState;
}
