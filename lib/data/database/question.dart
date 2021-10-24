const String questionsCollection = 'questions';

class DbQuestion {
  final String id;
  final String name;
  final String text;
  final List<String> answerIds;
  DbQuestion({
    required this.id,
    required this.name,
    required this.text,
    required this.answerIds,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
      'answerIds': answerIds,
    };
  }

  factory DbQuestion.fromMap(Map<String, dynamic> map) {
    return DbQuestion(
      id: map['id'],
      name: map['name'],
      text: map['text'],
      answerIds: List<String>.from(map['answerIds']),
    );
  }
}
