import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';
import 'bottom_navigation_ui_constants.dart';

class NavigationColors {
  NavigationColors._();

  static const Color selectedIconColor = AppColors.primary;
  static const Color unselectedIconColor = AppColors.blackColor;

  static Color getContainerShadowColor() => Colors.black.withOpacity(
        BottomNavigationUIConstants.shadowOpacity,
      );
}

