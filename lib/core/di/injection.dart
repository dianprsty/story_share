import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/remote/authentication_repository_impl.dart';
import '../../domain/usecase/register/register_usecase.dart';
import '../service/api_service.dart';
import '../service/shared_preferences_service.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton(() => SharedPreferences.getInstance());
  getIt.registerLazySingleton(() => ApiService());
  getIt.registerLazySingleton(
    () => SharedPreferencesService(getIt<SharedPreferences>()),
  );

  getIt.registerLazySingleton(
    () => AuthenticationRepositoryImpl(apiService: getIt<ApiService>()),
  );

  getIt.registerLazySingleton(
    () => RegisterUsecase(
      authenticationRepository: getIt<AuthenticationRepositoryImpl>(),
    ),
  );
}
