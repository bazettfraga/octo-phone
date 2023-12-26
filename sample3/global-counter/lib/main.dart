import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Global Key Counter',
      theme: ThemeData(
        primarySwatch: Colors.purple
      ),
      home: const MyHomePage(title: 'Global Key Demo',),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _counterState = GlobalKey<_CounterState>(); //Declare the GlobalKey of CounterState

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Counter(
              key: _counterState,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SecondPage(_counterState))
                );
              },
              child: const Text('Second Page')
          )
        ],
      ),
    );
  }
}






class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  late int count;

  @override
  void initState() {
    super.initState();
    count = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(count.toString(), style: const TextStyle(fontSize: 30),),
        ElevatedButton(
            onPressed: () {
              setState(() {
                count++;
              });
            },
            child: const Text('Add'),
        )
      ],
    );
  }
}




class SecondPage extends StatefulWidget {
  final GlobalKey<_CounterState> counterKey;
  SecondPage(this.counterKey);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Builder(
        builder: (ctx) {
          return Center(
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                          if(widget.counterKey.currentState != null) {
                            widget.counterKey.currentState!.setState(() {
                              widget.counterKey.currentState!.count++; //here
                              debugPrint(widget.counterKey.currentState!.count.toString());
                            });
                          }
                      });
                    },
                    icon: const Icon(Icons.add)
                ),
                Text(
                  widget.counterKey.currentState!.count.toString(),
                  style: const TextStyle(fontSize: 50),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}







