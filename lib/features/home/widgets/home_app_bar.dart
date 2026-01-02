import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
 
import '../../../core/theme/app_fonts.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/shared/widgets/custom_text_field.dart';
import '../data/constants/home_constants.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: HomeConstants.avatarSize,
              width: HomeConstants.avatarSize,
              decoration: const BoxDecoration(
                color: Color(0xFFF3E5D8),
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(6),
              child: Image.asset('assets/png/anonim.png', fit: BoxFit.contain),
            ),
            const SizedBox(width: AppSpacing.sm),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                HomeConstants.defaultUserName,
                style: AppFonts.titleLarge.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        const Spacer(),
        Align(
          alignment: Alignment.centerRight,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.52,
            child: CustomTextField(
              hintText: HomeConstants.searchHint,
              prefixIcon: const Padding(
                padding: EdgeInsets.only(left: 12, right: 8),
                child: Icon(Icons.search, color: AppColors.blackColor),
              ),
              borderRadius: 24,
              fillColor: const Color(0xFFF6F6F6),
              enabledBorderColor: Colors.transparent,
              focusedBorderColor: Colors.transparent,
            ),
          ),
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}
