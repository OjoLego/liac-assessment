import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../core/app_size.dart';
import '../core/app_text_styles.dart';

class OptionCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;

  const OptionCard({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final styles = AppTextStyles(context);

    return Container(
      decoration: BoxDecoration(
        color: isSelected ? AppColors.backgroundGreen : AppColors.chipActive,
        borderRadius: BorderRadius.circular(AppSize.radiusL),
      ),
      padding: const EdgeInsets.all(AppSize.paddingM),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? AppColors.black : AppColors.primaryGreen,
            size: AppSize.iconM,
          ),
          const SizedBox(height: AppSize.paddingM),
          Text(
            label,
            style: styles.statsLabel.copyWith(color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
