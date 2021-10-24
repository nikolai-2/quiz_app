import 'package:new_app/data/database/question.dart';
import 'package:sembast/sembast.dart';

import 'package:new_app/domain/admin/question_maintain/maintain_question_entities.dart';
import 'package:new_app/domain/admin/question_maintain/maintain_question_repository.dart';

class DatabaseMaintainQuestionRepository implements MaintainQuestionRepository {
  final Database database;
  final StoreRef store;

  DatabaseMaintainQuestionRepository({
    required this.database,
    required this.store,
  });

  @override
  Future<void> deleteAnswer(Question question) async {
    await store.record(question.id).delete(database);
  }

  @override
  Future<void> saveTest(Question question) async {
    await store.record(question.id).put(
          database,
          DbQuestion(
            id: question.id,
            text: question.name,
            answerIds: question.answers.map((e) => e.id).toList(),
          ).toMap(),
        );
  }
}
