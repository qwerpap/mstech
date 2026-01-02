import 'package:flutter/material.dart';

import '../../../core/shared/widgets/custom_elevated_button.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_fonts.dart';
import '../../../core/theme/app_spacing.dart';
import '../data/constants/home_constants.dart';

class HomeEmptyState extends StatelessWidget {
  const HomeEmptyState({super.key, required this.onAdd});

  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppSpacing.md),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.xl),
          child: Image.asset(
            'assets/png/spaceship.png',
            height: HomeConstants.heroImageSize,
            width: HomeConstants.heroImageSize,
            fit: BoxFit.contain,
          ),
        ),
        Text(
          HomeConstants.emptyTitle,
          textAlign: TextAlign.center,
          style: AppFonts.displayMedium.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          HomeConstants.emptySubtitle,
          textAlign: TextAlign.center,
          style: AppFonts.titleLarge.copyWith(
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: AppSpacing.xl),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: CustomElevatedButton(
            onPressed: onAdd,
            borderRadius: 32,
            text: HomeConstants.addWishlist,
          ),
        ),
      ],
    );
  }
}
