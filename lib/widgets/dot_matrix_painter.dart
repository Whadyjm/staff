import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:math' as math;

class DotMatrixPainter extends CustomPainter {
  final Color dotColor;
  final double dotRadius;
  final int density;

  DotMatrixPainter({
    this.dotColor = Colors.green,
    this.dotRadius = 1.0,
    this.density = 100,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = dotColor;
    final math.Random random = math.Random();


    for (int i = 0; i < density; i++) {
      double x = random.nextDouble() * size.width;
      double y = random.nextDouble() * size.height;

      double distanceToCenter = math.sqrt(math.pow(x - size.width / 2, 2) + math.pow(y - size.height / 2, 2));
      double maxDistance = math.sqrt(math.pow(size.width / 2, 2) + math.pow(size.height / 2, 2));
      double normalizedDistance = distanceToCenter / maxDistance;

      int alpha = (255 * (1 - normalizedDistance)).toInt().clamp(0, 255);

      double waveFactor = math.sin((x / size.width) * math.pi) * 0.5 + 0.5;
      alpha = (alpha * waveFactor).toInt().clamp(0, 255);


      paint.color = dotColor.withAlpha(alpha);
      canvas.drawCircle(Offset(x, y), dotRadius, paint);
    }


    double cornerSize = math.min(size.width, size.height) * 0.4; 

    paint.color = dotColor;
    for (int i = 0; i < density / 4; i++) {
      double x = random.nextDouble() * cornerSize + (size.width - cornerSize);
      double y = random.nextDouble() * cornerSize;

      double distanceToCorner = math.sqrt(math.pow(x - size.width, 2) + math.pow(y - 0, 2));
      double maxDistanceCorner = math.sqrt(math.pow(cornerSize, 2) + math.pow(cornerSize, 2));
      double normalizedDistanceCorner = distanceToCorner / maxDistanceCorner;
      int alphaCorner = (255 * (1 - normalizedDistanceCorner)).toInt().clamp(0, 255);
      paint.color = dotColor.withAlpha(alphaCorner);

      if (x > size.width - cornerSize && y < cornerSize) {
        canvas.drawCircle(Offset(x, y), dotRadius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}