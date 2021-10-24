import 'package:flutter/material.dart';
import 'package:new_app/presentation/text_styles.dart';
import 'package:new_app/presentation/widgets/rounded_ink_well.dart';

class QuizDropdownButton extends StatelessWidget {
  final List<String> items;
  final int? selectedIndex;
  final String hint;

  const QuizDropdownButton({
    Key? key,
    required this.items,
    required this.selectedIndex,
    required this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, cnstr) {
      return DropdownButton<int?>(
        items: [
          const DropdownMenuItem(
            child: Text('Выберите из списка:', style: bodyStyle),
            value: -1,
            enabled: false,
          ),
          for (var i = 0; i < items.length; i++)
            DropdownMenuItem(
              child: Text(items[i], style: bodyStyle),
              value: i,
            ),
        ],
        value: selectedIndex ?? -1,
        underline: const SizedBox(),
        icon: const SizedBox(),
        onChanged: (_) {},
        dropdownColor: const Color(0xFF252B49),
        borderRadius: BorderRadius.circular(15),
        selectedItemBuilder: (ctx) => [
          SizedBox(
            width: cnstr.maxWidth,
            child: RoundedInkWell(
              label: hint,
              icon: Icons.keyboard_arrow_down,
            ),
          ),
          for (var i = 0; i < items.length; i++)
            SizedBox(
              width: cnstr.maxWidth,
              child: RoundedInkWell(
                label: items[i],
                icon: Icons.keyboard_arrow_down,
              ),
            ),
        ],
      );
    });
  }
}
