class Test {
  final String id;
  final List<Question> questions;
  Test({
    required this.id,
    required this.questions,
  });
}

class Question {
  final String id;
  final String text;
  final List<Answer> answers;
  Question({
    required this.id,
    required this.text,
    required this.answers,
  });
}

class Answer {
  final String id;
  final String name;
  Answer({
    required this.id,
    required this.name,
  });
}
