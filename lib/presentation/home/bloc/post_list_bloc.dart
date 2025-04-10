import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/constant/general_state.dart';
import '../../../domain/entities/post/post_entity.dart';
import '../../../domain/entities/query_param/query_param.dart';
import '../../../domain/entities/result.dart';
import '../../../domain/usecase/get_posts/get_posts_usecase.dart';

part 'post_list_event.dart';
part 'post_list_state.dart';
part 'post_list_bloc.freezed.dart';

class PostListBloc extends Bloc<PostListEvent, PostListState> {
  final GetPostsUsecase getPostsUsecase;

  PostListBloc({required this.getPostsUsecase}) : super(PostListState()) {
    on<_GetPosts>(_getPosts);
  }

  Future<void> _getPosts(_GetPosts event, Emitter<PostListState> emit) async {
    emit(
      state.copyWith(
        status: GeneralState.loading,
        queryParams: event.queryParams,
        isMaxPage: false,
      ),
    );

    var result = await getPostsUsecase.call(state.queryParams);
    List<PostEntity> posts = state.posts;

    if (state.queryParams.page > 1) {
      posts = posts + (result.resultValue ?? []);
    } else {
      posts = result.resultValue ?? [];
    }

    if (result is Success) {
      await Future.delayed(const Duration(seconds: 2)); 
      if (result.resultValue!.isNotEmpty) {
        emit(state.copyWith(status: GeneralState.success, posts: posts));
      } else {
        emit(
          state.copyWith(
            status: GeneralState.success,
            isMaxPage: true,
          ),
        );
      }
    } else {
      emit(
        state.copyWith(
          status: GeneralState.error,
          message: result.errorMessage ?? '',
        ),
      );
    }
  }
}
