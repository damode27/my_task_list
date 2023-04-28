import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyContentText extends StatelessWidget {
  final String text1, text2, text3;
  final VoidCallback onTap;

  const MyContentText({
    super.key,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            text1,
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 15,
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: RichText(
              text: TextSpan(
                text: text2,
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: Theme.of(context).colorScheme.primary,
                ),
                children: [
                  TextSpan(
                    text: text3,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ]
              ),
            ),
          ),
        ],
      ),
    );
  }
}