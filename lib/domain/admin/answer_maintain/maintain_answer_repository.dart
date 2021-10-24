import 'package:new_app/domain/admin/answer_maintain/maintain_answer_entities.dart';

abstract class MaintainAnswerRepository {
  Future<void> saveAnswer(Answer answer);

  Future<void> deleteAnswer(Answer answer);
}
