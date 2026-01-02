import 'package:flutter/material.dart';

import 'core/bloc/bloc_providers.dart';
import 'core/navigation/presentation/app_router.dart';
import 'core/theme/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:go_router/go_router.dart';

const _kLoggedInKey = 'is_logged_in';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocProviders.setup();
  runAppFuture();
}

Future<void> runAppFuture() async {
  final prefs = await SharedPreferences.getInstance();
  final loggedIn = prefs.getBool(_kLoggedInKey) ?? false;
  final router = createAppRouter(initialLocation: loggedIn ? '/home' : '/onboarding');
  runApp(MyApp(router: router));
}

class MyApp extends StatelessWidget {
  final GoRouter router;

  const MyApp({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'MSTech',
      routerConfig: router,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
    );
  }
}