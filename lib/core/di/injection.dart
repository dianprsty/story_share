import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/datasource/local/authentication_local_datasource.dart';
import '../../data/datasource/remote/authentication_remote_datasource.dart';
import '../../data/repository/authentication_repository_impl.dart';
import '../../domain/usecase/login/login_usecase.dart';
import '../../domain/usecase/logout/logout_usecase.dart';
import '../../domain/usecase/register/register_usecase.dart';
import '../service/api_service.dart';
import '../service/theme_service.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerLazySingletonAsync(() => SharedPreferences.getInstance());
  await GetIt.instance.isReady<SharedPreferences>();
  getIt.registerLazySingleton(() => ApiService());
  getIt.registerLazySingleton(
    () => SharedPreferencesService(getIt<SharedPreferences>()),
  );

  getIt.registerLazySingleton(
    () => AuthenticationRemoteDatasourceImpl(apiService: getIt<ApiService>()),
  );

  getIt.registerLazySingleton(
    () => AuthenticationLocalDatasourceImpl(
      sharedPreferences: getIt<SharedPreferences>(),
    ),
  );

  getIt.registerLazySingleton(
    () => AuthenticationRepositoryImpl(
      authenticationRemoteDatasource: getIt<AuthenticationRemoteDatasourceImpl>(),
      authenticationLocalDatasource: getIt<AuthenticationLocalDatasourceImpl>(),
    ),
  );

  getIt.registerLazySingleton(
    () => RegisterUsecase(
      authenticationRepository: getIt<AuthenticationRepositoryImpl>(),
    ),
  );

  getIt.registerLazySingleton(
    () => LoginUsecase(
      authenticationRepository: getIt<AuthenticationRepositoryImpl>(),
    ),
  );

  getIt.registerLazySingleton(
    () => LogoutUsecase(
      authenticationRepository: getIt<AuthenticationRepositoryImpl>(),
    ),
  );
}
