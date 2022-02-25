import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workify/controllers/AuthController.dart';
import 'package:workify/controllers/UserController.dart';
import 'package:workify/exceptions/print_log.dart';
import 'package:workify/screens/SplashScreen/OnBoardingScreen.dart';
import 'package:workify/screens/SplashScreen/splash_widget.dart';

class SplashScreen extends GetView<AuthController> {
  const SplashScreen({Key? key}) : super(key: key);

  Future<bool> initializeSettings() async {
    final userController = Get.find<UserController>();
    if (controller.isSignedIn.value && userController.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    initializeSettings().then((value) {
      if (value) {
        Get.toNamed("/home");
      } else {
        Get.toNamed("/auth");
      }
    });
    return LoadingWidget();
    // return FutureBuilder(
    //   future: initializeSettings(),
    //   builder: (context, snapshot) {
    //     return LoadingWidget();
    //   },
    // );
  }
}
