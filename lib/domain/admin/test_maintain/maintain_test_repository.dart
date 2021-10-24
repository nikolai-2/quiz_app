import 'package:new_app/domain/admin/test_maintain/maintain_test_entities.dart';

abstract class MaintainTestRepository {
  Future<void> saveTest(MaintainableTest test);

  Future<MaintainableTest> getTest(String id);

  Future<void> deleteAnswer(MaintainableTest test);
}
