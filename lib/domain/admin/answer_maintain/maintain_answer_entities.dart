class Answer {
  final String id;
  final String text;
  final Map<AnswerMetric, int> metricToPoints;
  Answer({
    required this.id,
    required this.text,
    required this.metricToPoints,
  });
}

class AnswerMetric {
  final String name;
  AnswerMetric({
    required this.name,
  });
}
