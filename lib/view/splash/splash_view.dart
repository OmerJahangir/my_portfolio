import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../res/constants.dart';
import '../1_home/home.dart';
import '../3_intro/components/animated_texts_componenets.dart';
import 'componenets/animated_loading_text.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            "assets/images/bg.svg",
            fit: BoxFit.cover,
          ),
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedImageContainer(
                  width: 100,
                  height: 100,
                ),
                SizedBox(
                  height: defaultPadding,
                ),
                AnimatedLoadingText(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
