import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:new_app/domain/admin/answer_maintain/maintain_answer_entities.dart';
import 'package:new_app/domain/admin/metrics_list/metrics_list_entities.dart';
import 'package:new_app/presentation/colors.dart';
import 'package:new_app/presentation/providers.dart';
import 'package:new_app/presentation/text_styles.dart';
import 'package:new_app/presentation/widgets/continue_button.dart';
import 'package:new_app/presentation/widgets/drop_down_button.dart';
import 'package:new_app/presentation/widgets/quiz_back_button.dart';
import 'package:new_app/presentation/widgets/quiz_text_field.dart';

class EditAnswerPage extends StatefulWidget {
  final MaintainableAnswer? answer;

  const EditAnswerPage({Key? key, required this.answer}) : super(key: key);

  @override
  State<EditAnswerPage> createState() => _EditAnswerPageState();
}

class _EditAnswerPageState extends State<EditAnswerPage> {
  List<Metric> metrics = [];
  late final Map<MaintainableAnswerMetric, int> metricToPoints;

  @override
  void initState() {
    super.initState();
    metricToPoints = widget.answer?.metricToPoints ?? {};
    refresh();
  }

  Future<void> refresh() async {
    metrics = await metricListRepository.getMetrics();
    if (mounted) setState(() {});
  }

  void onMetricAdded(Metric metric) {
    metricToPoints[MaintainableAnswerMetric(
      id: metric.name,
      name: metric.name,
    )] = 0;
  }

  Future<void> save(String text) async {
    final res = MaintainableAnswer(
      id: widget.answer?.id ?? newId(),
      text: text,
      metricToPoints: metricToPoints,
    );
    await maintainAnswerRepository.saveAnswer(res);
    Navigator.of(context).pop(res);
  }

  @override
  Widget build(BuildContext context) {
    final answerTextField = useTextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(padding: EdgeInsets.symmetric(vertical: 30)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Редактирование\nответа', style: headerStyle),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete_outline_outlined,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 47)),
            const Text('Ответ', style: labelStyle),
            const Padding(padding: EdgeInsets.only(top: 10)),
            QuizInputField(
              hintText: 'Введите ответ',
              controller: answerTextField,
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            const Text('Метрики', style: labelStyle),
            for (final m in metricToPoints.entries) ...[
              const Padding(padding: EdgeInsets.only(top: 10)),
              _SpecialSecretWidget(
                text: m.key.name,
                points: m.value,
              ),
            ],
            const Padding(padding: EdgeInsets.only(top: 10)),
            QuizDropdownButton(
              items: metrics.map((e) => e.name).toList(),
              hint: 'Добавить метрику',
              selectedIndex: null,
              onChanged: (int i) => onMetricAdded(metrics[i]),
            ),
            const Spacer(),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 19),
                  child: QuizBackButton(),
                ),
                const Spacer(),
                ContinueButton(
                  onTap: () => save(answerTextField.text),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 36)),
          ],
        ),
      ),
    );
  }
}

class _SpecialSecretWidget extends StatelessWidget {
  final int points;
  final String text;

  const _SpecialSecretWidget({
    Key? key,
    required this.text,
    required this.points,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: quizGrey,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Text(
              text,
              style: const TextStyle(color: quizGrey, fontSize: 16),
            ),
          ),
          const Spacer(),
          const Padding(padding: EdgeInsets.only(left: 5)),
          GestureDetector(
            child: const Icon(
              Icons.remove_outlined,
              color: quizGrey,
            ),
          ),
          const Padding(padding: EdgeInsets.only(left: 5)),
          Text(
            '$points',
            style: const TextStyle(color: Colors.white, fontSize: 25),
          ),
          const Padding(padding: EdgeInsets.only(left: 5)),
          GestureDetector(
            child: const Icon(
              Icons.add_outlined,
              color: quizGrey,
            ),
          ),
          const Padding(padding: EdgeInsets.only(left: 5)),
        ],
      ),
    );
  }
}
