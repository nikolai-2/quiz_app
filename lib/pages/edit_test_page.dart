import 'package:flutter/material.dart';
import 'package:new_app/colors.dart';
import 'package:new_app/widgets/conditional_button.dart';
import 'package:new_app/widgets/continue_button.dart';
import 'package:new_app/widgets/plus_minus_button.dart';
import 'package:new_app/widgets/quiz_back_button.dart';
import 'package:new_app/widgets/quiz_text_field.dart';
import 'package:new_app/text_styles.dart';
import 'package:new_app/widgets/rounded_ink_well.dart';

class EditTestPage extends StatelessWidget {
  final int number = 100;

  const EditTestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 700),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 30),
                        ),
                        Row(
                          children: [
                            const Text('Редактирование\nтеста',
                                style: headerStyle),
                            const Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.delete_outline_outlined,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                          ],
                        ),
                        const Padding(padding: EdgeInsets.only(top: 50)),
                        const Text('Название', style: labelStyle),
                        const Padding(padding: EdgeInsets.only(top: 10)),
                        const QuizInputField(hintText: 'Основной текст'),
                        const Padding(padding: EdgeInsets.only(top: 10)),
                        const Text('Вопрос', style: labelStyle),
                        const Padding(padding: EdgeInsets.only(top: 10)),
                        RoundedInkWell(
                          label: 'Про зарплату',
                          icon: Icons.arrow_forward_rounded,
                          onTap: () {},
                        ),
                        const Padding(padding: EdgeInsets.only(top: 10)),
                        RoundedInkWell(
                          label: 'Добавить вопрос',
                          icon: Icons.add,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 19),
                  child: QuizBackButton(),
                ),
                const Spacer(),
                ContinueButton(
                  onTap: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
