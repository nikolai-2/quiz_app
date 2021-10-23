import 'package:flutter/material.dart';
import 'package:new_app/text_styles.dart';

class CreateCAterogy extends StatelessWidget {
  const CreateCAterogy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Создание\nкатегории', style: labelStyle,)
        ],
      ),
    );
  }
}