import 'package:flutter/material.dart';
import 'package:new_app/pages/edit_test_page.dart';
import 'package:new_app/pages/edit_field_page.dart';
import 'package:new_app/route.dart';
import 'package:new_app/text_styles.dart';
import 'package:new_app/widgets/rounded_ink_well.dart';

class EditTestsTab extends StatelessWidget {
  const EditTestsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 27),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 700),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(padding: EdgeInsets.symmetric(vertical: 30)),
              const Text(
                'Редактирование и создание тестов',
                style: headerStyle,
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
              const Text(
                'Тесты',
                style: labelStyle,
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
              const RoundedInkWell(
                label: 'Основной тест',
                icon: Icons.arrow_forward_rounded,
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
              RoundedInkWell(
                label: 'Добавить тест',
                icon: Icons.add_sharp,
                onTap: () => Navigator.of(context).push(
                  route(const EditTestPage()),
                ),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
              const Text(
                'Метрики',
                style: labelStyle,
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
              const RoundedInkWell(
                label: 'Логика',
                icon: Icons.arrow_forward_rounded,
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
              RoundedInkWell(
                label: 'Добавить метрику',
                icon: Icons.add_sharp,
                onTap: () => Navigator.of(context).push(
                  route(const EditFieldPage()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
