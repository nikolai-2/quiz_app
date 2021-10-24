class MaintainableQuestion {
  final String id;
  final String name;
  final String text;
  final List<MaintainableQuestionAnswer> answers;

  MaintainableQuestion({
    required this.id,
    required this.name,
    required this.text,
    required this.answers,
  });
}

class MaintainableQuestionAnswer {
  final String id;
  final String text;

  MaintainableQuestionAnswer(this.text, this.id);
}
