import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_fonts.dart';
import '../../../core/shared/widgets/custom_elevated_button.dart';
import '../../paywall/widgets/feature_container.dart';
import '../../paywall/widgets/price_container.dart';
import '../../../core/theme/app_spacing.dart';
import '../../paywall/bloc/paywall_cubit.dart';
import '../../paywall/bloc/paywall_state.dart';

import '../../../core/navigation/data/constants/navigation_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaywallScreen extends StatelessWidget {
  const PaywallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          children: [
            SizedBox(
              height: 32,
              child: Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () => context.pop(),
                  child: const Icon(Icons.close),
                ),
              ),
            ),
            Text(
              'WishList PRO',
              style: AppFonts.titleLarge.copyWith(
                fontSize: 28,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              'Unlock premium wishlist features to create, compare and share your lists with ease.',
              style: AppFonts.titleMedium.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: AppSpacing.xl),

            const FeatureContainer(),
            const SizedBox(height: AppSpacing.lg),

            const PriceContainer(),
            const SizedBox(height: AppSpacing.xl),

            BlocBuilder<PaywallCubit, PaywallState>(
              builder: (context, state) {
                return CustomElevatedButton(
                  onPressed: () {
                    if (!state.isSubscribed) {
                      context.read<PaywallCubit>().subscribe().then((_) {
                        context.pop();
                      });
                    }
                  },
                  enabled: !state.isSubscribed,
                  text: 'Start Free Trial',
                );
              },
            ),
            const SizedBox(height: AppSpacing.md),
            const Align(
              alignment: Alignment.center,
              child: Text('Restore Purchase'),
            ),
            const SizedBox(height: AppSpacing.xl),

            Text(
              'Payment will be charged to your Apple ID account. Subscription automatically renews unless canceled at least 24 hours before the end of the current period.\n\nYou can manage or cancel your subscription in your Apple ID settings.',
              style: AppFonts.titleMedium.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
