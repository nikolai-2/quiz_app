import 'package:flutter/material.dart';
import 'package:new_app/widgets/continue_button.dart';
import 'package:new_app/widgets/quiz_text_field.dart';
import 'package:new_app/text_styles.dart';

class StartPage extends StatelessWidget {
  const StartPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            Spacer(
              flex: 2,
            ),
            Text('Добро\nпожаловать', style: headerStyle),
            SizedBox(height: 35),
            Text(
              'Введите ваш E-Mail и пароль, чтобы авторизоваться в панели администратора',
              style: hintStyle,
            ),
            Spacer(),
            QuizInputField(
              hintText: 'Введите E-Mail',
            ),
            SizedBox(
              height: 10,
            ),
            QuizInputField(
              hintText: 'Введите пароль',
              obscureText: true,
            ),
            Spacer(
              flex: 2,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: ContinueButton(),
            ),
          ],
        ),
      ),
    );
  }
}
