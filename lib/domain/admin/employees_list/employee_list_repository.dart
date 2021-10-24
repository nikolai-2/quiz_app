import 'package:new_app/domain/admin/employees_list/employee_list_entities.dart';

abstract class EmployeeListRepository {
  Future<List<Employee>> getEmployees();
}
