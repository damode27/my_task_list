import 'package:flutter/material.dart';

class Logo2Painter extends CustomPainter{
  final BuildContext context;
  const Logo2Painter({required this.context});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Theme.of(context).colorScheme.secondary
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    double radius = size.width / 2;

    Path path = Path()
      ..moveTo(radius, 0)
      ..arcTo(
        Rect.fromCircle(center: Offset(radius, 0), radius: radius),
        0.35,
        2.8,
        true,
      )
      ..quadraticBezierTo(
        40, -8,
        80, 13,
      )
      ..quadraticBezierTo(
        120, 32,
        155, 28,
      );
      //..lineTo(size.width, 25);

    canvas.drawPath(path, paint);
    // canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

}