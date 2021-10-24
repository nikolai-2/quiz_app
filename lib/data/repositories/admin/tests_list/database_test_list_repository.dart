import 'package:new_app/domain/admin/tests_list/test_list_entities.dart';
import 'package:new_app/domain/admin/tests_list/test_list_repository.dart';

class DatabaseTestListRepository implements TestListRepository {
  @override
  Future<List<Test>> getTests() {
    // TODO: implement getTests
    throw UnimplementedError();
  }
}
