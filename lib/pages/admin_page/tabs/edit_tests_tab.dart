import 'package:flutter/material.dart';
import 'package:new_app/text_styles.dart';
import 'package:new_app/widgets/rounded_ink_well.dart';

class EditTestsTab extends StatelessWidget {
  const EditTestsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 27,
      ),
      child: Column(
        children: const [
          Text(
            'Редактирование и создание тестов',
            style: headerStyle,
          ),
          Text(
            'Категории',
            style: labelStyle,
          ),
          RoudedInkWell(
            label: 'Зайти в существующую',
            icon: Icons.arrow_forward_rounded,
          ),
          RoudedInkWell(
            label: 'Добавить что-либо',
            icon: Icons.add_sharp,
          ),
          Text(
            'Поля',
            style: labelStyle,
          ),
          // тут я не ебу как нормально реализовать
          // список с добавлением новых элементов
        ],
      ),
    );
  }
}
