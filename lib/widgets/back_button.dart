import 'package:flutter/material.dart';
import 'package:new_app/text_styles.dart';

class BackButton extends StatelessWidget {
  const BackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: const Text('Назад', style: labelStyle),
    );
  }
}