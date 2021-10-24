import 'package:new_app/domain/testing/testing_entities.dart';

abstract class TestingRepository {
  Future<Test> getTest(String id);

  Future<void> compliteTest(Map<Question, Answer> answers);
}
