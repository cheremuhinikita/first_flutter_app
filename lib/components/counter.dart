import 'package:anitex/anitex.dart';
import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  const Counter({Key? key, required this.value}) : super(key: key);

  final int value;

  @override
  Widget build(BuildContext context) {
    return AnimatedText('$value', style: Theme.of(context).textTheme.headline4);
  }
}
