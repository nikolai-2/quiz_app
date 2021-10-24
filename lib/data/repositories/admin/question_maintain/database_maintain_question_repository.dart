import 'package:new_app/data/database/answer.dart';
import 'package:new_app/data/database/question.dart';
import 'package:sembast/sembast.dart';

import 'package:new_app/domain/admin/question_maintain/maintain_question_entities.dart';
import 'package:new_app/domain/admin/question_maintain/maintain_question_repository.dart';

class DatabaseMaintainQuestionRepository implements MaintainQuestionRepository {
  final Database database;
  final StoreRef store;
  final StoreRef answersStore;

  DatabaseMaintainQuestionRepository({
    required this.database,
    required this.store,
    required this.answersStore,
  });

  @override
  Future<void> saveQuestion(MaintainableQuestion question) async {
    await store.record(question.id).put(
          database,
          DbQuestion(
            id: question.id,
            text: question.text,
            name: question.name,
            answerIds: question.answers.map((e) => e.id).toList(),
          ).toMap(),
        );
  }

  @override
  Future<void> deleteQuestion(MaintainableQuestion question) async {
    await store.record(question.id).delete(database);
  }

  @override
  Future<MaintainableQuestion> getQuestion(String id) async {
    return await store
        .record(id)
        .get(database)
        .then((m) => DbQuestion.fromMap(m))
        .then(
          (m) async => MaintainableQuestion(
            id: m.id,
            name: m.name,
            text: m.text,
            answers: await _getAnswersById(m.answerIds),
          ),
        );
  }

  Future<List<MaintainableQuestionAnswer>> _getAnswersById(
      List<String> answersId) async {
    final List<MaintainableQuestionAnswer> res = [];

    for (final id in answersId) {
      res.add(
        await answersStore
            .record(id)
            .get(database)
            .then((m) => DbAnswer.fromMap(m))
            .then((m) => MaintainableQuestionAnswer(id: m.id, text: m.text)),
      );
    }
    return res;
  }
}
