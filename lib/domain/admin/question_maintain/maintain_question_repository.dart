import 'package:new_app/domain/admin/question_maintain/maintain_question_entities.dart';

abstract class MaintainQuestionRepository {
  Future<void> saveQuestion(MaintainableQuestion question);
  Future<void> getQuestion(MaintainableQuestion question);
  Future<void> deleteQuestion(MaintainableQuestion question);
}
