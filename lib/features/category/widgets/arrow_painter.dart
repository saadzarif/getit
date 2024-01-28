import 'package:flutter/cupertino.dart';

class ArrowPainter extends CustomPainter {
  final double arrowLength;
  final bool isLeft;
  ArrowPainter({
    required this.arrowLength,
    required this.isLeft,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint1 = Paint()
      ..color = CupertinoColors.white.withOpacity(0.75)
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;
    final Paint paint2 = Paint()
      ..color = CupertinoColors.white.withOpacity(0.75)
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;

    const double arrowWidth = 10.0;

    // Draw arrow tail
    canvas.drawLine(
      Offset(5, size.height / 2),
      Offset(arrowLength, size.height / 2),
      paint1,
    );

    // Draw arrowhead (open head) towards right
    !isLeft
        ? canvas.drawLine(
            Offset(
                arrowLength - arrowWidth, size.height / 2.5 - arrowWidth / 2),
            Offset(arrowLength, size.height / 2),
            paint2,
          )
        : null;
    !isLeft
        ? canvas.drawLine(
            Offset(arrowLength, size.height / 2),
            Offset(
                arrowLength - arrowWidth, size.height / 1.5 + arrowWidth / 2),
            paint2,
          )
        : null;
    // Draw arrowhead (open head) towards left
    isLeft
        ? canvas.drawLine(
            Offset(arrowWidth + 5, size.height / 2.5 - arrowWidth / 2),
            Offset(5, size.height / 2),
            paint2,
          )
        : null;

    isLeft
        ? canvas.drawLine(
            Offset(5, size.height / 2),
            Offset(arrowWidth + 5, size.height / 1.5 + arrowWidth / 2),
            paint2,
          )
        : null;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
