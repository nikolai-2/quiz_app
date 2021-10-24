import 'package:new_app/domain/admin/question_maintain/maintain_question_entities.dart';

abstract class MaintainQuestionRepository {
  Future<void> saveTest(Question question);

  Future<void> deleteAnswer(Question question);
}
