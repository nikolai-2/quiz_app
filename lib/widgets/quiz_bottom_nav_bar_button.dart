import 'package:flutter/material.dart';

class QuizBottomNavigationBarButton extends StatelessWidget {
  final String assetPath;
  final bool selected;
  final VoidCallback onTap;

  const QuizBottomNavigationBarButton({
    Key? key,
    required this.assetPath,
    this.selected = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Image(
        image: AssetImage(assetPath),
        height: 40,
        fit: BoxFit.fill,
        color: selected ? Colors.white : null,
      ),
    );
  }
}
