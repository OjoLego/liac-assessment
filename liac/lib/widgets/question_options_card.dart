import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../core/app_size.dart';
import '../core/app_text_styles.dart';

class QuestionOptionsCard extends StatelessWidget {
  final List<String> options;
  final int? selectedOptionIndex;
  final int correctOptionIndex;
  final bool hasSubmitted;
  final Function(int) onSelect;

  const QuestionOptionsCard({
    super.key,
    required this.options,
    required this.selectedOptionIndex,
    required this.correctOptionIndex,
    required this.hasSubmitted,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final styles = AppTextStyles(context);

    return Column(
      children: List.generate(
        options.length,
        (index) => _buildOptionItem(styles, index),
      ),
    );
  }

  Widget _buildOptionItem(AppTextStyles styles, int index) {
    final isSelected = selectedOptionIndex == index;
    final isCorrect = hasSubmitted && correctOptionIndex == index;
    final isIncorrect = hasSubmitted && isSelected && !isCorrect;

    Color getPointerColor() {
      if (hasSubmitted) {
        if (isCorrect) return AppColors.primaryGreen;
        if (isIncorrect) return AppColors.error;
      }
      return AppColors.chipTextInactive;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSize.paddingM),
      child: InkWell(
        onTap: () => onSelect(index),
        child: Container(
          padding: const EdgeInsets.all(AppSize.paddingM),
          decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.circular(AppSize.radiusL),
          ),
          child: Row(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: (isSelected || isCorrect || isIncorrect)
                        ? Colors.white
                        : Colors.grey.shade600,
                    width: 2,
                  ),
                  color: (isSelected || isCorrect || isIncorrect)
                      ? Colors.white
                      : Colors.transparent,
                ),
                child: (isCorrect || isIncorrect)
                    ? Container(
                        margin: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: getPointerColor(),
                        ),
                      )
                    : null,
              ),
              const SizedBox(width: AppSize.paddingM),
              Expanded(
                child: Text(
                  options[index],
                  style: styles.statTitle.copyWith(color: AppColors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
