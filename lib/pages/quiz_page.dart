import 'package:flutter/material.dart';
import 'package:new_app/colors.dart';
import 'package:new_app/text_styles.dart';

import '../widgets/continue_button.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  static const tabsCount = 20;
  var selectedTab = 0;
  int? selectedOption;

  Color tabColor(int tab) {
    if (tab == selectedTab) return Colors.white;
    if (tab < selectedTab) return Colors.green;
    return quizGrey;
  }

  Widget xyi({bool bolshoi = false, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border:
              Border.all(color: bolshoi ? const Color(0xFF2A7F7A) : quizGrey),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            const SizedBox(width: 20),
            Text(
              'Вариант ответа',
              style: hintStyle.copyWith(
                  color: bolshoi ? const Color(0xFF14C59C) : null),
            ),
            const Spacer(),
            Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: bolshoi ? null : Border.all(color: quizGrey),
                color: bolshoi ? const Color(0xFF10C59A) : null,
              ),
              child: bolshoi
                  ? const Icon(
                      Icons.check,
                      size: 12,
                      color: Colors.white,
                    )
                  : null,
            ),
            const SizedBox(width: 15),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          padding: const EdgeInsets.symmetric(horizontal: 27),
          child: ListView(
            children: [
              const SizedBox(height: 74),
              const Text(
                'Общие вопросы',
                style: hintStyle,
              ),
              const SizedBox(height: 14),
              const Text('Вопрос 01', style: headerStyle),
              const SizedBox(height: 28),
              Row(
                children: [
                  for (var i = 0; i < tabsCount; i++)
                    Expanded(
                      child: Container(
                        color: tabColor(i),
                        height: 2,
                        margin: const EdgeInsets.only(right: 4),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 28),
              SizedBox(
                height: 140,
                child: Text(
                  'Попа пися попа кака пися попа кака писяпися' * 100,
                  style: bodyStyle,
                  maxLines: 7,
                ),
              ),
              const SizedBox(height: 48),
              for (var i = 0; i < 4; i++) ...[
                xyi(
                  bolshoi: selectedOption == i,
                  onTap: () => setState(
                    () => selectedOption = i,
                  ),
                ),
                const SizedBox(height: 15),
              ],
              const SizedBox(height: 28),
              Align(
                alignment: Alignment.centerRight,
                child: ContinueButton(
                  onTap: () => setState(() {
                    selectedTab++;
                    selectedOption = null;
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
