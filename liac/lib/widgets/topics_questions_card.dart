import 'package:flutter/material.dart';
import 'package:liac/core/app_size.dart';
import '../core/app_colors.dart';
import '../core/app_text_styles.dart';
import '../core/responsive_helper.dart';

class TopicsQuestionsCard extends StatelessWidget {
  final int topicsCompleted;
  final int totalTopics;
  final IconData icon;
  final String label;

  const TopicsQuestionsCard({
    super.key,
    required this.topicsCompleted,
    required this.totalTopics,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final styles = AppTextStyles(context);
    return Container(
      padding: const EdgeInsets.all(AppSize.paddingM),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSize.radiusL),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: ResponsiveHelper.getAdaptiveSize(context, 36),
            height: ResponsiveHelper.getAdaptiveSize(context, 52),
            child: Icon(
              icon,
              size: AppSize.iconM,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: AppSize.paddingM),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                '$topicsCompleted',
                style: styles.statValue,
              ),
              const SizedBox(width: AppSize.paddingXS),
              Text(
                '/ $totalTopics',
                style: styles.statDenominator,
              ),
              const SizedBox(width: AppSize.paddingS),
              Text(
                label,
                style: styles.statsLabel,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
