import 'package:new_app/data/database/employee.dart';
import 'package:sembast/sembast.dart';

import 'package:new_app/domain/admin/employees_list/employee_list_entities.dart';
import 'package:new_app/domain/admin/employees_list/employee_list_repository.dart';

class DatabaseEmployeeListRepository implements EmployeeListRepository {
  final Database database;
  final StoreRef employeesStore;

  DatabaseEmployeeListRepository({
    required this.database,
    required this.employeesStore,
  });

  @override
  Future<List<Employee>> getEmployees() async {
    final dbEmployees = await employeesStore
        .find(database)
        .then((f) => f.map((e) => DbEmployee.fromMap(e.value).toMap()));

    final List<Employee> res = [];

    for (final employee in dbEmployees) {}
  }
}
