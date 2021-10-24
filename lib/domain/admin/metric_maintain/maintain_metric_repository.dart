import 'package:new_app/domain/admin/metric_maintain/maintain_metric_entities.dart';

abstract class MaintainMetricRepository {
  Future<void> saveMetric(MaintainableMetric metric);

  Future<MaintainableMetric> getMetric(String id);

  Future<void> deleteMetric(MaintainableMetric metric);
}
