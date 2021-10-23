import 'package:flutter/material.dart';
import 'package:new_app/pages/admin_page/tabs/edit_tests_tab.dart';
import 'package:new_app/pages/admin_page/tabs/generate_test_tab.dart';
import 'package:new_app/pages/admin_page/tabs/results_tab.dart';
import 'package:new_app/widgets/quiz_icon_button.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  var currentTab = 0;

  Widget _buildTab() {
    switch (currentTab) {
      case 0:
        return const GenerateTestTab();
      case 1:
        return const ResultsTab(name: 'Евгений');
      case 2:
        return const GenerateTestTab();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: _buildTab()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              QuizIconButton(assetPath: 'assets/icons/gear.png'),
              Padding(padding: EdgeInsets.symmetric(horizontal: 24)),
              QuizIconButton(assetPath: 'assets/icons/list.png'),
              Padding(padding: EdgeInsets.symmetric(horizontal: 24)),
              QuizIconButton(assetPath: 'assets/icons/plus.png'),
            ],
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
        ],
      ),
    );
  }
}
