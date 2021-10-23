import 'package:flutter/material.dart';
import 'package:new_app/colors.dart';
import 'package:new_app/text_styles.dart';

class RoudedInkWell extends StatelessWidget {
  final String label;
  final IconData icon;

  const RoudedInkWell({
    Key? key,
    required this.label,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: quizGrey,
          ),
        ),
        height: 50,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: hintStyle,
              ),
              Icon(
                icon,
                color: quizGrey,
              )
            ],
          ),
        ),
      ),
    );
  }
}
