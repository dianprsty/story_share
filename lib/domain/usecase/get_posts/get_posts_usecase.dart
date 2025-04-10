import '../../entities/post/post_entity.dart';
import '../../entities/query_param/query_param.dart';
import '../../entities/result.dart';
import '../../repository/post_repository.dart';
import '../usecase.dart';


class GetPostsUsecase implements UseCase<Result<List<PostEntity>>, QueryParam> {
  final PostRepository _postRepository;

  GetPostsUsecase({required PostRepository postRepository})
    : _postRepository = postRepository;

  @override
  Future<Result<List<PostEntity>>> call(QueryParam params) async{
    return await _postRepository.getPosts(params);
  }
}
