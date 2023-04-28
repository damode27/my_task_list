import 'package:flutter/material.dart';

class Logo1Painter extends CustomPainter{
  final BuildContext context;
  const Logo1Painter({required this.context});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Theme.of(context).colorScheme.primary
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    double radius = size.width / 2;

    Path path = Path()
      ..moveTo(0, 0)
      ..arcTo(
        Rect.fromCircle(center: Offset(radius, radius), radius: radius),
        3.48,
        2.8,
        true,
      )
      ..quadraticBezierTo(
        120, 87,
        80, 67,
      )
      ..quadraticBezierTo(
        40, 45,
        4, 54,
      );
      //..lineTo(0, 55);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

}