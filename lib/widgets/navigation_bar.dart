import 'package:flutter/material.dart';

class QuizNavigationBar extends StatelessWidget {
  const QuizNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        _QuizIconButton(assetPath: 'assets/icons/gear.png'),
        Padding(padding: EdgeInsets.symmetric(horizontal: 24)),
        _QuizIconButton(assetPath: 'assets/icons/list.png'),
        Padding(padding: EdgeInsets.symmetric(horizontal: 24)),
        _QuizIconButton(assetPath: 'assets/icons/plus.png'),
      ],
    );
  }
}

class _QuizIconButton extends StatelessWidget {
  final String assetPath;

  const _QuizIconButton({
    Key? key, required this.assetPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Image(
        image: AssetImage(assetPath),
        height: 30,
        fit: BoxFit.fill,
      ),
    );
  }
}