import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:workify/screens/AuthPage/AuthPage.dart';
import 'package:workify/screens/SplashScreen/splash_widget.dart';

class SplashAnimate extends StatelessWidget {
  const SplashAnimate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Image.asset('assets/images/banner512_nobg.png'),
      nextScreen: AuthPage(),
    );
  }
}
