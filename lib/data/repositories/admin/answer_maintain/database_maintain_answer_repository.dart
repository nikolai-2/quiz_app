import 'package:new_app/data/database/answer.dart';
import 'package:sembast/sembast.dart';

import 'package:new_app/domain/admin/answer_maintain/maintain_answer_entities.dart';
import 'package:new_app/domain/admin/answer_maintain/maintain_answer_repository.dart';

class DatabaseMaintainAnswerRepository implements MaintainAnswerRepository {
  final Database database;
  final StoreRef store;
  final StoreRef answersStore;

  DatabaseMaintainAnswerRepository({
    required this.database,
    required this.store,
    required this.answersStore,
  });

  @override
  Future<void> deleteAnswer(MaintainableAnswer answer) async {
    await store.record(answer.id).delete(database);
  }

  @override
  Future<void> saveAnswer(MaintainableAnswer answer) =>
      store.record(answer.id).put(
            database,
            DbAnswer(id: answer.id, text: answer.text).toMap(),
          );

  @override
  Future<MaintainableAnswer> getAnswer(String id) async {
    return await answersStore
        .record(id)
        .get(database)
        .then((m) => DbAnswer.fromMap(m))
        .then(
          (m) => MaintainableAnswer(
            id: m.id,
            text: m.text,
            metricToPoints: 
          ),
        );
  }
}
