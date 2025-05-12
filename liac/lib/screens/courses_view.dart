import 'package:flutter/material.dart';
import 'package:liac/core/app_string.dart';
import '../core/app_colors.dart';
import '../core/app_size.dart';
import '../core/app_text_styles.dart';
import '../core/responsive_helper.dart';
import '../widgets/courses_options.dart';

class CoursesView extends StatefulWidget {
  const CoursesView({super.key});

  @override
  State<CoursesView> createState() => _CoursesViewState();
}

class _CoursesViewState extends State<CoursesView> {
  int _selectedPracticeIndex = 0;

  @override
  Widget build(BuildContext context) {
    final styles = AppTextStyles(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _buildAppBar(context, styles),
      body: SafeArea(child: _buildBody(context, styles)),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context, AppTextStyles styles) {
    return AppBar(
      backgroundColor: AppColors.black,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Practice',
              style: styles.greeting.copyWith(
                  fontSize: ResponsiveHelper.getAdaptiveFontSize(
                      context, AppSize.fontMedium * 2))),
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
        ],
      ),
      elevation: 0,
    );
  }

  Widget _buildBody(BuildContext context, AppTextStyles styles) {
    return SingleChildScrollView(
      padding: ResponsiveHelper.getPadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildChallengeHeader(styles),
          const SizedBox(height: AppSize.paddingL),
          _buildPracticeOptions(context),
          const SizedBox(height: AppSize.paddingL),
          _buildMistakesPracticeCard(context, styles),
        ],
      ),
    );
  }

  Widget _buildChallengeHeader(AppTextStyles styles) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppString.challengeYourKnowledge,
          style: styles.heading.copyWith(
            color: AppColors.white,
            fontSize: ResponsiveHelper.getAdaptiveFontSize(
              context,
              AppSize.fontLarge * 2,
            ),
            fontWeight: FontWeight.bold,
          ),
        ),
        _buildDropdownButton(styles),
      ],
    );
  }

  Widget _buildDropdownButton(AppTextStyles styles) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: AppSize.paddingS, vertical: AppSize.paddingXS),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            AppString.typeOfQuestion,
            style: styles.greeting.copyWith(
                fontSize: ResponsiveHelper.getAdaptiveFontSize(
                    context, AppSize.fontMedium * 2)),
          ),
          const SizedBox(width: AppSize.paddingXS),
          Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.darkGray,
            size: AppSize.iconL,
          ),
        ],
      ),
    );
  }

  Widget _buildPracticeOptions(BuildContext context) {
    final options = [
      {'icon': Icons.shuffle, 'label': 'Random'},
      {'icon': Icons.tag, 'label': 'Exam Number'},
      {'icon': Icons.search, 'label': 'Topic'},
      {'icon': Icons.reorder, 'label': 'In a row'},
    ];

    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: AppSize.paddingM,
      crossAxisSpacing: AppSize.paddingM,
      childAspectRatio: 1.5,
      children: List.generate(options.length, (index) {
        final item = options[index];
        final isSelected = _selectedPracticeIndex == index;

        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedPracticeIndex = index;
            });
          },
          child: OptionCard(
            icon: item['icon'] as IconData,
            label: item['label'] as String,
            isSelected: isSelected,
          ),
        );
      }),
    );
  }

  Widget _buildMistakesPracticeCard(
      BuildContext context, AppTextStyles styles) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
          horizontal: AppSize.paddingM, vertical: AppSize.paddingXL),
      decoration: BoxDecoration(
        color: AppColors.cyan,
        borderRadius: BorderRadius.circular(AppSize.radiusM),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppString.mistakesPractice,
            style: styles.subheading.copyWith(
              color: AppColors.black,
              fontWeight: FontWeight.bold,
              fontSize: ResponsiveHelper.getAdaptiveFontSize(
                context,
                AppSize.fontLarge,
              ),
            ),
          ),
          const SizedBox(height: AppSize.paddingS),
          Text(
            AppString.practiceMore,
            style: TextStyle(
              color: AppColors.black.withOpacity(0.8),
              fontSize: ResponsiveHelper.getAdaptiveFontSize(
                context,
                AppSize.fontRegular,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
