import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// svg removed; using built-in Icons

import '../../data/constants/bottom_navigation_constants.dart';
import '../../data/constants/bottom_navigation_ui_constants.dart';
import '../../data/constants/navigation_colors.dart';
import '../../data/models/navigation_item.dart';
import '../cubit/navigation_cubit.dart';
import '../cubit/navigation_state.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        final cubit = context.read<NavigationCubit>();

        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: BottomNavigationUIConstants.horizontalPadding,
              vertical: BottomNavigationUIConstants.verticalPadding,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF6F6F6),
                borderRadius: BorderRadius.circular(
                  BottomNavigationUIConstants.borderRadius,
                ),
                boxShadow: [
                  BoxShadow(
                    color: NavigationColors.getContainerShadowColor(),
                    blurRadius: BottomNavigationUIConstants.shadowBlurRadius,
                    offset: BottomNavigationUIConstants.shadowOffset,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: _NavigationContent(
                currentIndex: state.currentIndex,
                isDragging: state.isDragging,
                targetIndex: state.targetIndex,
                dragPosition: state.dragPosition,
                cubit: cubit,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _NavigationContent extends StatelessWidget {
  final int currentIndex;
  final bool isDragging;
  final int? targetIndex;
  final Offset? dragPosition;
  final NavigationCubit cubit;

  const _NavigationContent({
    required this.currentIndex,
    required this.isDragging,
    required this.targetIndex,
    required this.dragPosition,
    required this.cubit,
  });

  bool _shouldShowIndicator(int index) {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Container(
        key: cubit.containerKey,
        padding: const EdgeInsets.symmetric(
          horizontal: BottomNavigationUIConstants.containerHorizontalPadding,
        ),
        height: BottomNavigationUIConstants.barHeight,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final itemWidth =
                constraints.maxWidth /
                BottomNavigationConstants.navigationItems.length;

            return ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: BottomNavigationConstants.navigationItems.length,
              itemExtent: itemWidth,
              itemBuilder: (context, index) {
                final item = BottomNavigationConstants.navigationItems[index];
                final isSelected = index == currentIndex;
                final showIndicator = isSelected || _shouldShowIndicator(index);

                return _NavigationItem(
                  item: item,
                  isSelected: isSelected,
                  showIndicator: showIndicator,
                  onTap: () => cubit.navigateToRoute(context, item.route),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class _NavigationItem extends StatelessWidget {
  final NavigationItem item;
  final bool isSelected;
  final bool showIndicator;
  final VoidCallback onTap;

  const _NavigationItem({
    required this.item,
    required this.isSelected,
    required this.showIndicator,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final iconColor = isSelected
        ? NavigationColors.selectedIconColor
        : NavigationColors.unselectedIconColor;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: BottomNavigationUIConstants.itemVerticalPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              item.icon,
              size: BottomNavigationUIConstants.iconSize,
              color: iconColor,
            ),
            const SizedBox(height: BottomNavigationUIConstants.iconSpacing),
            Text(
              item.label,
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: iconColor,
                fontSize: BottomNavigationUIConstants.fontSize,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

