import 'package:new_app/domain/admin/test_link_generation/test_link_generation_entities.dart';
import 'package:new_app/domain/admin/test_link_generation/test_link_generation_repository.dart';

class DatabaseTestLinkGenerationRepository
    implements TestLinkGenerationRepository {
  @override
  Future<void> generateTestForCandidate(Test test, Candidate candidate) {
    // TODO: implement generateTestForCandidate
    throw UnimplementedError();
  }

  @override
  Future<void> generateTestForEmployee(Test test, Employee employee) {
    // TODO: implement generateTestForEmployee
    throw UnimplementedError();
  }

  @override
  Future<void> generateTestForNewCandidate(Test test, String name) {
    // TODO: implement generateTestForNewCandidate
    throw UnimplementedError();
  }
}
