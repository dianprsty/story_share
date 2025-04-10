
import '../entities/post/post_entity.dart';
import '../entities/query_param/query_param.dart';
import '../entities/result.dart';
import '../usecase/upload_post/upload_post_param.dart';

abstract interface class PostRepository {
  Future<Result<List<PostEntity>>> getPosts(QueryParam params);
  Future<Result<String>> uploadPost(UploadPostParam data);
  Future<Result<PostEntity>> getPostById(String id);
}