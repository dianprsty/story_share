import '../../entities/result.dart';
import '../../repository/post_repository.dart';
import '../usecase.dart';

import 'upload_post_param.dart';

class UploadPostUsecase implements UseCase<Result<String>, UploadPostParam> {
  final PostRepository _postRepository;

  UploadPostUsecase({required PostRepository postRepository})
    : _postRepository = postRepository;

  @override
  Future<Result<String>> call(UploadPostParam params) async {
    return await _postRepository.uploadPost(params);
  }
}
