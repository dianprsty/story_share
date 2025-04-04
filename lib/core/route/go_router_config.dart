import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/auth/login_screen.dart';
import '../../presentation/auth/register_screen.dart';
import '../../presentation/home/home_screen.dart';
import '../../presentation/upload/add_new_post_screen.dart';

enum AppRoute {
  home(name: 'home', path: '/'),
  login(name: 'login', path: '/login'),
  register(name: 'register', path: '/register'),
  addStory(name: 'add-story', path: '/add-story'),
  detailStory(name: 'detail', path: '/detail');

  const AppRoute({required this.name, required this.path});

  final String name;
  final String path;
}

class GoRouterConfig {
  static GoRouter router(BuildContext context) => GoRouter(
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
    ],

    redirect: (context, state) {
      print(state.matchedLocation);
      // Todo: Redirect logic

      return state.path;
    },
  );
}
