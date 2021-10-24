abstract class TestLinkGenerationRepository {
  Future<void> generateTestForEmployee(String testId, String employeeId);

  Future<void> generateTestForCandidate(String testId, String candidateId);

  Future<void> generateTestForNewCandidate(String testId, String name);
}
