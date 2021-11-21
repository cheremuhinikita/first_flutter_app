import 'package:flutter/material.dart';

import 'package:first_flutter_app/components/components.dart';
import 'package:first_flutter_app/services/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'Random number'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // State widget
  bool _isLoading = false;
  int _value = 0;

  // Services
  final NumberService _numberService = NumberService();

  Future<void> _getRandomValue() async {
    setState(() {
      _isLoading = true;
    });

    final int randomInt = await _numberService.getRandomInt();

    setState(() {
      _isLoading = false;
      _value = randomInt;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Random value is:',
            ),
            Counter(
              value: _value,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: _getRandomValue,
          tooltip: 'Random value',
          child: _isLoading
              ? const SizedBox(
                  width: 30.0,
                  height: 30.0,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    semanticsLabel: 'Linear progress indicator',
                  ),
                )
              : const Icon(Icons.cached)),
    );
  }
}
