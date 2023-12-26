import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function() resetHandler;

  Result(this.resultScore,this.resetHandler);

  String get resultPhrase {
    String resultText;
    if(resultScore >= 41) {
      resultText = "Wow! Great job!";
    }else if(resultScore >= 21) {
      resultText = "Pretty likeable!";
    }else if(resultScore >= 1) {
      resultText = "You need to work harder!";
    }else{
      resultText = "This is a poor score!";
    }
    if (kDebugMode) {
      print(resultScore);
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(resultPhrase, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),),
          Text('Score ' '$resultScore', style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),),
          TextButton(
              onPressed: resetHandler,
              child: const Text('Restart Quiz', style: TextStyle(fontSize: 16),)
          )
        ],
      ),
    );
  }
}
