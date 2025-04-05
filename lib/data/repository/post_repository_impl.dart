import '../../domain/entities/post/post_entity.dart';
import '../../domain/entities/result.dart';
import '../../domain/repository/post_repository.dart';
import '../datasource/remote/post_remote_datasource.dart';
import '../model/post/post_model.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDatasource _postRemoteDatasource;

  PostRepositoryImpl({required PostRemoteDatasource postRemoteDatasource})
    : _postRemoteDatasource = postRemoteDatasource;

  @override
  Future<Result<List<PostEntity>>> getPosts() async{
    final result = await _postRemoteDatasource.getPosts();

    if (result is Success) {
      return Result.success(result.resultValue!.map((e) => e.toPostEntity()).toList());
    } else {
      return Result.failed(result.errorMessage ?? 'Failed to get stories');
    }
  }
}
