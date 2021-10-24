const String employeesCollection = 'employees';

class DbEmployee {
  final String id;
  final String name;
  final String email;

  DbEmployee({
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

  factory DbEmployee.fromMap(Map<String, dynamic> map) {
    return DbEmployee(
      id: map['id'],
      name: map['name'],
      email: map['email'],
    );
  }
}
