import '../entities/result.dart';
import '../entities/user/user_entity.dart';

abstract interface class AuthenticationRepository {
  Future<Result<UserEntity>> login({
    required String email,
    required String password,
  });

  Future<Result<String>> register({
    required String name,
    required String email,
    required String password,
  });

  Future<Result<void>> logout();

  Future<Result<String>> getToken();
  Future<void> saveToken(String token);
}
