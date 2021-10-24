class Test {
  final String id;
  final String name;
  final List<Question> questions;

  Test({
    required this.id,
    required this.name,
    required this.questions,
  });
}

class Question {
  final String id;
  final String name;

  Question(this.id, this.name);
}
