import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:new_app/presentation/colors.dart';
import 'package:new_app/presentation/text_styles.dart';

class QuizSegmentationTab extends StatelessWidget {
  final List<String> values;
  final ValueChanged<int> onSelected;
  final int selected;

  const QuizSegmentationTab({
    Key? key,
    required this.values,
    required this.onSelected,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: quizGrey),
      ),
      child: CupertinoSlidingSegmentedControl<int>(
        onValueChanged: (i) => onSelected(i!),
        backgroundColor: Colors.transparent,
        thumbColor: const Color(0xFF252B49),
        groupValue: selected,
        children: {
          for (var i = 0; i < values.length; i++)
            i: SizedBox(
              height: 42,
              child: Center(
                child: Text(values[i], style: bodyStyle),
              ),
            ),
        },
      ),
    );
  }
}
