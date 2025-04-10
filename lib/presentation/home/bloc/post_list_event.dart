part of 'post_list_bloc.dart';

@freezed
abstract class PostListEvent with _$PostListEvent {
  const factory PostListEvent.getPosts(QueryParam queryParams) = _GetPosts;
}