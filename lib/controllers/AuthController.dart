import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workify/controllers/UserController.dart';
import 'package:workify/exceptions/BadCredentials.dart';
import 'package:workify/exceptions/print_log.dart';
import 'package:workify/mixins/cache.dart';
import 'package:workify/models/UserModel.dart';
import 'package:workify/services/auth_service.dart';

class AuthController extends GetxController with CacheManager {
  final RxBool isSignedIn = false.obs;

  Future<void> loginUser(
      {required String username, required String password}) async {
    final AuthService _authService = AuthService();
    final token =
        await _authService.loginService(username: username, password: password);

    if (token != null) {
      isSignedIn.value = true;
      await saveToken(token);
      final UserController _userController = Get.find<UserController>();
      await _userController.setUser(token);
      PrintLog.printLog(
        fileName: 'AuthController',
        functionName: 'loginUser',
        blockNumber: 1,
        printStatement: '\nToken received Successfully !!\n$token',
      );
    } else {
      Get.defaultDialog(
          middleText: 'Incorrect Username or Password',
          textConfirm: 'Dismiss',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
      print('\n-- In Auth_Controller file :: loginUser(){} : Block 2\n');
      print('Incorrect Credentials !!');
      print('-------------- End Block 2 ---------------');
      throw BadCredentials();
    }
  }

  Future<void> registerUser(UserModel user) async {
    final AuthService _authService = AuthService();
    final response = await _authService.registerService(user);

    if (response != null) {
    } else {
      Get.defaultDialog(
          middleText: 'Register Error',
          textConfirm: 'Dismiss',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }

  Future<void> logOut() async {
    final UserController _userController = Get.find<UserController>();
    _userController.currentUser = null;
    try {
      await removeToken();
    } finally {
      await removeUser();
    }
  }

  Future<void> callLogOut() async {
    Get.defaultDialog(
        title: 'Log Out?',
        middleText: 'Hope to see you again 😃',
        textConfirm: 'Yes',
        textCancel: 'No',
        contentPadding: const EdgeInsets.all(8),
        titlePadding: const EdgeInsets.all(8),
        onConfirm: () async {
          logOut();

          Get.offAllNamed('/auth');
        });
  }

  void checkLoginStatus() {
    final token = getToken();
    if (token != null) {
      isSignedIn.value = true;
    }
  }
}
