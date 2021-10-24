import 'package:new_app/domain/admin/test_maintain/maintain_test_entities.dart';

abstract class MaintainTestRepository {
  Future<void> saveTest(Test test);

  Future<void> deleteAnswer(Test test);
}
