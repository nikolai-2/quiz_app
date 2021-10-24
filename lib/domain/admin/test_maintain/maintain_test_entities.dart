class MaintainableTest {
  final String id;
  final String name;
  final List<MaintainableQuestion> questions;

  MaintainableTest({
    required this.id,
    required this.name,
    required this.questions,
  });
}

class MaintainableQuestion {
  final String id;
  final String name;

  MaintainableQuestion(this.id, this.name);
}
