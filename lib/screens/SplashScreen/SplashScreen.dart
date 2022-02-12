import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workify/controllers/AuthController.dart';
import 'package:workify/screens/SplashScreen/OnBoardingScreen.dart';
import 'package:workify/screens/SplashScreen/splash_widget.dart';

class SplashScreen extends GetView<AuthController> {
  const SplashScreen({ Key? key }) : super(key: key);
  Future<void> initializeSettings() async {
    controller.checkLoginStatus();

  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initializeSettings(),
       builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SplashWidget();
        } else {
          if (snapshot.hasError) {
            return Scaffold();
          } else {
            return OnBoardingScreen();
          }
        }
      },
      
    );
  }
}