import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workify/controllers/AuthController.dart';
import 'package:workify/screens/AuthPage/AuthPage.dart';
import 'package:workify/screens/HomePage.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  AuthController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isSignedIn.value ? HomePage() : AuthPage());
  }
}
