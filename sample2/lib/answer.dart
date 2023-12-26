import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectedHandler;
  final String answerText;

  Answer(this.selectedHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: selectedHandler,
        child: Text(answerText),
        style: ElevatedButton.styleFrom(
          primary: const Color(0xFF504484),
        ),
      ),
    );
  }
}
