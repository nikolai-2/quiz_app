class Employee {
  final String name;
  final String email;
  final int totalPoints;

  final Map<EmployeeMetric, int> points;

  Employee({
    required this.name,
    required this.email,
    required this.totalPoints,
    required this.points,
  });
}

class EmployeeMetric {
  String name;
  EmployeeMetric({
    required this.name,
  });
}
