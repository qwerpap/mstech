import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_fonts.dart';
import '../../../core/theme/app_spacing.dart';

class FeatureContainer extends StatelessWidget {
  const FeatureContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 60, sigmaY: 60),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          decoration: BoxDecoration(
            color: AppColors.background.withOpacity(0.08),
            borderRadius: BorderRadius.circular(24),
            boxShadow: const [
              BoxShadow(
                color: Color(0x11000000),
                blurRadius: 20,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Features:', style: AppFonts.headlineLarge),
              const SizedBox(height: AppSpacing.lg),
              const FeatureCard(text: 'Unlimited wishlists'),
              const SizedBox(height: AppSpacing.md),
              const FeatureCard(text: 'Compare prices and deals'),
              const SizedBox(height: AppSpacing.md),
              const FeatureCard(text: 'Share lists with friends'),
              const SizedBox(height: AppSpacing.md),
              const FeatureCard(text: 'Priority sync & backup'),
              const SizedBox(height: AppSpacing.md),
              const FeatureCard(text: 'Ad-free experience'),
            ],
          ),
        ),
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  const FeatureCard({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.check_circle, color: AppColors.primary, size: 20),
        const SizedBox(width: 8),
        Text(text, style: AppFonts.titleLarge),
      ],
    );
  }
}
