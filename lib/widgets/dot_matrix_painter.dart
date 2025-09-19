import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class DotMatrixPainter extends CustomPainter {
  final Color dotColor;
  final double dotRadius;
  final int density;
  final double animationValue;

  DotMatrixPainter({
    this.dotColor = Colors.green,
    this.dotRadius = 1.0,
    this.density = 100,
    required this.animationValue,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = dotColor;

    int columns = math.sqrt(density).floor();
    int rows = (density / columns).ceil();

    double spacingX = size.width / (columns + 1);
    double spacingY = size.height / (rows + 1);

    for (int row = 0; row < rows; row++) {
      for (int col = 0; col < columns; col++) {
        double x = (col + 1) * spacingX;
        double y = (row + 1) * spacingY;

        double distanceToCenter = math.sqrt(
          math.pow(x - size.width / 2, 2) + math.pow(y - size.height / 2, 2),
        );
        double maxDistance = math.sqrt(
          math.pow(size.width / 2, 2) + math.pow(size.height / 2, 2),
        );
        double normalizedDistance = distanceToCenter / maxDistance;

        double fade = (math.cos(animationValue * 2 * math.pi) + 1) / 2;
        int alpha = (255 * (1 - normalizedDistance) * fade).toInt().clamp(
          0,
          255,
        );

        paint.color = dotColor.withAlpha(alpha);
        canvas.drawCircle(Offset(x, y), dotRadius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant DotMatrixPainter oldDelegate) => true;
}

class AnimatedDotMatrix extends StatefulWidget {
  final Color dotColor;
  final double dotRadius;
  final int density;
  final double width;
  final double height;

  const AnimatedDotMatrix({
    Key? key,
    this.dotColor = Colors.green,
    this.dotRadius = 1.0,
    this.density = 100,
    this.width = 300,
    this.height = 300,
  }) : super(key: key);

  @override
  State<AnimatedDotMatrix> createState() => _AnimatedDotMatrixState();
}

class _AnimatedDotMatrixState extends State<AnimatedDotMatrix>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          size: Size(widget.width, widget.height),
          painter: DotMatrixPainter(
            dotColor: widget.dotColor,
            dotRadius: widget.dotRadius,
            density: widget.density,
            animationValue: _controller.value,
          ),
        );
      },
    );
  }
}
