import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../core/app_size.dart';
import '../core/app_string.dart';
import '../core/app_text_styles.dart';
import '../core/responsive_helper.dart';
import '../models/question_model.dart';
import '../widgets/question_options_card.dart';

class PracticeView extends StatefulWidget {
  const PracticeView({super.key});

  @override
  State<PracticeView> createState() => _PracticeViewState();
}

class _PracticeViewState extends State<PracticeView> {
  late Question currentQuestion;
  int? selectedOptionIndex;
  bool hasSubmitted = false;

  @override
  void initState() {
    super.initState();
    currentQuestion = Question.mockData();
    selectedOptionIndex = null;
  }

  void _selectOption(int index) {
    if (!hasSubmitted) {
      setState(() {
        selectedOptionIndex = index;
      });
    }
  }

  void _checkAnswer() {
    if (selectedOptionIndex != null && !hasSubmitted) {
      setState(() {
        hasSubmitted = true;
        currentQuestion = currentQuestion.copyWith(
          isAnswered: true,
          selectedOptionIndex: selectedOptionIndex,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final styles = AppTextStyles(context);
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: _buildAppBar(context),
      body: SafeArea(
        child: _buildBody(context, styles),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.black,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: AppColors.white),
        onPressed: () {},
      ),
      actions: [
        Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: AppColors.white,
              child: Icon(Icons.person,
                  color: AppColors.darkGray,
                  size: ResponsiveHelper.getAdaptiveIconSize(
                      context, AppSize.iconM)),
            ),
            const SizedBox(width: AppSize.paddingS),
            CircleAvatar(
              radius: AppSize.radiusL,
              backgroundColor: AppColors.white,
              child: Icon(
                Icons.qr_code_scanner,
                color: AppColors.darkGray,
                size: ResponsiveHelper.getAdaptiveIconSize(
                    context, AppSize.iconM),
              ),
            ),
          ],
        ),
        const SizedBox(width: AppSize.paddingL),
      ],
      elevation: 0,
    );
  }

  Widget _buildBody(BuildContext context, AppTextStyles styles) {
    return SingleChildScrollView(
      padding: ResponsiveHelper.getPadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildQuestionHeader(styles),
          const SizedBox(height: AppSize.paddingL),
          _buildQuestionText(styles),
          const SizedBox(height: AppSize.paddingL),
          _buildOptions(styles),
          const SizedBox(height: AppSize.paddingXL),
          _buildCheckAnswerButton(),
        ],
      ),
    );
  }

  Widget _buildQuestionHeader(AppTextStyles styles) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          currentQuestion.subject,
          style: styles.heading.copyWith(
            color: AppColors.primaryGreen,
            fontSize: ResponsiveHelper.getAdaptiveFontSize(
              context,
              AppSize.fontLarge,
            ),
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          currentQuestion.questionNumber,
          style: styles.heading.copyWith(
            color: AppColors.primaryGreen,
            fontSize: ResponsiveHelper.getAdaptiveFontSize(
              context,
              AppSize.fontLarge,
            ),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildQuestionText(AppTextStyles styles) {
    return Text(
      currentQuestion.questionText,
      style: styles.subheading.copyWith(
        color: AppColors.white,
        fontSize: ResponsiveHelper.getAdaptiveFontSize(
          context,
          AppSize.fontMedium,
        ),
      ),
    );
  }

  Widget _buildOptions(AppTextStyles styles) {
    return QuestionOptionsCard(
      options: currentQuestion.options,
      selectedOptionIndex: selectedOptionIndex,
      correctOptionIndex: currentQuestion.correctOptionIndex,
      hasSubmitted: hasSubmitted,
      onSelect: _selectOption,
    );
  }

  Widget _buildCheckAnswerButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSize.paddingL),
      child: SizedBox(
        height: 50,
        child: ElevatedButton(
          onPressed: selectedOptionIndex != null ? _checkAnswer : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.cyan,
            disabledBackgroundColor: AppColors.cyan.withOpacity(0.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.buttonRadius),
            ),
          ),
          child: Text(
            AppString.checkTheAnswer,
            style: TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.bold,
              fontSize: ResponsiveHelper.getAdaptiveFontSize(
                context,
                AppSize.fontMedium,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
