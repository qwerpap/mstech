import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../navigation/presentation/cubit/navigation_cubit.dart';
import '../../features/onboarding/bloc/onboarding_cubit.dart';
import '../../features/home/bloc/home_cubit.dart';
import '../../features/paywall/bloc/paywall_cubit.dart';
import '../../features/auth/bloc/auth_cubit.dart';

// repositories / usecases
import '../../features/paywall/data/paywall_repository.dart';
import '../../features/paywall/domain/paywall_usecases.dart';
import '../../features/auth/data/auth_repository.dart';
import '../../features/auth/domain/auth_usecases.dart';

final GetIt getIt = GetIt.instance;

class BlocProviders {
  BlocProviders._();

  static void setup() {
    _registerNavigationCubit();
    _registerOnboardingCubit();
    _registerHomeCubit();
    _registerPaywallCubit();
    _registerAuthCubit();
  }

  static void _registerNavigationCubit() {
    getIt.registerFactoryParam<NavigationCubit, String, bool>(
      (currentLocation, isDark) =>
          NavigationCubit(currentLocation: currentLocation, isDark: isDark),
    );
  }

  static void _registerOnboardingCubit() {
    getIt.registerFactory<OnboardingCubit>(OnboardingCubit.new);
  }

  static void _registerHomeCubit() {
    getIt.registerLazySingleton<HomeCubit>(HomeCubit.new);
  }

  static void _registerPaywallCubit() {
    // register repository and usecases
    getIt.registerLazySingleton<PaywallRepository>(() => const PaywallRepository());
    getIt.registerFactory(() => GetSubscriptionStatus(getIt<PaywallRepository>()));
    getIt.registerFactory(() => SubscribeUseCase(getIt<PaywallRepository>()));
    getIt.registerFactory(() => UnsubscribeUseCase(getIt<PaywallRepository>()));

    // register cubit as singleton so state is shared app-wide
    getIt.registerLazySingleton<PaywallCubit>(() => PaywallCubit(
          getIt<GetSubscriptionStatus>(),
          getIt<SubscribeUseCase>(),
          getIt<UnsubscribeUseCase>(),
        ));
  }

  static void _registerAuthCubit() {
    getIt.registerLazySingleton<AuthRepository>(() => const AuthRepository());
    getIt.registerFactory(() => GetAuthStatus(getIt<AuthRepository>()));
    getIt.registerFactory(() => LoginUseCase(getIt<AuthRepository>()));
    getIt.registerFactory(() => LogoutUseCase(getIt<AuthRepository>()));

    getIt.registerLazySingleton<AuthCubit>(() => AuthCubit(
          getIt<GetAuthStatus>(),
          getIt<LoginUseCase>(),
          getIt<LogoutUseCase>(),
        ));
  }

  static Widget wrapWithProviders({
    required BuildContext context,
    required Widget child,
  }) {
    final currentLocation = GoRouterState.of(context).uri.path;
    final brightness = MediaQuery.platformBrightnessOf(context);
    final isDark = brightness == Brightness.dark;

    return MultiBlocProvider(
      providers: [
        BlocProvider<NavigationCubit>(
          create: (_) =>
              getIt<NavigationCubit>(param1: currentLocation, param2: isDark),
        ),
        BlocProvider<HomeCubit>.value(value: getIt<HomeCubit>()),
        BlocProvider<PaywallCubit>(
          create: (_) => getIt<PaywallCubit>(),
        ),
        BlocProvider<AuthCubit>(
          create: (_) => getIt<AuthCubit>(),
        ),
      ],
      child: child,
    );
  }
}
