import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:new_app/presentation/colors.dart';
import 'package:new_app/presentation/text_styles.dart';
import 'package:new_app/presentation/widgets/quiz_segmentation_tab.dart';

class ResultsTab extends StatefulWidget {
  const ResultsTab({Key? key}) : super(key: key);

  @override
  State<ResultsTab> createState() => _ResultsTabState();
}

class _ResultsTabState extends State<ResultsTab> {
  final String name = 'Евгений';
  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 27),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(padding: EdgeInsets.only(top: 60)),
              Text(
                'Здравствуйте,\n$name',
                style: headerStyle,
              ),
              const SizedBox(height: 25),
              QuizSegmentationTab(
                values: const ['Сотрудники', 'Кандидаты'],
                onSelected: (i) => setState(() => currentTab = i),
                selected: currentTab,
              ),
              const SizedBox(height: 16),
              const UserCard(
                name: 'Ilya Nedelko',
                email: 'xonislegend@gmail.com',
                points: {
                  'Характер': 50,
                  'Логика': 50,
                  'Менструальное здоровье': 50,
                },
              ),
              const SizedBox(height: 16),
              const UserCard(
                name: 'Ilya Nedelko',
                email: 'xonislegend@gmail.com',
                points: {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  final String name;
  final String email;
  final Map<String, int> points;

  const UserCard({
    Key? key,
    required this.name,
    required this.email,
    required this.points,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: quizGrey),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(name, style: bodyStyle14),
                    Text(email, style: hintStyle14),
                  ],
                ),
              ),
              const Text('150', style: headerStyle21),
            ],
          ),
          if (points.entries.isNotEmpty) const SizedBox(height: 15),
          for (final p in points.entries) ...[
            Row(
              children: [
                Text('${p.key}:', style: hintStyle14),
                const SizedBox(width: 6),
                Text(p.value.toString(), style: bodyStyle14),
              ],
            ),
            const SizedBox(height: 5),
          ],
        ],
      ),
    );
  }
}
