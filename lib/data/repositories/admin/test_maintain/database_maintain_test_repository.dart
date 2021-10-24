import 'package:new_app/data/database/test.dart';
import 'package:sembast/sembast.dart';

import 'package:new_app/domain/admin/test_maintain/maintain_test_entities.dart';
import 'package:new_app/domain/admin/test_maintain/maintain_test_repository.dart';

class DatabaseMaintainTestRepository implements MaintainTestRepository {
  final Database database;
  final StoreRef store;

  DatabaseMaintainTestRepository({
    required this.database,
    required this.store,
  });

  @override
  Future<void> deleteAnswer(MaintainableTest test) async {
    await store.record(test.id).delete(database);
  }

  @override
  Future<void> saveTest(MaintainableTest test) => store.record(test.id).put(
        database,
        DbTest(
          id: test.id,
          questionIds: test.questions.map((e) => e.id).toList(),
        ).toMap(),
      );

  @override
  Future<MaintainableTest> getTest(String id) {
    // TODO: implement getTest
    throw UnimplementedError();
  }
}
