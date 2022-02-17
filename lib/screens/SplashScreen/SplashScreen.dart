import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workify/controllers/AuthController.dart';
import 'package:workify/controllers/UserController.dart';
import 'package:workify/exceptions/print_log.dart';
import 'package:workify/screens/SplashScreen/OnBoardingScreen.dart';
import 'package:workify/screens/SplashScreen/splash_widget.dart';

class SplashScreen extends GetView<AuthController> {
  const SplashScreen({Key? key}) : super(key: key);

  Future<void> initializeSettings() async {
    //controller.checkLoginStatus();
    if (controller.isSignedIn.value) {
      final token = controller.getToken();
      final _userController = Get.find<UserController>();
      await _userController.setUser(token!);
      Get.toNamed("/home");
      PrintLog.printLog(
        fileName:'SplashScreen',
        functionName: 'initializeSettings',
        blockNumber: 1,
        printStatement: 'User is logged in with Token\n$token',
      );
    } else {
      PrintLog.printLog(
        fileName:'SplashScreen',
        functionName: 'initializeSettings',
        blockNumber: 2,
        printStatement: 'User is not logged In !!',
      );
      Get.toNamed("/auth");
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initializeSettings(),
      builder: (context, snapshot) {
        return SplashWidget();
      },
    );
  }
}
