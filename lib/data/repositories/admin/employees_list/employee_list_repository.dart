import 'package:new_app/data/database/metric.dart';
import 'package:new_app/data/database/test_execution.dart';
import 'package:sembast/sembast.dart';

import 'package:new_app/data/database/employee.dart';
import 'package:new_app/domain/admin/employees_list/employee_list_entities.dart';
import 'package:new_app/domain/admin/employees_list/employee_list_repository.dart';

class DatabaseEmployeeListRepository implements EmployeeListRepository {
  final Database database;
  final StoreRef employeesStore;
  final StoreRef metricsStore;
  final StoreRef executionsStore;

  DatabaseEmployeeListRepository({
    required this.database,
    required this.employeesStore,
    required this.metricsStore,
    required this.executionsStore,
  });

  @override
  Future<List<Employee>> getEmployees() async {
    final dbEmployees = await employeesStore
        .find(database)
        .then((f) => f.map((e) => DbEmployee.fromMap(e.value)).toList());

    final List<Employee> res = [];

    for (final employee in dbEmployees) {
      final employeeExecutions = await executionsStore
          .find(
            database,
            finder: Finder(filter: Filter.equals('employeeId', employee.id)),
          )
          .then((f) => f.map((e) => DbTestExecution.fromMap(e.value)).toList());

      final employeeCompleteExecution =
          employeeExecutions.where((e) => e.points != null).toList();

      final allEmployeeMetricIds = employeeCompleteExecution
          .map((e) => e.metricIdToPoint!.keys)
          .expand((i) => i)
          .toList();

      final allEmployeeMetrics = await metricsStore
          .record(allEmployeeMetricIds)
          .get(database)
          .then((f) => f.map((e) => DbMetric.fromMap(e.value)).toList());

      res.add(
        Employee(
          name: employee.name,
          email: employee.email,
          totalPoints: _getSumOfPoints(employeeExecutions),
          points: allEmployeeMetrics,
        ),
      );
    }
    return res;
  }

  int _getSumOfPoints(List<DbTestExecution> employeeExecutions) {
    var points = 0;
    for (final execution in employeeExecutions) {
      points += execution.points ?? 0;
    }

    return points;
  }
}
