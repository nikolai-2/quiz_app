import 'package:new_app/domain/admin/answer_maintain/maintain_answer_entities.dart';

abstract class MaintainAnswerRepository {
  Future<void> saveAnswer(MaintainableAnswer answer);
  Future<MaintainableAnswer> getAnswer(String id);
  Future<void> deleteAnswer(MaintainableAnswer answer);
}
