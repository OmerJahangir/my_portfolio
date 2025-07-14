import 'dart:ui';

import 'package:flutter/material.dart';

class GlassMorphism extends StatelessWidget {
  const GlassMorphism({
    super.key,
    required this.child,
    this.blur,
    this.opacity,
    this.color = Colors.white,
    this.borderRadius,
  });
  final Widget child;
  final double? blur;
  final double? opacity;
  final Color? color;
  final BorderRadius? borderRadius;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(12),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur ?? 10, sigmaY: blur ?? 10),
        child: Container(
          decoration: BoxDecoration(
            color: color!.withValues(alpha: opacity ?? 0.2),
            borderRadius: borderRadius ?? BorderRadius.circular(12),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.3),
              width: 2,
            ),
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
