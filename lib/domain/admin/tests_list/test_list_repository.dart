import 'package:new_app/domain/admin/tests_list/test_list_entities.dart';

abstract class TestListRepository {
  Future<List<Test>> getTests();
}
