import 'package:flutter/material.dart';
import 'package:new_app/colors.dart';

class ContinueButton extends StatelessWidget {
  final VoidCallback? onTap;

  const ContinueButton({
    Key? key,
    this.onTap,
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
        child: const Text('Далее'),
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
