import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:new_app/domain/admin/test_maintain/maintain_test_entities.dart';
import 'package:new_app/presentation/pages/edit_question_page.dart';
import 'package:new_app/presentation/providers.dart';
import 'package:new_app/presentation/route.dart';
import 'package:new_app/presentation/widgets/continue_button.dart';
import 'package:new_app/presentation/widgets/quiz_back_button.dart';
import 'package:new_app/presentation/widgets/quiz_text_field.dart';
import 'package:new_app/presentation/text_styles.dart';
import 'package:new_app/presentation/widgets/rounded_ink_well.dart';

class EditTestPage extends StatefulHookWidget {
  final MaintainableTest? test;

  const EditTestPage({Key? key, this.test}) : super(key: key);

  @override
  State<EditTestPage> createState() => _EditTestPageState();
}

class _EditTestPageState extends State<EditTestPage> {
  final int number = 160;
  late final List<MaintainableQuestion> _questions;

  @override
  void initState() {
    super.initState();
    _questions = widget.test?.questions ?? [];
  }

  void openQuestion(String id) async {
    final question = await maintainQuestionRepository.getQuestion(id);
    Navigator.of(context).push(
      route(EditQuestionPage(question: question)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textController = useTextEditingController(text: widget.test?.name);
    return Scaffold(
      body: Column(
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
                        padding: EdgeInsets.only(top: 60),
                      ),
                      Row(
                        children: [
                          const Text(
                            'Редактирование\nтеста',
                            style: headerStyle,
                          ),
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
                      const Padding(padding: EdgeInsets.only(top: 46)),
                      const Text('Название', style: labelStyle),
                      const Padding(padding: EdgeInsets.only(top: 16)),
                      QuizInputField(
                        hintText: 'Основной текст',
                        controller: textController,
                      ),
                      const Padding(padding: EdgeInsets.only(top: 32)),
                      const Text('Вопросы', style: labelStyle),
                      for (final question in _questions) ...[
                        const Padding(padding: EdgeInsets.only(top: 16)),
                        RoundedInkWell(
                          label: question.name,
                          icon: Icons.arrow_forward_rounded,
                          onTap: () => openQuestion(question.id),
                        ),
                      ],
                      const Padding(padding: EdgeInsets.only(top: 16)),
                      RoundedInkWell(
                        label: 'Добавить вопрос',
                        icon: Icons.add,
                        onTap: () => Navigator.of(context).push(
                          route(const EditQuestionPage(question: null)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
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
          const SizedBox(height: 36),
        ],
      ),
    );
  }
}
