import 'package:flutter/material.dart';

class MyButtonActualizar extends StatelessWidget {
  final Widget buttonText;
  final VoidCallback onPressed;

  const MyButtonActualizar({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Theme.of(context).colorScheme.secondary,
          width: 1,
          style: BorderStyle.solid,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Material(
          child: InkWell(
            onTap: onPressed,
            child: Ink(
              height: 35, width: double.infinity,
              color: Colors.white,
              child: buttonText,
            ),
          ),
        ),
      ),
    );
  }
}
