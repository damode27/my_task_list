//EensdD

import 'package:flutter/material.dart';
import 'package:my_task_list/splash.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Task List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          primary: const Color(0xFF65C0D4),
          onPrimary: const Color(0xFFA3D9E5),
          primaryContainer: const Color(0xFFE0F2F6),
          secondary: const Color(0xFFFFBA76),
          onSecondary: const Color(0xFFFFD6AD),
          secondaryContainer: const Color(0xFFFFF1E4),
          tertiary: const Color(0xFF3D737F),
        ),

        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: Splash(),
    );
  }
}