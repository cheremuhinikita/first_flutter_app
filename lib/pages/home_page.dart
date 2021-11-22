import 'package:flutter/material.dart';

import 'package:first_flutter_app/services/services.dart';
import 'package:first_flutter_app/components/components.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = false;
  int _value = 0;

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
