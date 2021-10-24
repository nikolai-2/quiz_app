import 'package:sembast/sembast.dart';

import 'package:new_app/data/database/candidate.dart';
import 'package:new_app/data/database/metric.dart';
import 'package:new_app/data/database/test_execution.dart';
import 'package:new_app/domain/admin/candidates_list/candidate_list_entities.dart';
import 'package:new_app/domain/admin/candidates_list/candidate_list_repository.dart';

class DatabaseCandidateListRepository implements CandidateListRepository {
  final Database database;
  final StoreRef candidatesStore;
  final StoreRef metricsStore;
  final StoreRef executionsStore;

  DatabaseCandidateListRepository({
    required this.database,
    required this.candidatesStore,
    required this.metricsStore,
    required this.executionsStore,
  });

  @override
  Future<List<Candidate>> getCandidates() async {
    final dbCandidates = await candidatesStore
        .find(database)
        .then((f) => f.map((e) => DbCandidate.fromMap(e.value)).toList());

    final List<Candidate> res = [];

    for (final candidate in dbCandidates) {
      final candidateExecutions = await executionsStore
          .find(
            database,
            finder: Finder(filter: Filter.equals('candidateId', candidate.id)),
          )
          .then((f) => f.map((e) => DbTestExecution.fromMap(e.value)).toList());

      final candidateCompleteExecutions =
          candidateExecutions.where((e) => e.points != null).toList();

      final allCandidateMetricIds = candidateCompleteExecutions
          .map((e) => e.metricIdToPoint!.keys)
          .expand((i) => i)
          .toList();

      final allCandidateMetrics = await metricsStore
          .records(allCandidateMetricIds)
          .get(database)
          .then((f) => f.map((e) => DbMetric.fromMap(e.value)).toList());

      res.add(
        Candidate(
          name: candidate.name,
          email: candidate.email,
          totalTests: candidateExecutions.length,
          passedTests: candidateCompleteExecutions.length,
          points: {
            for (final metric in allCandidateMetrics)
              CandidateMetric(name: metric.name): candidateCompleteExecutions
                  .map((e) => e.metricIdToPoint![e.id])
                  .fold<int>(0, (previousValue, e) => previousValue + (e ?? 0)),
          },
        ),
      );
    }
    return res;
  }
}
