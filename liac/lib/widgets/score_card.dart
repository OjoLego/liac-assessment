import 'package:flutter/material.dart';
import 'package:liac/core/app_size.dart';
import 'package:liac/core/app_string.dart';
import '../core/app_colors.dart';
import '../core/app_text_styles.dart';
import '../core/responsive_helper.dart';

class ScoreCard extends StatelessWidget {
  final int score;
  final int totalScore;

  const ScoreCard({
    super.key,
    required this.score,
    required this.totalScore,
  });

  @override
  Widget build(BuildContext context) {
    final styles = AppTextStyles(context);
    return Container(
      width: double.infinity,
      padding: ResponsiveHelper.getPadding(context),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    '$score',
                    style: styles.scoreNumber,
                  ),
                  Text(
                    '/$totalScore',
                    style: styles.scoreTotal,
                  ),
                ],
              ),
              Text(
                AppString.yourRecentScore,
                style: styles.greeting,
              ),
            ],
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.black,
              foregroundColor: AppColors.white,
              padding: ResponsiveHelper.getPadding(context),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.buttonRadius),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppString.moreDetails,
                  style: styles.buttonText.copyWith(color: AppColors.white),
                ),
                const SizedBox(width: AppSize.paddingXS),
                Icon(
                  Icons.arrow_forward,
                  size: ResponsiveHelper.getAdaptiveIconSize(
                      context, AppSize.iconS),
                  color: AppColors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
