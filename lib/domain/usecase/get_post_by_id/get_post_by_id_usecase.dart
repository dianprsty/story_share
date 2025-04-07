import '../../entities/post/post_entity.dart';
import '../../entities/result.dart';
import '../../repository/post_repository.dart';
import '../usecase.dart';

class GetPostByIdUsecase implements UseCase<Result<PostEntity>, String> {
  final PostRepository _postRepository;

  GetPostByIdUsecase({required PostRepository postRepository})
    : _postRepository = postRepository;

  @override
  Future<Result<PostEntity>> call(String params) async{
    return await _postRepository.getPostById(params);
  }
}
