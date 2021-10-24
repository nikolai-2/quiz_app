import 'package:flutter/material.dart';
import 'package:new_app/presentation/colors.dart';
import 'package:new_app/presentation/text_styles.dart';
import 'package:new_app/presentation/widgets/quiz_segmentation_tab.dart';
import 'package:new_app/presentation/widgets/rounded_ink_well.dart';
import 'package:new_app/widgets/drop_down_button.dart';

class GenerateTestTab extends StatefulWidget {
  const GenerateTestTab({Key? key}) : super(key: key);

  @override
  State<GenerateTestTab> createState() => _GenerateTestTabState();
}

class _GenerateTestTabState extends State<GenerateTestTab> {
  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
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
              const QuizDropdownButton(
                items: ['xyiiii', 'kek'],
                hint: 'Выберите тест',
                selectedIndex: null,
              ),
              const SizedBox(height: 16),
              const QuizDropdownButton(
                items: ['xyiiii', 'kek'],
                hint: 'Выберите сотрудника',
                selectedIndex: null,
              ),
              const Padding(padding: EdgeInsets.only(top: 72)),
              InkWell(
                onTap: () {},
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
                      'Сгенерировать текст',
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
