import 'package:flutter/material.dart';
import 'package:new_app/colors.dart';
import 'package:new_app/text_styles.dart';
import 'package:new_app/widgets/rounded_ink_well.dart';

class QuizDropdownButton extends StatelessWidget {
  final List<String> items;
  final int selectedIndex;

  const QuizDropdownButton({
    Key? key,
    required this.items,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, cnstr) {
      return DropdownButton(
        items: [
          for (var i = 0; i < items.length; i++)
            DropdownMenuItem(
              child: Text(items[i], style: bodyStyle),
              value: i,
            ),
        ],
        value: selectedIndex,
        underline: const SizedBox(),
        icon: const SizedBox(),
        onChanged: (_) {},
        dropdownColor: const Color(0xFF252B49),
        borderRadius: BorderRadius.circular(15),
        selectedItemBuilder: (ctx) => [
          for (var i = 0; i < items.length; i++)
            SizedBox(
              width: cnstr.maxWidth,
              child: const RoundedInkWell(
                label: 'Выберите тест',
                icon: Icons.keyboard_arrow_down,
              ),
            ),
        ],
      );
    });
  }
}
