import 'package:flutter/material.dart';
import 'package:new_app/pages/end_page.dart';
import 'package:new_app/pages/start_page.dart';

import 'pages/quiz_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FaceMask',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(18, 23, 48, 1),
        primarySwatch: Colors.blue,
        // scaffoldBackgroundColor:
      ),
      home: const QuizPage(),
    );
  }
}
