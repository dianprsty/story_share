import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'core/di/injection.dart';
import 'presentation/detail/bloc/detail_bloc.dart';
import 'presentation/home/bloc/post_list_bloc.dart';
import 'presentation/shared/bloc/l10n/l10n_bloc.dart';
import 'presentation/shared/bloc/theme/theme_bloc.dart';
import 'presentation/shared/style/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'presentation/auth/bloc/auth_bloc.dart';
import 'presentation/upload/bloc/upload_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<AuthBloc>()),
        BlocProvider(
          create: (context) => getIt<ThemeBloc>()..add(ThemeEvent.loadTheme()),
        ),
        BlocProvider(create: (context) => getIt<PostListBloc>()),
        BlocProvider(create: (context) => getIt<UploadBloc>()),
        BlocProvider(
          create: (context) => getIt<L10nBloc>()..add(L10nEvent.getLanguage()),
        ),
        BlocProvider(create: (context) => getIt<DetailBloc>()),
      ],

      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: StoryShareTheme.lightTheme,
      darkTheme: StoryShareTheme.darkTheme,
      themeMode: context.watch<ThemeBloc>().state.themeMode,
      routerConfig: getIt<GoRouter>(),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: context.watch<L10nBloc>().state.locale,
    );
  }
}
