import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:new_app/domain/admin/answer_maintain/maintain_answer_entities.dart';
import 'package:new_app/domain/admin/question_maintain/maintain_question_entities.dart';
import 'package:new_app/presentation/pages/edit_answer_page.dart';
import 'package:new_app/presentation/providers.dart';
import 'package:new_app/presentation/route.dart';
import 'package:new_app/presentation/text_styles.dart';
import 'package:new_app/presentation/widgets/continue_button.dart';
import 'package:new_app/presentation/widgets/quiz_back_button.dart';
import 'package:new_app/presentation/widgets/quiz_text_field.dart';
import 'package:new_app/presentation/widgets/rounded_ink_well.dart';

class EditQuestionPage extends StatefulHookWidget {
  final MaintainableQuestion? question;

  const EditQuestionPage({Key? key, required this.question}) : super(key: key);

  @override
  State<EditQuestionPage> createState() => _EditQuestionPageState();
}

class _EditQuestionPageState extends State<EditQuestionPage> {
  late final List<MaintainableQuestionAnswer> _answers;

  @override
  void initState() {
    super.initState();
    _answers = widget.question?.answers ?? [];
  }

  void openAnswer(String? id) async {
    final answer =
        id == null ? null : await maintainAnswerRepository.getAnswer(id);
    final outAnswer = await Navigator.of(context).push(
      route(EditAnswerPage(answer: answer)),
    ) as MaintainableAnswer?;
    if (outAnswer == null) return;
    _answers.add(MaintainableQuestionAnswer(
      id: outAnswer.id,
      text: outAnswer.text,
    ));
  }

  Future<void> save(String name, String text) async {
    final res = MaintainableQuestion(
      id: widget.question?.id ?? newId(),
      name: name,
      text: text,
      answers: _answers,
    );
    await maintainQuestionRepository.saveQuestion(res);
    Navigator.of(context).pop(res);
  }

  @override
  Widget build(BuildContext context) {
    final nameController =
        useTextEditingController(text: widget.question?.name);
    final textController =
        useTextEditingController(text: widget.question?.text);
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
                          padding: EdgeInsets.symmetric(vertical: 30),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Редактирование\nвопроса',
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
                        const Padding(padding: EdgeInsets.only(top: 47)),
                        const Text('Вопрос', style: labelStyle),
                        const Padding(padding: EdgeInsets.only(top: 10)),
                        QuizInputField(
                          hintText: 'Введите название вопроса',
                          controller: nameController,
                        ),
                        const Padding(padding: EdgeInsets.only(top: 10)),
                        QuizInputField(
                          hintText: 'Введите вопрос',
                          controller: textController,
                        ),
                        const Padding(padding: EdgeInsets.only(top: 10)),
                        const Text('Ответы', style: labelStyle),
                        const Padding(padding: EdgeInsets.only(top: 10)),
                        for (final answer in _answers)
                          RoundedInkWell(
                            label: answer.text,
                            icon: Icons.arrow_forward_outlined,
                            onTap: () => openAnswer(answer.id),
                          ),
                        const Padding(padding: EdgeInsets.only(top: 10)),
                        RoundedInkWell(
                          label: 'Добавить отчет',
                          icon: Icons.add_outlined,
                          onTap: () => openAnswer(null),
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
                    onTap: () => save(nameController.text, textController.text),
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
