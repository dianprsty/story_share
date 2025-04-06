import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/di/injection.dart';
import 'core/route/go_router_config.dart';
import 'presentation/home/bloc/post_list_bloc.dart';
import 'presentation/shared/bloc/theme/theme_bloc.dart';
import 'presentation/shared/style/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/auth/bloc/auth_bloc.dart';
import 'presentation/upload/bloc/upload_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<AuthBloc>()),
        BlocProvider(
          create: (context) => getIt<ThemeBloc>()..add(ThemeEvent.loadTheme()),
        ),
        BlocProvider(
          create:
              (context) => getIt<PostListBloc>()
        ),
        BlocProvider(create: (context) => getIt<UploadBloc>()),
      ],

      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            theme: StoryShareTheme.lightTheme,
            darkTheme: StoryShareTheme.darkTheme,
            themeMode: state.themeMode,
            routerConfig: GoRouterConfig.router(getIt<SharedPreferences>()),
          );
        },
      ),
    );
  }
}
