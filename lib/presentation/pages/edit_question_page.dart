import 'package:flutter/material.dart';
import 'package:new_app/presentation/pages/edit_result_page.dart';
import 'package:new_app/presentation/route.dart';
import 'package:new_app/presentation/text_styles.dart';
import 'package:new_app/presentation/widgets/continue_button.dart';
import 'package:new_app/presentation/widgets/quiz_back_button.dart';
import 'package:new_app/presentation/widgets/quiz_text_field.dart';
import 'package:new_app/presentation/widgets/rounded_ink_well.dart';

class EditQuestionPage extends StatelessWidget {
  const EditQuestionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 27),
                child: Center(
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 550),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Padding(
                            padding: EdgeInsets.symmetric(vertical: 30)),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Редактирование\nвопроса',
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
                        const Padding(padding: EdgeInsets.only(top: 47)),
                        const Text('Вопрос', style: labelStyle),
                        const Padding(padding: EdgeInsets.only(top: 10)),
                        const QuizInputField(
                            hintText: 'Введите название вопроса'),
                        const Padding(padding: EdgeInsets.only(top: 10)),
                        const QuizInputField(hintText: 'Введите вопрос'),
                        const Padding(padding: EdgeInsets.only(top: 10)),
                        const Text('Ответы', style: labelStyle),
                        const Padding(padding: EdgeInsets.only(top: 10)),
                        RoundedInkWell(
                          label: 'до 70.000 рублей',
                          icon: Icons.arrow_forward_outlined,
                          onTap: () => Navigator.of(context).push(
                            route(const EditResultPage()),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(top: 10)),
                        RoundedInkWell(
                          label: 'Добавить отчет',
                          icon: Icons.add_outlined,
                          onTap: () => Navigator.of(context).push(
                            route(const EditResultPage()),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            Container(
              height: 60,
              margin: const EdgeInsets.symmetric(horizontal: 27),
              constraints: const BoxConstraints(maxWidth: 550),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
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
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 36)),
          ],
        ),
      ),
    );
  }
}
