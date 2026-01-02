import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/bloc/bloc_providers.dart';
import '../../auth/bloc/auth_cubit.dart';
import '../../../core/theme/app_spacing.dart';
import '../bloc/onboarding_cubit.dart';
import '../bloc/onboarding_state.dart';
import '../data/onboarding_constants.dart';
import '../data/onboarding_data.dart';
import '../widgets/onboarding_bottom_section.dart';
import '../widgets/onboarding_card.dart';
import '../../../core/navigation/data/constants/navigation_constants.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController _pageController;
  final _onboardingList = OnboardingData.onboardingList;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _skip() {
    try {
      final auth = getIt<AuthCubit>();
      auth.login();
    } catch (_) {}
    context.go(NavigationConstants.home);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OnboardingCubit>(
      create: (_) => getIt<OnboardingCubit>(),
      child: Builder(
        builder: (context) {
          final cubit = context.read<OnboardingCubit>();

          return Scaffold(
            body: SafeArea(
              child: Stack(
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 48),
                      Expanded(
                        child: PageView.builder(
                          controller: _pageController,
                          onPageChanged: cubit.onPageChanged,
                          itemCount: _onboardingList.length,
                          itemBuilder: (context, index) {
                            return OnboardingCard(data: _onboardingList[index]);
                          },
                        ),
                      ),
                      OnboardingBottomSection(pageController: _pageController),
                    ],
                  ),
                  Positioned(
                    top: AppSpacing.sm,
                    right: AppSpacing.lg,
                    child: BlocBuilder<OnboardingCubit, OnboardingState>(
                      builder: (context, state) {
                        if (state.isLastPage) {
                          return const SizedBox.shrink();
                        }
                        return TextButton(
                          onPressed: _skip,
                          child: const Text(OnboardingConstants.skipText),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
