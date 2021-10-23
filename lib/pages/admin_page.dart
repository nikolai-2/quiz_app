import 'package:flutter/material.dart';
import 'package:new_app/colors.dart';
import 'package:new_app/text_styles.dart';
import 'package:new_app/widgets/navigation_bar.dart';
import 'package:new_app/widgets/quiz_text_field.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27),
        child: Column(
          children: [
            const Spacer(),
            const QuizInputField(hintText: 'Введите Имя'),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(10),
              child: Container(
                decoration: BoxDecoration(
                  color: quizBlue,
                  borderRadius: BorderRadius.circular(10)
                ),
                height: 60,
                width: double.infinity,
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Сгенерировать текст',
                    style: labelStyle,
                  ),
                )
              ),
            ),
            const Spacer(),
            const QuizNavigationBar(),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
          ],
        ),
      ),
    );
  }
}