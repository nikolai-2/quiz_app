import 'package:flutter/material.dart';
import 'package:new_app/presentation/colors.dart';
import 'package:new_app/presentation/text_styles.dart';
import 'package:new_app/presentation/widgets/continue_button.dart';
import 'package:new_app/presentation/widgets/quiz_back_button.dart';
import 'package:new_app/presentation/widgets/quiz_text_field.dart';
import 'package:new_app/presentation/widgets/rounded_ink_well.dart';

class EditResultPage extends StatelessWidget {
  const EditResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(padding: EdgeInsets.symmetric(vertical: 30)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Редактирование\nответа', style: headerStyle),
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
            const Text('Ответ', style: labelStyle),
            const Padding(padding: EdgeInsets.only(top: 10)),
            const QuizInputField(hintText: 'Введите ответ'),
            const Padding(padding: EdgeInsets.only(top: 10)),
            const Text('Метрики', style: labelStyle),
            const Padding(padding: EdgeInsets.only(top: 10)),
            const _SpecialSecretWidget(
              text: 'Уверенность',
              points: 50,
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            RoundedInkWell(
              label: 'Добавить отчет',
              icon: Icons.add_outlined,
              onTap: () {},
            ),
            const Spacer(),
            Row(
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
            const Padding(padding: EdgeInsets.only(top: 36)),
          ],
        ),
      ),
    );
  }
}

class _SpecialSecretWidget extends StatelessWidget {
  final int points;
  final String text;

  const _SpecialSecretWidget({
    Key? key,
    required this.text,
    required this.points,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: quizGrey,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Text(
              text,
              style: const TextStyle(color: quizGrey, fontSize: 16),
            ),
          ),
          const Spacer(),
          const Padding(padding: EdgeInsets.only(left: 5)),
          GestureDetector(
            child: const Icon(
              Icons.remove_outlined,
              color: quizGrey,
            ),
          ),
          const Padding(padding: EdgeInsets.only(left: 5)),
          Text(
            '$points',
            style: const TextStyle(color: Colors.white, fontSize: 25),
          ),
          const Padding(padding: EdgeInsets.only(left: 5)),
          GestureDetector(
            child: const Icon(
              Icons.add_outlined,
              color: quizGrey,
            ),
          ),
          const Padding(padding: EdgeInsets.only(left: 5)),
        ],
      ),
    );
  }
}
