import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// import '../../add_wishlist/widgets/add_wishlist_app_bar.dart';/
import '../../../core/theme/app_spacing.dart';
import '../data/constants/wish_details_constants.dart';
import '../widgets/wish_card.dart';

class WishlistDetailScreen extends StatelessWidget {
  const WishlistDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AddWishlistAppBar(
      //   title: WishDetailsConstants.title,
      //   subtitle: WishDetailsConstants.wishesCount,
      //   showTrailing: false,
      //   onLeadingTap: () => context.pop(),
      // ),
      body: Stack(
        children: [
          ListView.separated(
            padding: EdgeInsets.only(
              left: 13,
              right: 13,
              top: AppSpacing.lg,
              bottom: kBottomNavigationBarHeight + 120,
            ),
            itemCount: 8,
            separatorBuilder: (_, __) => const SizedBox(height: 16),
            itemBuilder: (_, __) => const WishCard(),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: IgnorePointer(
              ignoring: true,
              child: Container(
                height: 220,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(255, 255, 255, 0),
                      Color.fromRGBO(255, 255, 255, 1),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
