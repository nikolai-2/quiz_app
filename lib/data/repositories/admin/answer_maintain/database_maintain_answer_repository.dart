import 'package:new_app/data/database/answer.dart';
import 'package:sembast/sembast.dart';

import 'package:new_app/domain/admin/answer_maintain/maintain_answer_entities.dart';
import 'package:new_app/domain/admin/answer_maintain/maintain_answer_repository.dart';

class DatabaseMaintainAnswerRepository implements MaintainAnswerRepository {
  final Database database;
  final StoreRef store;

  DatabaseMaintainAnswerRepository({
    required this.database,
    required this.store,
  });

  @override
  Future<void> deleteAnswer(Answer answer) async {
    await store.record(answer.id).delete(database);
  }

  @override
  Future<void> saveAnswer(Answer answer) => store.record(answer.id).put(
        database,
        DbAnswer(id: answer.id, text: answer.text).toMap(),
      );
}
