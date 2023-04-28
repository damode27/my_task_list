import 'package:flutter/material.dart';

class MyAppbarPainter extends CustomPainter{
  final BuildContext context;
  final bool isBlue;

  const MyAppbarPainter({required this.context, required this.isBlue});
  @override
  void paint(Canvas canvas, Size size) {
    Color color1 = Theme.of(context).colorScheme.primaryContainer;
    Color color2 = Theme.of(context).colorScheme.onPrimary;
    Color color3 = Theme.of(context).colorScheme.primary;

    if(!isBlue){
      color1 = Theme.of(context).colorScheme.secondaryContainer;
      color2 = Theme.of(context).colorScheme.onSecondary;
      color3 = Theme.of(context).colorScheme.secondary;
    }

    final paint1 = Paint()
      ..color = color1
      ..style = PaintingStyle.fill
      ..strokeWidth = 10;

    final path1 = Path();
    path1.lineTo(0, size.height * 0.90);
    path1.quadraticBezierTo(
      size.width * 0.25, size.height * 0.75,
      size.width * 0.5, size.height * 0.90,
    );
    path1.quadraticBezierTo(
      size.width * 0.75,size.height * 1.05,
      size.width, size.height *0.90,
    );
    path1.lineTo(size.width, 0);
    canvas.drawPath(path1, paint1);

    ////////////////////////////////////////////////////////

    final paint2 = Paint()
      ..color = color2
      ..style = PaintingStyle.fill
      ..strokeWidth = 10;

    final path2 = Path();
    path2.lineTo(0, size.height * 0.70);
    path2.quadraticBezierTo(
      size.width * 0.25, size.height * 0.80,
      size.width * 0.5, size.height * 0.70,
    );
    path2.quadraticBezierTo(
      size.width * 0.75,size.height * 0.60,
      size.width, size.height *0.70,
    );
    path2.lineTo(size.width, 0);
    canvas.drawPath(path2, paint2);

    ////////////////////////////////////////////////////////

    final paint3 = Paint()
      ..color = color3
      ..style = PaintingStyle.fill
      ..strokeWidth = 10;

    final path3 = Path();
    path3.lineTo(0, size.height * 0.50);
    path3.quadraticBezierTo(
      size.width * 0.25, size.height * 0.35,
      size.width * 0.5, size.height * 0.50,
    );
    path3.quadraticBezierTo(
      size.width * 0.75,size.height * 0.65,
      size.width, size.height *0.50,
    );
    path3.lineTo(size.width, 0);
    canvas.drawPath(path3, paint3);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

}