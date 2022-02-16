import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workify/controllers/AuthController.dart';
import 'package:workify/controllers/UserController.dart';
import 'package:workify/screens/SplashScreen/OnBoardingScreen.dart';
import 'package:workify/screens/SplashScreen/splash_widget.dart';

class SplashScreen extends GetView<AuthController> {
  const SplashScreen({Key? key}) : super(key: key);

  Future<void> initializeSettings() async {
     //controller.checkLoginStatus();
      if (controller.isSignedIn.value) {
        print("USER IS SIGNED IN");
        final token = controller.getToken();
        print("WITH TOKEN $token");
        final _userController = Get.find<UserController>();
        await _userController.setUser(token!);
        
        Get.toNamed("/home");
      } else {
        print(
            '\n-- In SplashScreen.dart file :: initializeSettings(){} : Block 1\n');
        print("CAN'T SET USER, NOT SIGNED IN");
        print('-------------- End Block 1 ---------------');
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
