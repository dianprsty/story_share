import '../../../core/service/api_service.dart';
import '../../../domain/entities/result.dart';
import '../../model/login_response/login_response.dart';

abstract interface class AuthenticationRemoteDatasource {
  Future<Result<LoginResponse>> login({
    required String email,
    required String password,
  });

  Future<Result<String>> register({
    required String name,
    required String email,
    required String password,
  });
}

class AuthenticationRemoteDatasourceImpl
    implements AuthenticationRemoteDatasource {
  final ApiService _apiService;

  AuthenticationRemoteDatasourceImpl({required ApiService apiService})
    : _apiService = apiService;
  @override
  Future<Result<LoginResponse>> login({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _apiService.postData('/login', {
        'email': email,
        'password': password,
      });

      if (result.statusCode == 200) {
        return Result.success(
          LoginResponse.fromJson(result.data['loginResult']),
        );
      } else {
        return Result.failed(result.data['message'] ?? 'Failed to login');
      }
    } catch (e) {
      return Result.failed('Failed to login');
    }
  }

  @override
  Future<Result<String>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final result = await _apiService.postData('/register', {
        'name': name,
        'email': email,
        'password': password,
      });

      if (result.statusCode == 201) {
        return Result.success(result.data['message']);
      } else {
        return Result.failed(result.data['message'] ?? 'Failed to register');
      }
    } catch (e) {
      return Result.failed('Failed to register');
    }
  }
}
