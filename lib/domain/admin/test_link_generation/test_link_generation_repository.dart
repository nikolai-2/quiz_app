import 'package:new_app/domain/admin/test_link_generation/test_link_generation_entities.dart';

abstract class TestLinkGenerationRepository {
  Future<void> generateTestForEmployee(Test test, Employee employee);

  Future<void> generateTestForCandidate(Test test, Candidate candidate);

  Future<void> generateTestForNewCandidate(Test test, String name);
}
