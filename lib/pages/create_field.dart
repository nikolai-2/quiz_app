import 'package:flutter/material.dart';
import 'package:new_app/text_styles.dart';
import 'package:new_app/widgets/quiz_text_field.dart';

class CreateField extends StatelessWidget {
  const CreateField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Создание\nполя', style: headerStyle),
          QuizInputField(
            hintText: 'Введите что-либо',
          ),
        ],
      ),
    );
  }
}