import '../../domain/entities/result.dart';
import '../../domain/entities/user/user_entity.dart';
import '../../domain/repository/authentication_repository.dart';
import '../datasource/local/authentication_local_datasource.dart';
import '../datasource/remote/authentication_remote_datasource.dart';
import '../model/login_response/login_response.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteDatasource _authenticationRemoteDatasource;
  final AuthenticationLocalDatasource _authenticationLocalDatasource;

  AuthenticationRepositoryImpl({
    required AuthenticationRemoteDatasource authenticationRemoteDatasource,
    required AuthenticationLocalDatasource authenticationLocalDatasource,
  }) : _authenticationRemoteDatasource = authenticationRemoteDatasource,
       _authenticationLocalDatasource = authenticationLocalDatasource;

  @override
  Future<Result<UserEntity>> login({
    required String email,
    required String password,
  }) async {
    var result = await _authenticationRemoteDatasource.login(
      email: email,
      password: password,
    );

    if (result is Success) {
      _authenticationLocalDatasource.saveToken(result.resultValue!.token!);
      return Result.success(result.resultValue!.toUserEntity());
    } else {
      return Result.failed(result.errorMessage ?? 'Failed to login');
    }
  }

  @override
  Future<Result<void>> logout() async {
    _authenticationLocalDatasource.deleteToken();
    return Result.success(null);
  }

  @override
  Future<Result<String>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    return await _authenticationRemoteDatasource.register(
      name: name,
      email: email,
      password: password,
    );
  }

  @override
  Future<Result<String>> getToken() async {
    var result = await _authenticationLocalDatasource.getToken();
    return Result.success(result);
  }

  @override
  Future<Result<void>> saveToken(String token) async {
    var result = await _authenticationLocalDatasource.saveToken(token);
    return Result.success(result);
  }
}
