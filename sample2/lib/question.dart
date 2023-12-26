import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20),
      child: Text(questionText,
        style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
        textAlign: TextAlign.center,
      ),
    );
  }
}
