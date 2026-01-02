import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mstech/features/auth/bloc/auth_cubit.dart';
import '../../paywall/bloc/paywall_cubit.dart';
import '../../paywall/bloc/paywall_state.dart';
import '../../../core/theme/app_fonts.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/shared/widgets/custom_elevated_button.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favourites')),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: BlocBuilder<PaywallCubit, PaywallState>(
          builder: (context, state) {
            final subscribed = state.isSubscribed;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Subscription status', style: AppFonts.headlineLarge),
                const SizedBox(height: AppSpacing.md),
                Row(
                  children: [
                    Icon(
                      subscribed ? Icons.verified : Icons.close,
                      color: subscribed ? Colors.green : Colors.red,
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Text(
                      subscribed ? 'Active' : 'Not active',
                      style: AppFonts.titleMedium,
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.lg),
                const SizedBox(height: AppSpacing.lg),
                CustomElevatedButton(
                  onPressed: () => context.read<PaywallCubit>().unsubscribe(),
                  text: 'Удалить подписку',
                  enabled: subscribed,
                ),
                const SizedBox(height: AppSpacing.md),
                CustomElevatedButton(
                  onPressed: () {
                    context.read<AuthCubit>().logout();
                    context.push('/onboarding');
                  },
                  text: 'Выйти с аккаунта',
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}


