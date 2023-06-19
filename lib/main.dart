import 'package:flutter/material.dart';

void main() {
  runApp(const CounterApp());
}

class CounterApp extends StatefulWidget {
  const CounterApp({Key? key}) : super(key: key);

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      if (_counter ==5) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                  title: const Text('Alert'),
                  content: const Text('Congratulations! You reached 10!'),
                  actions: [
                  TextButton(
                  onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
              ),
              ],
              );



      }

      else if (_counter == 10) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondPage()));
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Counter App'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Counter Value:',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                '$_counter',
                style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2, // Increase the flex value for the increment button
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.green),
                      ),
                      onPressed: _incrementCounter,
                      child: const Text('Increment'),
                    ),
                  ),
                  const SizedBox(width: 16), // Add some spacing between the buttons
                  Expanded(
                    flex: 1, // Keep the default flex value for the decrement button
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                      ),
                      onPressed: _decrementCounter,
                      child: const Text('Decrement'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
