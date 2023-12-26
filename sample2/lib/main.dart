import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'quiz.dart';
import 'result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('UACS Quiz App'),
          backgroundColor: const Color(0xFF29176b),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: _questionIndex < _questions.length ?
          Quiz(_questions, _questionIndex, _answerQuestion)
          :
          Result(_totalScore, _resetQuiz),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    if (kDebugMode) {
      print(_questionIndex);
      if(_questionIndex < _questions.length){
        print('We have more questions');
      }else{
        print('No more questions!');
      }
    }
  }

  final _questions = [
    {
      'questionText' : 'Q1. Who created Flutter?',
      'answers' : [
        { 'text' : 'Microsoft', 'score' : -2 },
        { 'text' : 'Apache', 'score' : -2 },
        { 'text' : 'Google', 'score' : 10 },
        { 'text' : 'Twitter', 'score' : -2 },
      ]
    },
    {
      'questionText' : 'Q2. Flutter is a?',
      'answers' : [
        { 'text' : 'Programming Language', 'score' : -2 },
        { 'text' : 'SDK', 'score' : 10 },
        { 'text' : 'Both', 'score' : -2 },
        { 'text' : 'None of the above', 'score' : -2 },
      ]
    },
    {
      'questionText' : 'Q3. Which programming language is used by Flutter?',
      'answers' : [
        { 'text' : 'C', 'score' : -2 },
        { 'text' : 'Dart', 'score' : 10 },
        { 'text' : 'C++', 'score' : -2 },
        { 'text' : 'Swift', 'score' : -2 },
      ]
    },
    {
      'questionText' : 'Q4. How many types of widgets are there in Flutter?',
      'answers' : [
        { 'text' : '2', 'score' : 10 },
        { 'text' : '3', 'score' : -2 },
        { 'text' : '4', 'score' : -2 },
        { 'text' : '5', 'score' : -2 },
      ]
    },
    {
      'questionText' : 'Q5. Is Flutter for Web and Desktop available in stable version?',
      'answers' : [
        { 'text' : 'Yes', 'score' : 10 },
        { 'text' : 'No', 'score' : -2 },
      ]
    }
  ];
}

