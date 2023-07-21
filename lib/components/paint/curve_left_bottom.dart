import 'package:flutter/material.dart';

class CustomCurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.grey.shade200
      ..strokeWidth = 2.0
      ..style = PaintingStyle
          .stroke; // Set the style to 'stroke' to draw only the line

    const double borderRadius = 20;
    final double width = size.width;
    final double height = size.height;

    final path = Path()
      ..moveTo(0, height - borderRadius)
      ..quadraticBezierTo(0, height, borderRadius, height)
      ..lineTo(width, height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
