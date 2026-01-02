import 'package:flutter/material.dart';

import '../../../core/shared/widgets/custom_elevated_button.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_fonts.dart';
import '../../../core/theme/app_spacing.dart';
import '../data/constants/wish_details_constants.dart';

class WishCard extends StatelessWidget {
  const WishCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: const Color.fromRGBO(236, 236, 236, 1)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/png/spaceship.png',
            height: 128,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  WishDetailsConstants.itemTitle,
                  style: AppFonts.titleLarge.copyWith(
                    height: 1.25,
                    fontWeight: FontWeight.w700,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  WishDetailsConstants.price,
                  style: AppFonts.titleLarge.copyWith(
                    fontWeight: AppFonts.semibold,
                    color: AppColors.blackColor,
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                Row(
                  children: [
                    Expanded(
                      child: CustomElevatedButton(
                        onPressed: () {},
                        text: WishDetailsConstants.buy,
                        borderRadius: 14,
                        height: 48,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: CustomElevatedButton(
                        onPressed: () {},
                        text: WishDetailsConstants.share,
                        backgroundColor: Colors.white,
                        foregroundColor: AppColors.primary,
                        borderRadius: 14,
                        borderColor: AppColors.primary,
                        borderWidth: 1,
                        height: 48,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
