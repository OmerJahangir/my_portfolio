import 'dart:ui';

import 'package:flutter/material.dart';

class GlassMorphism extends StatelessWidget {
  const GlassMorphism(
      {super.key,
      required this.child,
      required this.blur,
      required this.opacity,
      required this.color,
      this.borderRadius});
  final Widget child;
  final double blur;
  final double opacity;
  final Color color;
  final BorderRadius? borderRadius;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          decoration: BoxDecoration(
            color: color.withOpacity(opacity),
            borderRadius: borderRadius,
            border: Border.all(color: Colors.white.withOpacity(0.3), width: 2),
            // gradient: const LinearGradient(colors: [
            //   Colors.pinkAccent,
            //   Colors.blue,
            // ]),
            // boxShadow: const [
            //   BoxShadow(
            //     color: Colors.pink,
            //     offset: Offset(-2, 0),
            //     blurRadius: 20,
            //   ),
            //   BoxShadow(
            //     color: Colors.blue,
            //     offset: Offset(2, 0),
            //     blurRadius: 20,
            //   ),
            // ],
          ),
          child: child,
        ),
      ),
    );
  }
}
