import 'package:flutter/material.dart';
import 'package:new_app/colors.dart';

class ContinueButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const ContinueButton({
    Key? key,
    this.onTap,
    this.text = 'Готово',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 180,
        minWidth: 180,
        minHeight: 60,
      ),
      child: ElevatedButton(
        onPressed: onTap,
        child: Text(text),
        style: ElevatedButton.styleFrom(
          primary: quizBlue,
          textStyle: const TextStyle(fontSize: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
