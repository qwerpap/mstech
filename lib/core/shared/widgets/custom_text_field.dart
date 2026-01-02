import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_fonts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.hintText,
    this.maxLines = 1,
    this.keyboardType,
    this.prefixIcon,
    this.borderRadius = 24,
    this.fillColor,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.borderWidth = 2,
    this.onChanged,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? hintText;
  final int maxLines;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final double borderRadius;
  final Color? fillColor;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final double borderWidth;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    final isMultiline = maxLines > 1;
    final bg = fillColor ?? AppColors.inputBackground;
    final enabledColor = enabledBorderColor ?? Colors.transparent;
    final focusedColor = focusedBorderColor ?? AppColors.inputFocusBorder;

    return SizedBox(
      height: isMultiline ? null : 60,
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        maxLines: maxLines,
        keyboardType: keyboardType,
        style: AppFonts.bodyLarge.copyWith(color: AppColors.blackColor),
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppFonts.titleLarge.copyWith(
            color: AppColors.inputHint,
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: prefixIcon,
          filled: true,
          fillColor: bg,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(
              color: enabledColor,
              width: borderWidth,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(
              color: focusedColor,
              width: borderWidth,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: isMultiline ? 18 : 18,
          ),
        ),
      ),
    );
  }
}
