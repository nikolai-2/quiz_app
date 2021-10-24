import 'package:new_app/data/database/metric.dart';
import 'package:sembast/sembast.dart';

import 'package:new_app/domain/admin/metrics_list/metrics_list_entities.dart';
import 'package:new_app/domain/admin/metrics_list/metrics_list_repository.dart';

class DatabaseMetricListRepository implements MetricListRepository {
  final Database database;
  final StoreRef metricsStore;

  DatabaseMetricListRepository({
    required this.database,
    required this.metricsStore,
  });

  @override
  Future<List<Metric>> getMetrics() async {
    return await metricsStore.find(database).then(
          (f) => f
              .map((e) => DbMetric.fromMap(e.value))
              .map((e) => Metric(id: e.id, name: e.name))
              .toList(),
        );
  }
}
