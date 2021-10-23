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
    return Container(
      padding: const EdgeInsets.all(15),
      width: 180,
      height: 90,
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
