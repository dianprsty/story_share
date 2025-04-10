import 'dart:math';

import 'package:flutter/material.dart';

class WavyLoadingIndicator extends StatefulWidget {
  final Color? color;

  const WavyLoadingIndicator({super.key, this.color});

  @override
  State<WavyLoadingIndicator> createState() => _WavyLoadingIndicatorState();
}

class _WavyLoadingIndicatorState extends State<WavyLoadingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _WavyPainter(
        animation: _controller,
        color: widget.color ?? Theme.of(context).colorScheme.primary,
      ),
      size: const Size(100, 40),
    );
  }
}

class _WavyPainter extends CustomPainter {
  final Animation<double> animation;
  final Color color;

  _WavyPainter({required this.animation, required this.color})
    : super(repaint: animation);

  final int circleCount = 5;
  final double circleRadius = 4;
  final double spacing = 16;
  final double waveHeight = 16;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = color;

    for (int i = 0; i < circleCount; i++) {
      final double x = (i * spacing) + circleRadius;
      final double t = animation.value * 2 * pi;
      final double phase = (i * pi / 6);
      final double y = size.height / 2 + sin(t + phase) * waveHeight;

      canvas.drawCircle(Offset(x, y), circleRadius, paint);
    }
  }

  @override
  bool shouldRepaint(_WavyPainter oldDelegate) => true;
}
