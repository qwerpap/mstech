import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_fonts.dart';

class ButtonStyles {
  ButtonStyles._();

  static ButtonStyle elevated({
    Color? backgroundColor,
    Color? foregroundColor,
    Color? disabledBackgroundColor,
    double borderRadius = 24,
    Color? borderColor,
    double borderWidth = 0,
  }) {
    final bg = backgroundColor ?? AppColors.primary;
    final fg = foregroundColor ?? Colors.white;
    final disabledBg = disabledBackgroundColor ?? AppColors.disabledButton;

    return ElevatedButton.styleFrom(
      backgroundColor: bg,
      foregroundColor: fg,
      disabledBackgroundColor: disabledBg,
      textStyle: AppFonts.labelLarge.copyWith(color: fg),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        side: BorderSide(
          color: borderColor ?? Colors.transparent,
          width: borderWidth,
        ),
      ),
    );
  }
}

