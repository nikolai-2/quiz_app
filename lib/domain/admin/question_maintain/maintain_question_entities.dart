class Question {
  final String id;
  final String name;
  final String text;
  final List<QuestionAnswer> answers;

  Question({
    required this.id,
    required this.name,
    required this.text,
    required this.answers,
  });
}

class QuestionAnswer {
  final String id;
  final String text;

  QuestionAnswer(this.text, this.id);
}
