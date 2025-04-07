import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../presentation/auth/login_screen.dart';
import '../../presentation/auth/register_screen.dart';
import '../../presentation/detail/detail_screen.dart';
import '../../presentation/home/home_screen.dart';
import '../../presentation/upload/add_new_post_screen.dart';
import '../../presentation/upload/camera_capture_page.dart';
import '../constant/strings.dart';

enum AppRoute {
  home(name: 'home', path: '/'),
  login(name: 'login', path: '/login'),
  register(name: 'register', path: '/register'),
  addStory(name: 'add-story', path: '/add-story'),
  detailStory(name: 'detail', path: '/detail/:id'),
  camera(name: 'camera', path: '/camera');

  const AppRoute({required this.name, required this.path});

  final String name;
  final String path;
}

class GoRouterConfig {
  static GoRouter router(SharedPreferences prefs) => GoRouter(
    initialLocation: AppRoute.home.path,

    routes: [
      GoRoute(
        path: AppRoute.home.path,
        name: AppRoute.home.name,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: AppRoute.login.path,
        name: AppRoute.login.name,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoute.register.path,
        name: AppRoute.register.name,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: AppRoute.addStory.path,
        name: AppRoute.addStory.name,
        builder: (context, state) => const AddNewPostScreen(),
      ),
      GoRoute(
        path: AppRoute.detailStory.path,
        name: AppRoute.detailStory.name,
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return PostDetailScreen(id: id);
        },
      ),
      GoRoute(
        path: AppRoute.camera.path,
        name: AppRoute.camera.name,
        builder: (context, state) => const CameraCapturePage(),
      )
    ],

    redirect: (context, state) async {
      var currentLocation = state.matchedLocation;
      bool isLogin = prefs.getString(tokenKey) != null;

      if (!isLogin &&
          currentLocation != AppRoute.login.path &&
          currentLocation != AppRoute.register.path) {
        return AppRoute.login.path;
      } else if (isLogin &&
          (currentLocation == AppRoute.login.path ||
              currentLocation == AppRoute.register.path)) {
        return AppRoute.home.path;
      }

      return state.path;
    },
  );
}
