import 'dart:math';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
    this.color,
    required this.size,
  });

  final Color? color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi / 5,
      child: Icon(
        Icons.format_bold,
        color: color,
        size: size,
      ),
    );
  }
}
