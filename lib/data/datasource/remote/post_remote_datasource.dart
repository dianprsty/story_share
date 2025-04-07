import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constant/strings.dart';
import '../../../core/service/api_service.dart';
import '../../../domain/entities/result.dart';
import '../../model/post/post_model.dart';
import '../../model/post/upload_request_model.dart';

abstract interface class PostRemoteDatasource {
  Future<Result<List<PostModel>>> getPosts();
  Future<Result<String>> uploadPost(UploadRequestModel data);
  Future<Result<PostModel>> getPostById(String id);
}

class PostRemoteDatasourceImpl implements PostRemoteDatasource {
  final ApiService _apiService;
  final SharedPreferences _sharedPreferences;

  PostRemoteDatasourceImpl({
    required ApiService apiService,
    required SharedPreferences sharedPreferences,
  }) : _apiService = apiService,
       _sharedPreferences = sharedPreferences;

  @override
  Future<Result<List<PostModel>>> getPosts() async {
    try {
      String token = _sharedPreferences.getString(tokenKey) ?? '';
      if (token.isEmpty) return Result.failed('Unauthorized');

      final response = await _apiService.fetchDataWithToken(
        url: '/stories?size=100&page=1',
        token: token,
      );

      if (response.statusCode == 200) {
        return Result.success(
          (response.data['listStory'] as List)
              .map((e) => PostModel.fromJson(e))
              .toList(),
        );
      } else {
        return Result.failed('Failed to get stories');
      }
    } catch (e) {
      return Result.failed('Failed to get stories');
    }
  }

  @override
  Future<Result<String>> uploadPost(UploadRequestModel data) async {
    try {
      final formData = FormData.fromMap({
        'description': data.description,
        'photo': await MultipartFile.fromFile(
          data.image.path,
          filename: data.image.path.split('/').last,
        ),
      });

      String token = _sharedPreferences.getString(tokenKey) ?? '';
      if (token.isEmpty) return Result.failed('Unauthorized');

      var response = await _apiService.uploadFileWithToken(
        url: '/stories',
        token: token,
        formData: formData,
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        return Result.success(response.data['message']);
      } else {
        return Result.failed(
          response.data['message'] ?? 'Failed to upload post',
        );
      }
    } catch (e) {
      return Result.failed('Failed to upload post');
    }
  }

  @override
  Future<Result<PostModel>> getPostById(String id) async {
    try {
      final result = await _apiService.fetchDataWithToken(
        url: '/stories/$id',
        token: _sharedPreferences.getString(tokenKey) ?? '',
      );

      if (result.statusCode == 200) {
        return Result.success(PostModel.fromJson(result.data['story']));
      } else {
        return Result.failed(
          result.data['message'] ?? 'Failed to get post details',
        );
      }
    } catch (e) {
      return Result.failed('Failed to get post details');
    }
  }
}
