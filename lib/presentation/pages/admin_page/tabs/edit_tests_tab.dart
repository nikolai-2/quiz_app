import 'package:flutter/material.dart';
import 'package:new_app/domain/admin/metric_maintain/maintain_metric_repository.dart';
import 'package:new_app/domain/admin/metrics_list/metrics_list_entities.dart';
import 'package:new_app/domain/admin/test_maintain/maintain_test_entities.dart';
import 'package:new_app/domain/admin/tests_list/test_list_entities.dart';
import 'package:new_app/presentation/pages/edit_test_page.dart';
import 'package:new_app/presentation/pages/edit_field_page.dart';
import 'package:new_app/presentation/providers.dart';
import 'package:new_app/presentation/route.dart';
import 'package:new_app/presentation/text_styles.dart';
import 'package:new_app/presentation/widgets/rounded_ink_well.dart';

class EditTestsTab extends StatefulWidget {
  const EditTestsTab({Key? key}) : super(key: key);

  @override
  State<EditTestsTab> createState() => _EditTestsTabState();
}

class _EditTestsTabState extends State<EditTestsTab> {
  List<Test> tests = [];
  List<Metric> metrics = [];

  @override
  void initState() {
    super.initState();
    refresh();
  }

  Future<void> refresh() async {
    tests = await testListRepository.getTests();
    metrics = await metricListRepository.getMetrics();
    if (mounted) setState(() {});
  }

  void openTest(String id) async {
    final test = await maintainTestRepository.getTest(id);
    await Navigator.of(context).push(
      route(EditTestPage(test: test)),
    );
    await refresh();
  }

  void openMetric(String id) async {
    final metric = await maintainMetricRepository.getMetric(id);
    await Navigator.of(context).push(
      route(EditFieldPage(metric: metric)),
    );
    await refresh();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 27),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(padding: EdgeInsets.only(top: 60)),
              const Text(
                'Редактирование и\nсоздание тестов',
                style: headerStyle,
              ),
              const Padding(padding: EdgeInsets.only(top: 40)),
              const Text(
                'Тесты',
                style: labelStyle,
              ),
              const Padding(padding: EdgeInsets.only(top: 16)),
              for (final test in tests) ...[
                const SizedBox(height: 16),
                RoundedInkWell(
                  label: test.name,
                  icon: Icons.arrow_forward_rounded,
                  onTap: () => openTest(test.id),
                ),
              ],
              const Padding(padding: EdgeInsets.only(top: 16)),
              RoundedInkWell(
                label: 'Добавить тест',
                icon: Icons.add_sharp,
                onTap: () => Navigator.of(context).push(
                  route(const EditTestPage(test: null)),
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 32)),
              const Text(
                'Метрики',
                style: labelStyle,
              ),
              for (final metric in metrics) ...[
                const SizedBox(height: 16),
                RoundedInkWell(
                  label: metric.name,
                  icon: Icons.arrow_forward_rounded,
                  onTap: () => openMetric(metric.id),
                ),
              ],
              const Padding(padding: EdgeInsets.only(top: 16)),
              RoundedInkWell(
                label: 'Добавить метрику',
                icon: Icons.add_sharp,
                onTap: () => Navigator.of(context).push(
                  route(const EditFieldPage(metric: null)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
