import 'package:flutter/material.dart';
import 'package:new_app/text_styles.dart';
import 'package:new_app/widgets/quiz_text_field.dart';

class EditField extends StatelessWidget {
  const EditField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          Text('Создание\nполя', style: headerStyle),
          QuizInputField(
            hintText: 'Введите что-либо',
          ),
        ],
      ),
    );
  }
}
