class DbTestExecution {
  final String id;
  final String testId;
  final String? candidateId;
  final String? employeeId;
  final int? points;
  final Map<String, int>? metricIdToPoint;

  DbTestExecution({
    required this.id,
    required this.testId,
    this.candidateId,
    this.employeeId,
    this.points,
    this.metricIdToPoint,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'testId': testId,
      'candidateId': candidateId,
      'employeeId': employeeId,
      'points': points,
    };
  }

  factory DbTestExecution.fromMap(Map<String, dynamic> map) {
    return DbTestExecution(
      id: map['id'],
      testId: map['testId'],
      candidateId: map['candidateId'] != null ? map['candidateId'] : null,
      employeeId: map['employeeId'] != null ? map['employeeId'] : null,
      points: map['points'] != null ? map['points'] : null,
    );
  }
}
