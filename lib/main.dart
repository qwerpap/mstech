import 'package:flutter/material.dart';

import 'core/bloc/bloc_providers.dart';
import 'core/navigation/presentation/app_router.dart';
import 'core/theme/app_theme.dart';
import 'package:go_router/go_router.dart';
import 'core/services/local_storage_service.dart';

const _kLoggedInKey = 'is_logged_in';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocProviders.setup();
  runAppFuture();
}

Future<void> runAppFuture() async {
  final storage = getIt<LocalStorageService>();
  final loggedIn = await storage.getBool(_kLoggedInKey, defaultValue: false);
  final router = createAppRouter(
    initialLocation: loggedIn ? '/home' : '/onboarding',
  );
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
