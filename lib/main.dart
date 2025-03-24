import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'route/go_router_config.dart';
import 'core/style/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final pref = await SharedPreferences.getInstance();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: StoryShareTheme.lightTheme,
      darkTheme: StoryShareTheme.darkTheme,
      themeMode: ThemeMode.light,
      routerConfig: GoRouterConfig.router(context),
    );
  }
}
