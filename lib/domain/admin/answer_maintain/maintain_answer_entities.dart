class MaintainableAnswer {
  final String id;
  final String text;
  final Map<MaintainableAnswerMetric, int> metricToPoints;

  MaintainableAnswer({
    required this.id,
    required this.text,
    required this.metricToPoints,
  });
}

class MaintainableAnswerMetric {
  final String id;
  final String name;
  MaintainableAnswerMetric({
    required this.id,
    required this.name,
  });
}
