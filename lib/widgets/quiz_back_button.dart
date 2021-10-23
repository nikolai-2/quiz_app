import 'package:flutter/material.dart';
import 'package:new_app/text_styles.dart';

class QuizBackButton extends StatelessWidget {
  const QuizBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.pop(context);
      },
      child: const Center(child: Text('Назад', style: labelStyle)),
    );
  }
}
