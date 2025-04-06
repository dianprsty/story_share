import '../../domain/entities/post/post_entity.dart';
import '../../domain/entities/result.dart';
import '../../domain/repository/post_repository.dart';
import '../../domain/usecase/upload_post/upload_post_param.dart';
import '../datasource/remote/post_remote_datasource.dart';
import '../model/post/post_model.dart';
import '../model/post/upload_request_model.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDatasource _postRemoteDatasource;

  PostRepositoryImpl({required PostRemoteDatasource postRemoteDatasource})
    : _postRemoteDatasource = postRemoteDatasource;

  @override
  Future<Result<List<PostEntity>>> getPosts() async {
    final result = await _postRemoteDatasource.getPosts();

    if (result is Success) {
      return Result.success(
        result.resultValue!.map((e) => e.toPostEntity()).toList(),
      );
    } else {
      return Result.failed(result.errorMessage ?? 'Failed to get stories');
    }
  }

  @override
  Future<Result<String>> uploadPost(UploadPostParam data) async {
    final result = await _postRemoteDatasource.uploadPost(
      UploadRequestModel(image: data.image, description: data.description),
    );

    return result;
  }
}
