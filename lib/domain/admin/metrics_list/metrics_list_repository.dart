import 'package:new_app/domain/admin/metrics_list/metrics_list_entities.dart';

abstract class MetricListRepository {
  Future<List<Metric>> getTests(Metric metric);
}
