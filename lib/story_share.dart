import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';

import 'core/config/flavor_config.dart';
import 'core/di/injection.dart';
import 'presentation/shared/bloc/l10n/l10n_bloc.dart';
import 'presentation/shared/bloc/theme/theme_bloc.dart';
import 'presentation/shared/style/theme.dart';

class StoryShare extends StatelessWidget {
  const StoryShare({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: FlavorConfig.instance.values.titleApp,
      theme: StoryShareTheme.lightTheme(flavor: FlavorConfig.instance.flavor),
      darkTheme: StoryShareTheme.darkTheme(
        flavor: FlavorConfig.instance.flavor,
      ),
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
