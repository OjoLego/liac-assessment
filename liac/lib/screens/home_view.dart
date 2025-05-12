import 'package:flutter/material.dart';
import 'package:liac/core/app_string.dart';
import '../core/app_colors.dart';
import '../core/app_size.dart';
import '../core/app_text_styles.dart';
import '../core/responsive_helper.dart';
import '../models/exam_stats.dart';
import '../widgets/score_card.dart';
import '../widgets/subject_stats.dart';
import '../widgets/topics_questions_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late ExamStats examStats;

  @override
  void initState() {
    super.initState();
    examStats = ExamStats.mockData();
  }

  int _activeSubjectIndex = 1;

  void _onChipSelected(int index) {
    setState(() {
      _activeSubjectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final styles = AppTextStyles(context);
    return Scaffold(
      backgroundColor: AppColors.backgroundGreen,
      appBar: _buildAppBar(context, styles),
      body: SafeArea(child: _buildBody(context, styles)),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context, AppTextStyles styles) {
    return AppBar(
      backgroundColor: AppColors.backgroundGreen,
      automaticallyImplyLeading: false,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Hello,', style: styles.greeting),
              Text('${examStats.userName}!', style: styles.userName),
            ],
          ),
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
    );
  }

  Widget _buildBody(BuildContext context, AppTextStyles styles) {
    return SingleChildScrollView(
      padding: ResponsiveHelper.getPadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitles(styles),
          _buildScoreCard(),
          const SizedBox(height: AppSize.paddingM),
          _buildTopicAndQuestionCards(context),
          const SizedBox(height: AppSize.paddingM),
          _buildSubjectChips(),
        ],
      ),
    );
  }

  Widget _buildTitles(AppTextStyles styles) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(examStats.subject, style: styles.heading),
        Text(AppString.examPreparation, style: styles.subheading),
      ],
    );
  }

  Widget _buildScoreCard() {
    return ScoreCard(
      score: examStats.score,
      totalScore: examStats.totalScore,
    );
  }

  Widget _buildTopicAndQuestionCards(BuildContext context) {
    final spacing = ResponsiveHelper.getAdaptiveSize(context, AppSize.paddingM);
    if (ResponsiveHelper.isMobile(context)) {
      return Row(
        children: [
          Expanded(
            child: TopicsQuestionsCard(
              topicsCompleted: examStats.topicsCompleted,
              totalTopics: examStats.totalTopics,
              icon: Icons.school_outlined,
              label: 'topics',
            ),
          ),
          SizedBox(width: spacing),
          Expanded(
            child: TopicsQuestionsCard(
              topicsCompleted: examStats.questionsAnswered,
              totalTopics: examStats.totalQuestions,
              icon: Icons.question_answer_outlined,
              label: 'questions',
            ),
          ),
        ],
      );
    } else {
      return Column(
        children: [
          TopicsQuestionsCard(
            topicsCompleted: examStats.topicsCompleted,
            totalTopics: examStats.totalTopics,
            icon: Icons.school,
            label: 'topics',
          ),
          SizedBox(height: spacing),
          TopicsQuestionsCard(
            topicsCompleted: examStats.questionsAnswered,
            totalTopics: examStats.totalQuestions,
            icon: Icons.question_answer,
            label: 'questions',
          ),
        ],
      );
    }
  }

  Widget _buildSubjectChips() {
    final selectedSubject = examStats.subjects[_activeSubjectIndex];
    final subjectStats = examStats.subjectStats[selectedSubject]!;

    final hour = subjectStats.timeSpent.inMinutes.toString();
    final minute =
        (subjectStats.timeSpent.inSeconds % 60).toString().padLeft(2, '0');

    return SubjetStatsCard(
      subjects: examStats.subjects,
      activeSubjects: List.generate(
        examStats.subjects.length,
        (i) => i == _activeSubjectIndex,
      ),
      onChipSelected: _onChipSelected,
      hour: hour,
      minute: minute,
      solvedText: '${subjectStats.variantsSolved}',
      totalText: '${subjectStats.totalVariants}',
      mistakesMadeText: '${subjectStats.mistakesMade}',
    );
  }
}
