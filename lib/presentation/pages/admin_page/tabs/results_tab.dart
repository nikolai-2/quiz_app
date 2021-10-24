import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_app/domain/admin/candidates_list/candidate_list_entities.dart';
import 'package:new_app/domain/admin/employees_list/employee_list_entities.dart';

import 'package:new_app/presentation/colors.dart';
import 'package:new_app/presentation/providers.dart';
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

  List<Candidate> candidates = [];
  List<Employee> employes = [];

  @override
  void initState() {
    super.initState();
    refresh();
  }

  Future<void> refresh() async {
    candidates = await candidateListRepository.getCandidates();
    employes = await employeeListRepository.getEmployees();
    if (mounted) setState(() {});
  }

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
              if (currentTab == 0)
                for (final employee in employes) ...[
                  const SizedBox(height: 16),
                  UserCard(
                    name: employee.name,
                    email: employee.email,
                    points: employee.points
                        .map((key, value) => MapEntry(key.name, value)),
                  ),
                ]
              else
                for (final candidate in candidates) ...[
                  const SizedBox(height: 16),
                  UserCard(
                    name: candidate.name,
                    email: candidate.email,
                    points: candidate.points
                        .map((key, value) => MapEntry(key.name, value)),
                  ),
                ],
            ],
          ),
        ),
      ),
    );
  }
}

class UserCard extends StatefulWidget {
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
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => expanded = !expanded),
      child: Container(
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
                      Text(widget.name, style: bodyStyle14),
                      Text(widget.email, style: hintStyle14),
                    ],
                  ),
                ),
                const Text('150', style: headerStyle21),
              ],
            ),
            if (expanded) ...[
              if (widget.points.entries.isNotEmpty) const SizedBox(height: 15),
              for (final p in widget.points.entries) ...[
                Row(
                  children: [
                    Text('${p.key}:', style: hintStyle14),
                    const SizedBox(width: 6),
                    Text(p.value.toString(), style: bodyStyle14),
                  ],
                ),
                const SizedBox(height: 5),
              ],
            ]
          ],
        ),
      ),
    );
  }
}
