import 'package:flutter/material.dart';
import 'package:new_app/text_styles.dart';
import 'package:new_app/widgets/quiz_text_field.dart';

class EditQuestionPage extends StatelessWidget {
  const EditQuestionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          Text('Редактирование\nвопроса', style: headerStyle),
          QuizInputField(hintText: 'Введите название вопроса'),
          QuizInputField(hintText: 'Введите вопрос'),
          Text('Ответы', style: labelStyle),
        ],
      ),
    );
  }
}
