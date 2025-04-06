
import '../entities/post/post_entity.dart';
import '../entities/result.dart';
import '../usecase/upload_post/upload_post_param.dart';

abstract interface class PostRepository {
  Future<Result<List<PostEntity>>> getPosts();
  Future<Result<String>> uploadPost(UploadPostParam data);
}