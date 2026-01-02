import 'package:flutter/material.dart';

import '../styles/button_styles.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_fonts.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.backgroundColor,
    this.foregroundColor,
    this.icon,
    this.enabled = true,
    this.disabledBackgroundColor,
    this.borderRadius = 24,
    this.borderColor,
    this.borderWidth = 0,
    this.height = 60,
  });

  final VoidCallback onPressed;
  final String text;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final IconData? icon;
  final bool enabled;
  final Color? disabledBackgroundColor;
  final double borderRadius;
  final Color? borderColor;
  final double borderWidth;
  final double height;

  @override
  Widget build(BuildContext context) {
    final bg = backgroundColor ?? AppColors.primary;
    final fg = foregroundColor ?? Colors.white;

    return SizedBox(
      height: height,
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyles.elevated(
          backgroundColor: bg,
          foregroundColor: fg,
          borderRadius: borderRadius,
          borderColor: borderColor,
          borderWidth: borderWidth,
          disabledBackgroundColor: disabledBackgroundColor,
        ),
        onPressed: enabled ? onPressed : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 24, color: AppColors.primary),
              const SizedBox(width: 8),
            ],
            Text(
              text,
              style: AppFonts.titleLarge.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: fg,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
