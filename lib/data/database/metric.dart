const String metricCollection = 'metrics';

class DbMetric {
  final String id;
  final String name;
  DbMetric({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory DbMetric.fromMap(Map<String, dynamic> map) {
    return DbMetric(
      id: map['id'],
      name: map['name'],
    );
  }
}
