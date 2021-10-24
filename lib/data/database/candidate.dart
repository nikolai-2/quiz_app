const String candidatesCollection = 'candidates';

class DbCandidate {
  final String id;
  final String name;
  final String email;

  DbCandidate({
    required this.id,
    required this.name,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }

  factory DbCandidate.fromMap(Map<String, dynamic> map) {
    return DbCandidate(
      id: map['id'],
      name: map['name'],
      email: map['email'],
    );
  }
}
