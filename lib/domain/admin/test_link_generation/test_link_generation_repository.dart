import 'package:new_app/domain/admin/employees_list/employee_list_entities.dart';

abstract class TestLinkGenerationRepository {
  Future<void> generateTestForEmployee(String testId, String employeeId);

  Future<void> generateTestForCandidate(String testId, String candidateId);

  Future<void> generateTestForNewCandidate(String testId, String name);

  Future<List<Employee>> getEmployesForTesting();

  Future<List<Employee>> getCandidatesForTesting();
}
