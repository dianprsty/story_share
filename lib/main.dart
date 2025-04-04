import 'package:flutter/material.dart';
import 'core/di/injection.dart';
import 'core/route/go_router_config.dart';
import 'core/style/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'domain/usecase/register/register_usecase.dart';
import 'presentation/auth/bloc/auth_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(registerUsecase: getIt<RegisterUsecase>()),
        ),
      ],
      
      child: MaterialApp.router(
          theme: StoryShareTheme.lightTheme,
          darkTheme: StoryShareTheme.darkTheme,
          themeMode: ThemeMode.light,
          routerConfig: GoRouterConfig.router(context),
        ),
    );
  }
}
