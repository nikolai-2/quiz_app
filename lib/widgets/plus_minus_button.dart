import 'package:flutter/material.dart';
import 'package:new_app/colors.dart';

class PlusMinusButton extends StatelessWidget {
  final String symbol;

  const PlusMinusButton({
    Key? key,
    required this.symbol,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        height: 40,
        width: 40,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            symbol,
            style: const TextStyle(
              color: quizGrey,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
