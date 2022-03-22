import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:workify/screens/AuthPage/AuthController.dart';
import 'package:workify/controllers/UserController.dart';

class AuthPageController extends GetxController {
  RxBool hasForgotPassword = false.obs;
  RxBool passwordIsVisible = false.obs;
  RxBool otp = false.obs;
  final TextEditingController otpController = TextEditingController();
  // @override
  // void onInit() {
  //   final _userController = Get.find<UserController>();
  //   final _authController = Get.find<AuthController>();
  //   if (!(_authController.isSignedIn.value &&
  //       _userController.currentUser!.value != null)) {
  //     Get.toNamed("/auth");
  //   } else {
  //     Get.toNamed("/home");
  //   }
  //   super.onInit();
  // }

  void forgotPassword() {
    hasForgotPassword.value = true;
  }

  void backToLogin() {
    hasForgotPassword.value = false;
    otp.value = false;
  }
}
