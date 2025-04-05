part of 'post_list_bloc.dart';

@freezed
abstract class PostListState with _$PostListState {
  const factory PostListState({
    @Default(GeneralState.initial) GeneralState status,
    @Default([]) List<PostEntity> posts,
    @Default('') String message,
  }) = _PostListState;
}
