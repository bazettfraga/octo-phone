import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../lifecycle_manager.dart';
import 'example_page.dart';

//ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  int counter;
  final Function() onPress;

  MyHomePage({Key? key, required this.counter, required this.onPress}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    debugPrint('build() called');
    return LifeCycleManager(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter LIFECYCLE'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('You have pushed the button this many times:'),
              Text('${widget.counter}'),
              ElevatedButton(
                  onPressed: widget.onPress,
                  child: const Text('Reset count')
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => ExamplePage()),
                    );
                  },
                  child: const Text('Navigate to new route'),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment Counter',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
  void _incrementCounter() {
    setState(() {
      widget.counter++;
    });
  }

  @override
  void initState() {
    super.initState();
    debugPrint('Widget Lifecycle: initState');
  }

  @override
  void didChangeDependencies() {
    debugPrint('Widget Lifecycle: didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    debugPrint('Widget Lifecycle: dispose');
    super.dispose();
  }

  @override
  void deactivate() {
    debugPrint('Widget Lifecycle: deactivate');
    super.deactivate();
  }

  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    debugPrint('Widget Lifecycle: didUpdateWidget');

    if(widget.counter != oldWidget.counter) {
      debugPrint('Count has changed!');
    }
  }
}
