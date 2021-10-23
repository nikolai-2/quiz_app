import 'package:flutter/material.dart';
import 'package:new_app/pages/admin_page/admin_page.dart';
import 'package:new_app/route.dart';
import 'package:new_app/widgets/continue_button.dart';
import 'package:new_app/widgets/quiz_text_field.dart';
import 'package:new_app/text_styles.dart';

class AdminLoginPage extends StatelessWidget {
  const AdminLoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 27),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text('Добро\nпожаловать', style: headerStyle),
                const SizedBox(height: 35),
                const Text(
                  'Введите ваш E-Mail и пароль, чтобы авторизоваться в панели администратора',
                  style: hintStyle,
                ),
                const SizedBox(height: 58),
                const QuizInputField(
                  hintText: 'Введите E-Mail',
                ),
                const SizedBox(height: 10),
                const QuizInputField(
                  hintText: 'Введите пароль',
                  obscureText: true,
                ),
                const SizedBox(height: 40),
                Align(
                  alignment: Alignment.centerRight,
                  child: ContinueButton(
                    onTap: () => Navigator.of(context).push(
                      route(const AdminPage()),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
