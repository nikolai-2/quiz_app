import 'package:flutter/material.dart';
import 'package:new_app/presentation/text_styles.dart';

class DonePage extends StatelessWidget {
  const DonePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(image: AssetImage('assets/images/rocket.png')),
            SizedBox(height: 35),
            Text(
              'Готово!',
              style: headerStyle,
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 27),
              child: Text(
                'Благодарим за прохождение теста, в случае положительного решения с вами свяжется HR-отдел',
                style: hintStyle,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
