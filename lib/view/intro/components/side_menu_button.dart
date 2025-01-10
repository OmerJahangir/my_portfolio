import 'package:flutter/material.dart';
import '../../../res/constants.dart';

class MenuButton extends StatelessWidget {
  final VoidCallback? onTap;
  const MenuButton({super.key, this.onTap});
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 200),
      builder: (context, value, child) {
        return InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            // height: defaultPadding * 2.0 * value,
            // width: defaultPadding * 2.0 * value,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              // color: Colors.black,
              boxShadow: [
                BoxShadow(
                    color: Colors.pinkAccent.withValues(alpha: 0.5),
                    offset: const Offset(1, 1)),
                BoxShadow(
                    color: Colors.blue.withValues(alpha: 0.5),
                    offset: const Offset(-1, -1)),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0) * 1.2 * value,
              child: Icon(
                Icons.menu,
                color: Colors.white,
                size: defaultPadding * 1.2 * value,
              ),
            ),
          ),
        );
      },
    );
  }
}
// shaderCallback: (bounds) {
//                     return LinearGradient(
//                             colors: [Colors.pink, Colors.blue.shade900])
//                         .createShader(bounds);
//                   },
