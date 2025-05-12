class Question {
  final String subject;
  final String questionNumber;
  final String questionText;
  final List<String> options;
  final int correctOptionIndex;
  final bool isAnswered;
  final int? selectedOptionIndex;

  const Question({
    required this.subject,
    required this.questionNumber,
    required this.questionText,
    required this.options,
    required this.correctOptionIndex,
    this.isAnswered = false,
    this.selectedOptionIndex,
  });

  bool get isCorrect => isAnswered && selectedOptionIndex == correctOptionIndex;

  Question copyWith({
    String? subject,
    String? questionNumber,
    String? questionText,
    List<String>? options,
    int? correctOptionIndex,
    bool? isAnswered,
    int? selectedOptionIndex,
  }) {
    return Question(
      subject: subject ?? this.subject,
      questionNumber: questionNumber ?? this.questionNumber,
      questionText: questionText ?? this.questionText,
      options: options ?? this.options,
      correctOptionIndex: correctOptionIndex ?? this.correctOptionIndex,
      isAnswered: isAnswered ?? this.isAnswered,
      selectedOptionIndex: selectedOptionIndex ?? this.selectedOptionIndex,
    );
  }

  factory Question.mockEconomicsQuestion() {
    return const Question(
      subject: 'Economics',
      questionNumber: '#6',
      questionText:
          'Select the correct judgment about the global economy from the list below.',
      options: [
        'The functioning of the world economy is based on the international division of labor',
        'The trade balance is the difference between imports and exports for a certain period',
        'State regulation of foreign trade is carried out exclusively by tariff methods',
        'International economic relations are carried out in the form of monetary and credit relations',
      ],
      correctOptionIndex: 1,
    );
  }

  factory Question.mockData() {
    return Question.mockEconomicsQuestion();
  }
}
