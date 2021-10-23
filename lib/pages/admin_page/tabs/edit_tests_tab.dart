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
            children: [
              const Text(
                'Редактирование и создание тестов',
                style: headerStyle,
              ),
              const Text(
                'Категории',
                style: labelStyle,
              ),
              const RoundedInkWell(
                label: 'Зайти в существующую',
                icon: Icons.arrow_forward_rounded,
              ),
              RoundedInkWell(
                label: 'Добавить что-либо',
                icon: Icons.add_sharp,
                onTap: () => Navigator.of(context).push(
                  route(const EditCaterogy()),
                ),
              ),
              const Text(
                'Поля',
                style: labelStyle,
              ),
              const RoundedInkWell(
                label: 'Зайти в существующую',
                icon: Icons.arrow_forward_rounded,
              ),
              RoundedInkWell(
                label: 'Добавить что-либо',
                icon: Icons.add_sharp,
                onTap: () => Navigator.of(context).push(
                  route(const EditField()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
