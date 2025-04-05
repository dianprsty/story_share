import '../../entities/user/user_entity.dart';
import '../../repository/authentication_repository.dart';
import '../../entities/result.dart';
import '../usecase.dart';
import 'login_param.dart';

class LoginUsecase implements UseCase<Result<UserEntity>, LoginParam> {
  final AuthenticationRepository _authenticationRepository;

  LoginUsecase({required AuthenticationRepository authenticationRepository})
    : _authenticationRepository = authenticationRepository;

  @override
  Future<Result<UserEntity>> call(LoginParam params) async {
    var result = await _authenticationRepository.login(
      email: params.email,
      password: params.password,
    );

    if (result is Success) {
      _authenticationRepository.saveToken(result.resultValue!.token!);
      return Result.success(result.resultValue!);
    } else {
      return Result.failed(result.errorMessage ?? 'Failed to login');
    }
  }
}
