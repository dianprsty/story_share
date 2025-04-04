import '../../domain/entities/result.dart';

abstract interface class AuthenticationRepository {
  Future<Result<String>> login({
    required String email,
    required String password,
  });

  Future<Result<String>> register({
    required String name,
    required String email,
    required String password,
  });

  Future<Result<void>> logout();
}
