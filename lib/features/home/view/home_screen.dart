import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mstech/core/shared/widgets/custom_elevated_button.dart';

import '../../../core/navigation/data/constants/navigation_constants.dart';
import '../../../core/theme/app_spacing.dart';
import '../bloc/home_cubit.dart';
import '../bloc/home_state.dart';
import '../../paywall/bloc/paywall_cubit.dart';
import '../../paywall/bloc/paywall_state.dart';
import '../widgets/home_empty_state.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/home_wishlist_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: const SafeArea(bottom: false, child: HomeAppBar()),
        ),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.lg,
                vertical: AppSpacing.lg,
              ),
              child: Column(
                children: [
                  BlocBuilder<PaywallCubit, PaywallState>(
                    builder: (context, payState) {
                      if (!payState.isSubscribed) return const SizedBox.shrink();
                      return Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.verified, color: Colors.green),
                            const SizedBox(width: 12),
                            const Expanded(child: Text('You are subscribed')),
                            TextButton(
                              onPressed: () => context.read<PaywallCubit>().unsubscribe(),
                              child: const Text('Remove subscription'),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  Expanded(
                    child: BlocBuilder<HomeCubit, HomeState>(
                      builder: (context, state) {
                        if (!state.hasItems) {
                          return HomeEmptyState(
                            onAdd: () {
                              final subscribed = context.read<PaywallCubit>().state.isSubscribed;
                              if (subscribed) {
                                context.push(NavigationConstants.profile);
                              } else {
                                context.push(NavigationConstants.paywall);
                              }
                            },
                          );
                        }
                        return ListView.separated(
                          padding: const EdgeInsets.only(bottom: 140),
                          itemBuilder: (context, index) {
                            final item = state.items[index];
                            return HomeWishlistCard(item: item);
                          },
                          separatorBuilder: (_, __) => const SizedBox(height: 32),
                          itemCount: state.items.length,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            if (context.watch<HomeCubit>().state.hasItems)
              Positioned(
                left: AppSpacing.lg,
                right: AppSpacing.lg,
                bottom: kBottomNavigationBarHeight + 60,
                child: SafeArea(
                  top: false,
                  child: CustomElevatedButton(
                    onPressed: () {
                      final subscribed = context.read<PaywallCubit>().state.isSubscribed;
                      if (subscribed) {
                        context.push(NavigationConstants.profile);
                      } else {
                        context.push(NavigationConstants.paywall);
                      }
                    },
                    text: '+ Add New Wishlist',
                    borderRadius: 24,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
