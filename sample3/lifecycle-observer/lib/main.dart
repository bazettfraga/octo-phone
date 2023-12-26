import 'package:flutter/material.dart';
import '../pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0;

  void resetCounter() {
    setState(() {
      counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Lifecycle',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: MyHomePage(
        counter: counter,
        onPress: resetCounter,
      ),
    );

  }
}
