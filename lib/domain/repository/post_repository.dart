import '../entities/post/post_entity.dart';
import '../entities/result.dart';

abstract interface class PostRepository {
  Future<Result<List<PostEntity>>> getPosts();
}