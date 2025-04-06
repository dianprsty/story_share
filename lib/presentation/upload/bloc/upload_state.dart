part of 'upload_bloc.dart';

@freezed
abstract class UploadState with _$UploadState {
  const factory UploadState({
    @Default(GeneralState.initial) GeneralState status,
    @Default('') String message,
  }) = _UploadState;
}
