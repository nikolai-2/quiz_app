import 'package:flutter/material.dart';
import 'package:new_app/domain/admin/metric_maintain/maintain_metric_entities.dart';
import 'package:new_app/presentation/providers.dart';
import 'package:new_app/presentation/text_styles.dart';
import 'package:new_app/presentation/widgets/continue_button.dart';
import 'package:new_app/presentation/widgets/quiz_back_button.dart';
import 'package:new_app/presentation/widgets/quiz_text_field.dart';

class EditFieldPage extends StatefulWidget {
  final MaintainableMetric? metric;

  const EditFieldPage({
    Key? key,
    required this.metric,
  }) : super(key: key);

  @override
  State<EditFieldPage> createState() => _EditFieldPageState();
}

class _EditFieldPageState extends State<EditFieldPage> {
  Future<void> save(String name, String text) async {
    final res = MaintainableMetric(
      id: widget.metric?.id ?? newId(),
      name: name,
    );
    await maintainMetricRepository.saveMetric(res);
    Navigator.of(context).pop(res);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 27),
              child: Center(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 550),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 60),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Создание\nметрики', style: headerStyle),
                          const Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.delete_outline,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ],
                      ),
                      const Padding(padding: EdgeInsets.only(top: 56)),
                      const Text(
                        'Название',
                        style: labelStyle,
                      ),
                      const Padding(padding: EdgeInsets.only(top: 16)),
                      const QuizInputField(
                        hintText: 'Введите что-либо',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 60,
            margin: const EdgeInsets.symmetric(horizontal: 27),
            constraints: const BoxConstraints(maxWidth: 550),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 19),
                  child: QuizBackButton(),
                ),
                const Spacer(),
                ContinueButton(
                  onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 36),
        ],
      ),
    );
  }
}
