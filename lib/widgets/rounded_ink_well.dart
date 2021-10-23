import 'package:flutter/material.dart';
import 'package:new_app/colors.dart';
import 'package:new_app/text_styles.dart';

class RoundedInkWell extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback? onTap;

  const RoundedInkWell({
    Key? key,
    required this.label,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
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
              Text(label, style: hintStyle),
              Icon(icon, color: quizGrey),
            ],
          ),
        ),
      ),
    );
  }
}
