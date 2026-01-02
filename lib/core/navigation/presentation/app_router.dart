import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../bloc/bloc_providers.dart';
import '../data/constants/navigation_constants.dart';
import 'cubit/navigation_cubit.dart';
import 'widgets/bottom_navigation.dart';
import '../../../features/favourites/view/favourites_screen.dart';
import '../../../features/home/view/home_screen.dart';
import '../../../features/notifications/view/notifications_screen.dart';
import '../../../features/onboarding/view/onboarding_screen.dart';
import '../../../features/paywall/view/paywall_screen.dart';
import '../../../features/paywall/bloc/paywall_cubit.dart';
import '../../../features/profile/view/profile_screen.dart';
import '../../../features/splash/splash_screen.dart';
import '../../../features/home/view/wishlist_detail_screen.dart';

GoRouter createAppRouter({String initialLocation = '/onboarding'}) {
  return GoRouter(
    initialLocation: initialLocation,
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/paywall',
        builder: (context, state) => BlocProvider.value(
          value: getIt<PaywallCubit>(),
          child: const PaywallScreen(),
        ),
      ),
      ShellRoute(
        builder: (context, state, child) => MainShell(child: child),
        routes: [
          GoRoute(
            path: NavigationConstants.home,
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: NavigationConstants.favourites,
            builder: (context, state) => const FavouritesScreen(),
          ),
          GoRoute(
            path: NavigationConstants.notifications,
            builder: (context, state) => const NotificationsScreen(),
          ),
          GoRoute(
            path: NavigationConstants.profile,
            builder: (context, state) => const ProfileScreen(),
          ),
          GoRoute(
            path: NavigationConstants.wishlistDetail,
            builder: (context, state) => const WishlistDetailScreen(),
          ),
        ],
      ),
    ],
  );
}

class MainShell extends StatelessWidget {
  final Widget child;

  const MainShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocProviders.wrapWithProviders(
      context: context,
      child: _NavigationStateUpdater(child: child),
    );
  }
}

class _NavigationStateUpdater extends StatefulWidget {
  final Widget child;

  const _NavigationStateUpdater({required this.child});

  @override
  State<_NavigationStateUpdater> createState() =>
      _NavigationStateUpdaterState();
}

class _NavigationStateUpdaterState extends State<_NavigationStateUpdater> {
  String? _lastLocation;
  Brightness? _lastBrightness;
  RouterDelegate<Object?>? _routerDelegate;

  void _updateNavigationState() {
    if (!mounted) return;

    final cubit = context.read<NavigationCubit>();
    final newLocation = GoRouterState.of(context).uri.path;
    final newBrightness = MediaQuery.platformBrightnessOf(context);
    final newIsDark = newBrightness == Brightness.dark;

    if (_lastLocation != newLocation) {
      cubit.updateCurrentRoute(newLocation);
      _lastLocation = newLocation;
    }
    if (_lastBrightness != newBrightness) {
      cubit.updateTheme(newIsDark);
      _lastBrightness = newBrightness;
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateNavigationState();
      _routerDelegate = GoRouter.of(context).routerDelegate;
      _routerDelegate?.addListener(_onRouterChanged);
    });
  }

  @override
  void dispose() {
    _routerDelegate?.removeListener(_onRouterChanged);
    super.dispose();
  }

  void _onRouterChanged() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _updateNavigationState();
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final newBrightness = MediaQuery.platformBrightnessOf(context);

    if (_lastBrightness != newBrightness) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _updateNavigationState();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          widget.child,
          const Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: CustomBottomNavigation(),
          ),
        ],
      ),
    );
  }
}
