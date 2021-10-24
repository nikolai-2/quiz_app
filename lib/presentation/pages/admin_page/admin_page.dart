import 'package:flutter/material.dart';
import 'package:new_app/presentation/pages/admin_page/tabs/edit_tests_tab.dart';
import 'package:new_app/presentation/pages/admin_page/tabs/generate_test_tab.dart';
import 'package:new_app/presentation/pages/admin_page/tabs/results_tab.dart';
import 'package:new_app/presentation/widgets/quiz_bottom_nav_bar_button.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  var _currentTab = 0;

  Widget _buildTab() {
    switch (_currentTab) {
      case 0:
        return const EditTestsTab();
      case 1:
        return const ResultsTab();
      case 2:
        return const GenerateTestTab();
      default:
        throw Exception('Unknown tab');
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
            children: [
              QuizBottomNavigationBarButton(
                assetPath: 'assets/icons/gear.png',
                selected: _currentTab == 0,
                onTap: () => setState(() => _currentTab = 0),
              ),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 24)),
              QuizBottomNavigationBarButton(
                assetPath: 'assets/icons/list.png',
                selected: _currentTab == 1,
                onTap: () => setState(() => _currentTab = 1),
              ),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 24)),
              QuizBottomNavigationBarButton(
                assetPath: 'assets/icons/plus.png',
                selected: _currentTab == 2,
                onTap: () => setState(() => _currentTab = 2),
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
        ],
      ),
    );
  }
}
