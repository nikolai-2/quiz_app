import 'package:new_app/domain/admin/test_link_generation/test_link_generation_entities.dart';

abstract class TestLinkGenerationRepository {
  Future<void> generateTestForEmployee(String testId, String employeeId);

  Future<void> generateTestForCandidate(String testId, String candidateId);

  Future<void> generateTestForNewCandidate(String testId, String name);

  Future<List<Employee>> getEmployesForTesting();

  Future<List<Employee>> getCandidatesForTesting();

  Future<List<TestLinkTest>> getAvailableTests();
}
