import 'package:flutter/material.dart';

class MyTitleText extends StatelessWidget {
  final String text;

  const MyTitleText({super.key, required this.text,});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}