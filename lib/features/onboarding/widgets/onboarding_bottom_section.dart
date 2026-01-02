import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../core/navigation/data/constants/navigation_constants.dart';
import '../../../core/shared/widgets/custom_elevated_button.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../bloc/onboarding_cubit.dart';
import '../bloc/onboarding_state.dart';
import '../data/onboarding_constants.dart';
import '../../../core/bloc/bloc_providers.dart';
import '../../auth/bloc/auth_cubit.dart';

class OnboardingBottomSection extends StatelessWidget {
  final PageController pageController;

  const OnboardingBottomSection({super.key, required this.pageController});

  void _onContinue(BuildContext context) {
    pageController.nextPage(
      duration: OnboardingConstants.pageTransitionDuration,
      curve: Curves.easeInOut,
    );
  }

  void _onBack(BuildContext context) {
    pageController.previousPage(
      duration: OnboardingConstants.pageTransitionDuration,
      curve: Curves.easeInOut,
    );
  }

  void _onFinish(BuildContext context) {
    // mark as logged in (remember that user passed onboarding)
    try {
      final auth = getIt<AuthCubit>();
      auth.login();
    } catch (_) {}
    context.go(NavigationConstants.home);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        final indicators = List.generate(state.totalPages, (index) {
          final isActive = index == state.currentPage;
          return AnimatedContainer(
            duration: OnboardingConstants.pageTransitionDuration,
            width: OnboardingConstants.indicatorWidth,
            height: OnboardingConstants.indicatorSize,
            decoration: BoxDecoration(
              color: isActive
                  ? AppColors.primary
                  : OnboardingConstants.indicatorInactiveColor,
              borderRadius: BorderRadius.circular(
                OnboardingConstants.indicatorSize,
              ),
            ),
            margin: const EdgeInsets.symmetric(
              horizontal: OnboardingConstants.indicatorSpacing / 2,
            ),
          );
        });

        final showBack = !state.isFirstPage && !state.isLastPage;
        final showContinue = !state.isLastPage;

        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: OnboardingConstants.bottomPadding,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: indicators,
              ),
              const SizedBox(height: 75),
              if (state.isLastPage)
                CustomElevatedButton(
                  onPressed: () => _onFinish(context),
                  text: OnboardingConstants.getStartedText,
                )
              else if (showBack && showContinue)
                Row(
                  children: [
                    Expanded(
                      child: CustomElevatedButton(
                        onPressed: () => _onBack(context),
                        text: '',
                        backgroundColor: const Color(0xFFFFE4CD),
                        foregroundColor: AppColors.textPrimary,
                        icon: Icons.arrow_back,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: CustomElevatedButton(
                        onPressed: () => _onContinue(context),
                        text: OnboardingConstants.continueText,
                      ),
                    ),
                  ],
                )
              else if (showContinue)
                CustomElevatedButton(
                  onPressed: () => _onContinue(context),
                  text: OnboardingConstants.continueText,
                ),
            ],
          ),
        );
      },
    );
  }
}
