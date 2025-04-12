import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/datasource/local/authentication_local_datasource.dart';
import '../../data/datasource/local/localization_local_datasource.dart';
import '../../data/datasource/remote/authentication_remote_datasource.dart';
import '../../data/datasource/remote/post_remote_datasource.dart';
import '../../data/repository/authentication_repository_impl.dart';
import '../../data/repository/localization_repository_impl.dart';
import '../../data/repository/post_repository_impl.dart';
import '../../domain/repository/authentication_repository.dart';
import '../../domain/repository/localization_repository.dart';
import '../../domain/repository/post_repository.dart';
import '../../domain/usecase/change_language/change_language_usecase.dart';
import '../../domain/usecase/get_language/get_language_usecase.dart';
import '../../domain/usecase/get_post_by_id/get_post_by_id_usecase.dart';
import '../../domain/usecase/get_posts/get_posts_usecase.dart';
import '../../domain/usecase/login/login_usecase.dart';
import '../../domain/usecase/logout/logout_usecase.dart';
import '../../domain/usecase/register/register_usecase.dart';
import '../../domain/usecase/upload_post/upload_post_usecase.dart';
import '../../presentation/auth/bloc/auth_bloc.dart';
import '../../presentation/detail/bloc/detail_bloc.dart';
import '../../presentation/home/bloc/post_list_bloc.dart';
import '../../presentation/shared/bloc/l10n/l10n_bloc.dart';
import '../../presentation/shared/bloc/theme/theme_bloc.dart';
import '../../presentation/upload/bloc/upload_bloc.dart';
import '../route/go_router_config.dart';
import '../service/api_service.dart';
import '../service/map_service.dart';
import '../service/theme_service.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  getIt.registerLazySingleton<ApiService>(() => ApiService());
  getIt.registerLazySingleton<ThemeService>(() => ThemeService(getIt()));
  getIt.registerLazySingleton<GoRouter>(() => GoRouterConfig.router(getIt()));
  getIt.registerLazySingleton<MapService>(
    () => MapService(location: Location()),
  );

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
  getIt.registerLazySingleton<LocalizationLocalDataSource>(
    () => LocalizationLocalDataSourceImpl(sharedPreferences: getIt()),
  );

  getIt.registerLazySingleton<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(
      authenticationRemoteDatasource: getIt(),
      authenticationLocalDatasource: getIt(),
    ),
  );

  getIt.registerLazySingleton<PostRepository>(
    () => PostRepositoryImpl(postRemoteDatasource: getIt()),
  );

  getIt.registerLazySingleton<LocalizationRepository>(
    () => LocalizationRepositoryImpl(localizationLocalDataSource: getIt()),
  );

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
  getIt.registerLazySingleton(() => UploadPostUsecase(postRepository: getIt()));
  getIt.registerLazySingleton(
    () => GetLanguageUsecase(localizationRepository: getIt()),
  );
  getIt.registerLazySingleton(
    () => ChangeLanguageUsecase(localizationRepository: getIt()),
  );
  getIt.registerLazySingleton(
    () => GetPostByIdUsecase(postRepository: getIt()),
  );

  getIt.registerFactory(() => ThemeBloc(getIt()));
  getIt.registerFactory(
    () => L10nBloc(getLanguageUsecase: getIt(), changeLanguageUsecase: getIt()),
  );
  getIt.registerFactory(
    () => AuthBloc(
      registerUsecase: getIt(),
      loginUsecase: getIt(),
      logoutUsecase: getIt(),
    ),
  );
  getIt.registerFactory(() => PostListBloc(getPostsUsecase: getIt()));
  getIt.registerFactory(() => UploadBloc(uploadPostUsecase: getIt()));
  getIt.registerFactory(() => DetailBloc(getPostByIdUsecase: getIt()));
}
