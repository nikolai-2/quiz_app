import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:new_app/domain/admin/test_link_generation/test_link_generation_entities.dart';
import 'package:new_app/presentation/colors.dart';
import 'package:new_app/presentation/providers.dart';
import 'package:new_app/presentation/text_styles.dart';
import 'package:new_app/presentation/widgets/quiz_segmentation_tab.dart';
import 'package:new_app/presentation/widgets/drop_down_button.dart';
import 'package:new_app/presentation/widgets/quiz_text_field.dart';

class GenerateTestTab extends StatefulHookWidget {
  const GenerateTestTab({Key? key}) : super(key: key);

  @override
  State<GenerateTestTab> createState() => _GenerateTestTabState();
}

class _GenerateTestTabState extends State<GenerateTestTab> {
  int currentTab = 0;

  List<TestLinkTest> tests = [];
  List<Employee> employes = [];
  List<Candidate> candidates = [];

  int? selectedCandidate;
  int? selectedEmployee;
  int? selectedTest;

  @override
  void initState() {
    super.initState();
    refresh();
  }

  Future<void> refresh() async {
    tests = await testLinkGenerationRepository.getAvailableTests();
    employes = await testLinkGenerationRepository.getEmployesForTesting();
    candidates = await testLinkGenerationRepository.getCandidatesForTesting();
    if (mounted) setState(() {});
  }

  Future<void> generate(String newCandidateName) async {
    if (currentTab == 0) {
      if (selectedEmployee == null || selectedTest == null) return;
      await testLinkGenerationRepository.generateTestForEmployee(
        tests[selectedTest!].id,
        employes[selectedEmployee!].id,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Ссылка скопирована',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.green,
        ),
      );
    } else if (currentTab == 1) {
      if (selectedCandidate == null || selectedTest == null) return;
      if (selectedCandidate == 0) {
        await testLinkGenerationRepository.generateTestForNewCandidate(
          tests[selectedTest!].id,
          newCandidateName,
        );
      } else {
        await testLinkGenerationRepository.generateTestForCandidate(
          tests[selectedTest!].id,
          employes[selectedEmployee!].id,
        );
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Ссылка скопирована',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final nameController = useTextEditingController();
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 27),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 460),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(padding: EdgeInsets.only(top: 60)),
              const Text(
                'Генерация\nссылки',
                style: headerStyle,
              ),
              const Padding(padding: EdgeInsets.only(top: 25)),
              QuizSegmentationTab(
                values: const ['Сотрудники', 'Кандидаты'],
                onSelected: (i) => setState(() => currentTab = i),
                selected: currentTab,
              ),
              const SizedBox(height: 16),
              QuizDropdownButton(
                items: tests.map((e) => e.name).toList(),
                hint: 'Выберите тест',
                onChanged: (i) => setState(() => selectedTest = i),
                selectedIndex: selectedTest,
              ),
              const SizedBox(height: 16),
              if (currentTab == 0) ...[
                QuizDropdownButton(
                  items: employes.map((e) => e.name).toList(),
                  hint: 'Выберите сотрудника',
                  onChanged: (i) => setState(() => selectedEmployee = i),
                  selectedIndex: selectedEmployee,
                ),
              ] else ...[
                QuizDropdownButton(
                  items: employes.map((e) => e.name).toList(),
                  hint: 'Выберите кандидата',
                  onChanged: (i) => setState(() => selectedEmployee = i),
                  selectedIndex: selectedEmployee,
                ),
                if (selectedCandidate == 0) ...[
                  const SizedBox(height: 16),
                  QuizInputField(
                    hintText: 'Введите имя',
                    controller: nameController,
                  ),
                ],
              ],
              const Padding(padding: EdgeInsets.only(top: 72)),
              InkWell(
                onTap: () => generate(nameController.text),
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  decoration: BoxDecoration(
                    color: quizBlue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 60,
                  width: double.infinity,
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Сгенерировать тест',
                      style: labelStyle,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
