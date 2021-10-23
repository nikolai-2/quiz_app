import 'package:flutter/material.dart';
import 'package:new_app/colors.dart';
import 'package:new_app/text_styles.dart';

class ConditionalButton extends StatelessWidget {
  final String symbol;

  const ConditionalButton({
    Key? key,
    required this.symbol,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: quizGrey,
            ),
          ),
          height: 40,
          width: 40,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              symbol,
              style: headerStyle,
            ),
          ),
        ),
      ),
    );
  }
}
