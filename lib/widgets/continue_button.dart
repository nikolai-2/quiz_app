import 'package:flutter/material.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: 180,
      height: 90,
      child: ElevatedButton(
        onPressed: () {},
        child: const Text('Далее'),
        style: ElevatedButton.styleFrom(
          primary: const Color.fromRGBO(5, 211, 246, 1),
          textStyle: const TextStyle(fontSize: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          )
        ),
      ),
    );
  }
}

