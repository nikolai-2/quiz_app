import 'package:flutter/material.dart';
import 'package:new_app/colors.dart';
import 'package:new_app/widgets/conditional_button.dart';
import 'package:new_app/widgets/plus_minus_button.dart';
import 'package:new_app/widgets/quiz_text_field.dart';
import 'package:new_app/text_styles.dart';

class CreateCaterogy extends StatelessWidget {
  final int number;

  const CreateCaterogy({Key? key, required this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27),
        child: Column(
          children: [
            const Text('Создание\nкатегории', style: labelStyle),
            const Text('Название', style: labelStyle),
            const QuizInputField(hintText: 'Введите название категории'),
            const Text('Условие', style: labelStyle),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: quizGrey,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      cursorColor: Colors.white,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: 'Введите что-нибудь...',
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          color: quizGrey,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 20),
                      ),
                      const ConditionalButton(
                        symbol: '>',
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2),
                      ),
                      const ConditionalButton(
                        symbol: '<',
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2),
                      ),
                      const ConditionalButton(
                        symbol: '=',
                      ),
                      const Spacer(),
                      const PlusMinusButton(
                        symbol: '-',
                      ),
                      Text('$number', style: headerStyle),
                      const PlusMinusButton(
                        symbol: '+',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(color: quizGrey, width: 1.0),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 27),
                child: Row(
                  children: [
                    const Text('', style: TextStyle(color: Colors.white)),
                    const Text('меньше', style: TextStyle(color: quizGrey)),
                    const PlusMinusButton(symbol: '-'),
                    Text('$number', style: headerStyle),
                    const PlusMinusButton(symbol: '+'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
