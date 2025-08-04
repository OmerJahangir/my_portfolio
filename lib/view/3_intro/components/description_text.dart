import 'package:flutter/material.dart';
import 'package:my_portfolio/res/my_strings.dart';

class AnimatedDescriptionText extends StatelessWidget {
  const AnimatedDescriptionText(
      {super.key, required this.start, required this.end});
  final double start;
  final double end;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: TweenAnimationBuilder(
        tween: Tween(begin: start, end: end),
        duration: const Duration(milliseconds: 200),
        builder: (context, value, child) {
          return Text(
            MyStringConst.portfolioIntro,
            // 'I\'m capable of creating excellent mobile apps, handling${Responsive.isLargeMobile(context) ? '\n' : ''}every step from ${!Responsive.isLargeMobile(context) ? '\n' : ''}concept to deployment.',
            // maxLines: 2,
            // overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
              wordSpacing: 2,
              fontSize: value,
            ),
          );
        },
      ),
    );
  }
}
