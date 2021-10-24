import 'package:flutter/cupertino.dart';
import 'package:new_app/domain/admin/candidates_list/candidate_list_entities.dart';

abstract class CandidateListRepository {
  Future<List<Candidate>> getCandidates();
}
