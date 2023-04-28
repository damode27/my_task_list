import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final bool isBlue;

  const MyButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    required this.isBlue,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Material(
        child: InkWell(
          onTap: onPressed,
          child: Ink(
            height: 50, width: double.infinity,
            color: isBlue
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.secondary,
            child: Center(
                child: Text(
                  buttonText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )
            ),
          ),
        ),
      ),
    );
  }
}
