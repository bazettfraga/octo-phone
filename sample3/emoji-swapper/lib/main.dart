import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emoji Swapper',
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Widget> emojis = [
    Container(key: UniqueKey(), child: GetEmoji(emoji: "😎")),
    Container(key: UniqueKey(), child: GetEmoji(emoji: "🤠"))
  ];

  swapEmoji() {
    setState(() {
      emojis.insert(1, emojis.removeAt(0));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: emojis,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: swapEmoji,
                child: const Text('Swap')
            )
          ],
        ),
      ),
    );
  }
}


class GetEmoji extends StatefulWidget {
  String emoji;
  GetEmoji({required this.emoji});

  @override
  _GetEmojiState createState() => _GetEmojiState();
}

class _GetEmojiState extends State<GetEmoji> {
  late String emoji;

  @override
  void initState() {
    super.initState();
    emoji = widget.emoji;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        emoji,
        style: const TextStyle(fontSize: 100),
      ),
      color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
    );
  }
}


