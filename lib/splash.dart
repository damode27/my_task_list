import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_task_list/my_widgets/logo2_painter.dart';
import 'login.dart';
import 'my_widgets/logo1_painter.dart';

class Splash extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), (){
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Login())
      );
    });

    // TODO: implement build
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 80,
              width: 160,
              child: CustomPaint(
                painter: Logo1Painter(context: context),
              ),
            ),
            SizedBox(
              height: 80,
              width: 160,
              child: CustomPaint(
                painter: Logo2Painter(context: context),
              ),
            ),
          ],
        ),
      ),
    );
  }

}