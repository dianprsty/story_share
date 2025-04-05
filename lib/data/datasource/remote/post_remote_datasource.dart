import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constant/strings.dart';
import '../../../core/service/api_service.dart';
import '../../../domain/entities/result.dart';
import '../../model/post/post_model.dart';

abstract interface class PostRemoteDatasource {
  Future<Result<List<PostModel>>> getPosts();
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
          (response.data['listStory'] as List).map((e) => PostModel.fromJson(e)).toList(),
        );
      } else {
        return Result.failed('Failed to get stories');
      }
    } catch (e) {
      return Result.failed('Failed to get stories');
    }
  }
}
