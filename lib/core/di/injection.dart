import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/datasource/local/authentication_local_datasource.dart';
import '../../data/datasource/remote/authentication_remote_datasource.dart';
import '../../data/datasource/remote/post_remote_datasource.dart';
import '../../data/repository/authentication_repository_impl.dart';
import '../../data/repository/post_repository_impl.dart';
import '../../domain/repository/authentication_repository.dart';
import '../../domain/repository/post_repository.dart';
import '../../domain/usecase/get_posts/get_posts_usecase.dart';
import '../../domain/usecase/login/login_usecase.dart';
import '../../domain/usecase/logout/logout_usecase.dart';
import '../../domain/usecase/register/register_usecase.dart';
import '../../presentation/auth/bloc/auth_bloc.dart';
import '../../presentation/home/bloc/post_list_bloc.dart';
import '../../presentation/shared/bloc/theme/theme_bloc.dart';
import '../service/api_service.dart';
import '../service/theme_service.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  // ---------------- Core / Third Party ----------------
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);

  getIt.registerLazySingleton(() => ApiService());
  getIt.registerLazySingleton(() => ThemeService(getIt()));

  // ---------------- Data Source ----------------
  getIt.registerLazySingleton<AuthenticationRemoteDatasource>(
    () => AuthenticationRemoteDatasourceImpl(apiService: getIt()),
  );

  getIt.registerLazySingleton<AuthenticationLocalDatasource>(
    () => AuthenticationLocalDatasourceImpl(sharedPreferences: getIt()),
  );

  getIt.registerLazySingleton<PostRemoteDatasource>(
    () => PostRemoteDatasourceImpl(
      apiService: getIt(),
      sharedPreferences: getIt(),
    ),
  );

  // ---------------- Repository ----------------
  getIt.registerLazySingleton<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(
      authenticationRemoteDatasource: getIt(),
      authenticationLocalDatasource: getIt(),
    ),
  );

  getIt.registerLazySingleton<PostRepository>(
    () => PostRepositoryImpl(postRemoteDatasource: getIt()),
  );

  // ---------------- Usecase ----------------
  getIt.registerLazySingleton(
    () => RegisterUsecase(authenticationRepository: getIt()),
  );
  getIt.registerLazySingleton(
    () => LoginUsecase(authenticationRepository: getIt()),
  );
  getIt.registerLazySingleton(
    () => LogoutUsecase(authenticationRepository: getIt()),
  );
  getIt.registerLazySingleton(() => GetPostsUsecase(postRepository: getIt()));

  // ---------------- Bloc ----------------
  getIt.registerFactory(() => ThemeBloc(getIt()));

  getIt.registerFactory(
    () => AuthBloc(
      registerUsecase: getIt(),
      loginUsecase: getIt(),
      logoutUsecase: getIt(),
    ),
  );

  getIt.registerFactory(() => PostListBloc(getPostsUsecase: getIt()));
}
