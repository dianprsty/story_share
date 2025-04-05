import '../../repository/authentication_repository.dart';
import '../../entities/result.dart';
import '../usecase.dart';
import 'register_param.dart';

class RegisterUsecase implements UseCase<Result<String>, RegisterParam> {
  final AuthenticationRepository _authenticationRepository;

  RegisterUsecase({required AuthenticationRepository authenticationRepository})
    : _authenticationRepository = authenticationRepository;

  @override
  Future<Result<String>> call(RegisterParam params) async {
    var result = await _authenticationRepository.register(
      name: params.name,
      email: params.email,
      password: params.password,
    );

    if(result is Success) {
      return Result.success(result.resultValue ?? '');
    } else  {
      return Result.failed(result.errorMessage ?? 'Failed to register');
    }
    
  }
}
