import 'subject_stats.dart';

class ExamStats {
  final String userName;
  final String subject;
  final int score;
  final int totalScore;
  final int topicsCompleted;
  final int totalTopics;
  final int questionsAnswered;
  final int totalQuestions;
  final List<String> subjects;
  final List<bool> activeSubjects;
  final Map<String, SubjectStats> subjectStats;

  const ExamStats({
    required this.userName,
    required this.subject,
    required this.score,
    required this.totalScore,
    required this.topicsCompleted,
    required this.totalTopics,
    required this.questionsAnswered,
    required this.totalQuestions,
    required this.subjects,
    required this.activeSubjects,
    required this.subjectStats,
  });

  factory ExamStats.mockData() {
    return ExamStats(
      userName: "Alexandra",
      subject: "Social Studies",
      score: 58,
      totalScore: 100,
      topicsCompleted: 3,
      totalTopics: 5,
      questionsAnswered: 8,
      totalQuestions: 16,
      subjects: const ["Land and society", "Economics", "Law", "Social rights"],
      activeSubjects: const [true, false, false, false],
      subjectStats: {
        "Land and society": SubjectStats(
          timeSpent: const Duration(minutes: 4, seconds: 10),
          variantsSolved: 3,
          totalVariants: 10,
          mistakesMade: 5,
        ),
        "Economics": SubjectStats(
          timeSpent: const Duration(minutes: 3, seconds: 17),
          variantsSolved: 6,
          totalVariants: 20,
          mistakesMade: 28,
        ),
        "Law": SubjectStats(
          timeSpent: const Duration(minutes: 5),
          variantsSolved: 2,
          totalVariants: 8,
          mistakesMade: 3,
        ),
        "Social rights": SubjectStats(
          timeSpent: const Duration(minutes: 2, seconds: 30),
          variantsSolved: 4,
          totalVariants: 12,
          mistakesMade: 7,
        ),
      },
    );
  }
}
