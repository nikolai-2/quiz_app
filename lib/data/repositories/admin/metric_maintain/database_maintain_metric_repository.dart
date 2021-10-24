import 'package:sembast/sembast.dart';

import 'package:new_app/data/database/metric.dart';
import 'package:new_app/domain/admin/metric_maintain/maintain_metric_entities.dart';
import 'package:new_app/domain/admin/metric_maintain/maintain_metric_repository.dart';

class DatabaseMaintailMetricRepository implements MaintainMetricRepository {
  final Database database;
  final StoreRef store;

  DatabaseMaintailMetricRepository({
    required this.database,
    required this.store,
  });

  @override
  Future<void> deleteMetric(MaintainableMetric metric) async {
    await store.record(metric.id).delete(database);
  }

  @override
  Future<void> saveMetric(MaintainableMetric metric) =>
      store.record(metric.id).put(
            database,
            DbMetric(id: metric.id, name: metric.name).toMap(),
          );
}
