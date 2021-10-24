import 'package:new_app/domain/admin/question_maintain/maintain_question_entities.dart';

abstract class MaintainQuestionRepository {
  Future<void> saveQuestion(MaintainableQuestion question);
  Future<MaintainableQuestion> getQuestion(String id);
  Future<void> deleteQuestion(MaintainableQuestion question);
}
