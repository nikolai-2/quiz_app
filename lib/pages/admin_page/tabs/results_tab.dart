import 'package:flutter/material.dart';

class ResultsTab extends StatelessWidget {
  final String name;

  const ResultsTab({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 27),
      child: Column(
        children: [
          Text('Здравствуйте,\n$name'),
          // тут я тоже не помню как реализовывать выезжающий список
          // + тут надо тянуть Map<String, int> с именами и баллами,
          // но этого пока что нет
        ],
      ),
    );
  }
}
