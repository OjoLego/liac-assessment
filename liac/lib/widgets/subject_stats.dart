import 'package:flutter/material.dart';
import 'package:liac/core/app_string.dart';
import '../core/app_colors.dart';
import '../core/app_text_styles.dart';

class SubjetStatsCard extends StatelessWidget {
  final List<String> subjects;
  final List<bool> activeSubjects;
  final void Function(int)? onChipSelected;

  final String hour;
  final String minute;
  final String solvedText;
  final String totalText;
  final String mistakesMadeText;

  const SubjetStatsCard({
    super.key,
    required this.subjects,
    required this.activeSubjects,
    this.onChipSelected,
    required this.hour,
    required this.minute,
    required this.solvedText,
    required this.totalText,
    required this.mistakesMadeText,
  });

  @override
  Widget build(BuildContext context) {
    final styles = AppTextStyles(context);

    Widget buildTimeRow(String hour, String minute) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Text(
            hour,
            style: styles.scoreNumber,
          ),
          Text(
            'h',
            style: styles.scoreTotal,
          ),
          Text(
            minute,
            style: styles.scoreNumber,
          ),
          Text(
            'min',
            style: styles.scoreTotal,
          ),
          const Spacer(),
          Text(
            AppString.overallTimeSpent,
            style: styles.statsLabel,
          ),
        ],
      );
    }

    Widget buildVariantsRow(String solved, String total) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Text(
            solved,
            style: styles.scoreNumber,
          ),
          Text(
            '/$total',
            style: styles.scoreTotal,
          ),
          const Spacer(),
          Text(
            AppString.variantSolved,
            style: styles.statsLabel,
          ),
        ],
      );
    }

    Widget buildMistakeRow(String left) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(left, style: styles.scoreNumber),
          Text(AppString.mistakesMade, style: styles.statsLabel),
        ],
      );
    }

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(subjects.length, (i) {
                  final active = activeSubjects[i];
                  return ActionChip(
                    label: Text(
                      subjects[i],
                      style: styles.chipText.copyWith(
                        color: active
                            ? AppColors.chipActive
                            : AppColors.chipTextInactive,
                      ),
                    ),
                    onPressed: () => onChipSelected?.call(i),
                  );
                }),
              ),
            ),
            buildTimeRow(hour, minute),
            buildVariantsRow(solvedText, totalText),
            buildMistakeRow(mistakesMadeText),
          ],
        ),
      ),
    );
  }
}
