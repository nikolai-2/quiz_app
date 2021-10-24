import 'package:new_app/domain/admin/metrics_list/metrics_list_entities.dart';
import 'package:new_app/domain/admin/metrics_list/metrics_list_repository.dart';

class DatabaseMetricListRepository implements MetricListRepository {
  @override
  Future<List<Metric>> getTests(Metric metric) {
    // TODO: implement getTests
    throw UnimplementedError();
  }
}
