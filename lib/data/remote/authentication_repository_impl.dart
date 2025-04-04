import '../../core/service/api_service.dart';
import '../../domain/entities/result.dart';
import '../repository/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final ApiService _apiService;

  AuthenticationRepositoryImpl({required ApiService apiService})
    : _apiService = apiService;

  @override
  Future<Result<String>> login({
    required String email,
    required String password,
  }) async {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> logout() {
    // TODO: implement logout
    throw UnimplementedError();
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
      return Result.failed( 'Failed to register');
    }
  }
}
