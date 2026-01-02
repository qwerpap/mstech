import 'package:flutter/material.dart';

import '../../../core/theme/app_fonts.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_colors.dart';
import '../data/models/onboarding_model.dart';
import '../data/onboarding_constants.dart';

class OnboardingCard extends StatelessWidget {
  const OnboardingCard({super.key, required this.data});

  final OnboardingModel data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            data.icon,
            size: OnboardingConstants.imageSize,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            data.text,
            textAlign: TextAlign.center,
            style: AppFonts.displayLarge.copyWith(
              height: 1.3,
              fontWeight: FontWeight.w700,
              color: AppColors.blackColor,
            ),
          ),
        ],
      ),
    );
  }
}
