import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workify/screens/AuthPage/AuthController.dart';
import 'package:workify/controllers/UserController.dart';
import 'package:workify/exceptions/print_log.dart';
import 'package:workify/screens/HomePage/HomePage.dart';

import 'package:workify/screens/SplashScreen/splash_widget.dart';

class OnBoardingScreen extends GetView<AuthController> {
  const OnBoardingScreen({Key? key}) : super(key: key);

  Future<bool> initializeSettings() async {
    //await Future.delayed(Duration(seconds: 5));
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
        //Get.toNamed("/home");
      } else {
        Get.toNamed("/auth");
      }
    });
    // return LoadingWidget();
    return controller.isSignedIn.reactive.obx((state) {
      print("STATE CHANGES IN IS SIGNED IN");
      if (state != null) {
        if (state.value) {
          return HomePage();
        } else {
          //Get.toNamed("/auth");
          return SplashWidget(); // to be replaced by warning
        }
      }
      return SplashWidget();
    }, onLoading: SplashWidget());
  }
}
