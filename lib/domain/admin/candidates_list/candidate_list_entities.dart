class Candidate {
  final String name;
  final String email;

  final int totalTests;
  final int passedTests;

  final Map<CandidateMetric, int> points;
  Candidate({
    required this.name,
    required this.email,
    required this.totalTests,
    required this.passedTests,
    required this.points,
  });
}

class CandidateMetric {
  String name;
  CandidateMetric({
    required this.name,
  });
}
