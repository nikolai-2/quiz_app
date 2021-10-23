import 'package:flutter/material.dart';

class QuizIconButton extends StatelessWidget {
  final String assetPath;

  const QuizIconButton({
    Key? key,
    required this.assetPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Image(
        image: AssetImage(assetPath),
        height: 40,
        fit: BoxFit.fill,
      ),
    );
  }
}
