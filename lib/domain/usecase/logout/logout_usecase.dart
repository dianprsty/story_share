import '../../repository/authentication_repository.dart';
import '../../entities/result.dart';
import '../usecase.dart';

class LogoutUsecase implements UseCase<void, void> {
  final AuthenticationRepository _authenticationRepository;

  LogoutUsecase({required AuthenticationRepository authenticationRepository})
    : _authenticationRepository = authenticationRepository;

  @override
  Future<void> call(_) async {
    var result = await _authenticationRepository.logout();

    if (result is Success) {
      return Future.value(null);
    } else {
      return Future.error(result.errorMessage ?? 'Failed to logout');
    }
  }
}
