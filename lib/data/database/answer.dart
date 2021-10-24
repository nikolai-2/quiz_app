const String answersCollection = 'answers';

class DbAnswer {
  final String id;
  final String text;
  DbAnswer({
    required this.id,
    required this.text,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
    };
  }

  factory DbAnswer.fromMap(Map<String, dynamic> map) {
    return DbAnswer(
      id: map['id'],
      text: map['text'],
    );
  }
}
