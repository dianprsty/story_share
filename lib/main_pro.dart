import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/config/flavor_config.dart';
import 'core/di/injection.dart';
import 'presentation/auth/bloc/auth_bloc.dart';
import 'presentation/detail/bloc/detail_bloc.dart';
import 'presentation/home/bloc/post_list_bloc.dart';
import 'presentation/shared/bloc/l10n/l10n_bloc.dart';
import 'presentation/shared/bloc/theme/theme_bloc.dart';
import 'presentation/shared/style/colors.dart';
import 'presentation/upload/bloc/upload_bloc.dart';
import 'story_share.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();

  FlavorConfig(
    flavor: FlavorType.pro,
    color: CustomColors.purple.color,
    values: const FlavorValues(titleApp: 'Story Share Pro'),
  );
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

      child: StoryShare(),
    ),
  );
}
