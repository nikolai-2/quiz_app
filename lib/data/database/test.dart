const String testsCollection = 'tests';

class DbTest {
  final String id;
  final List<String> questionIds;

  DbTest({
    required this.id,
    required this.questionIds,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'questionIds': questionIds,
    };
  }

  factory DbTest.fromMap(Map<String, dynamic> map) {
    return DbTest(
      id: map['id'],
      questionIds: List<String>.from(map['questionIds']),
    );
  }
}
