import 'package:flutter/material.dart';

import 'my_appbar_painter.dart';

class MyAppbar extends StatelessWidget{
  final String title;
  final bool backButton;
  const MyAppbar({super.key, required this.title, required this.backButton});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: 140, width: double.maxFinite,
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                color: Theme.of(context).colorScheme.primary,
                height: 70, width: double.maxFinite,
              ),
              SizedBox(
                height: 70, width: double.maxFinite,
                child: CustomPaint(
                  painter: MyAppbarPainter(context: context, isBlue: true),
                ),
              ),
            ],
          ),

          Center(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          backButton ? Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: (){ Navigator.pop(context); },
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white,),
            ),
          ) : const SizedBox(),

        ],
      ),
    );
  }

}