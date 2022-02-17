import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workify/controllers/UserController.dart';
import 'package:workify/exceptions/BadCredentials.dart';
import 'package:workify/exceptions/print_log.dart';
import 'package:workify/mixins/cache.dart';
import 'package:workify/models/UserModel.dart';
import 'package:workify/services/auth_service.dart';

class AuthController extends GetxController with CacheManager {
  final isSignedIn = false.obs;

  Future<void> loginUser(
      {required String username, required String password}) async {
    final AuthService _authService = AuthService();
    final token =
        await _authService.loginService(username: username, password: password);

    if (token != null) {
      print('\nToken received Successfully !!\n$token');
      isSignedIn.value = true;
      await saveToken(token);
      final UserController _userController = Get.find<UserController>();
      await _userController.setUser(token);
    } else {
      Get.defaultDialog(
          middleText: 'Incorrect Username or Password',
          textConfirm: 'Dismiss',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
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
    Get.defaultDialog(
        title: 'LogOut',
        textConfirm: 'Log Out',
        onConfirm: () async {
            final UserController _userController = Get.find<UserController>();
            _userController.currentUser = null;
            await removeToken();
            await removeUser();
            if (getToken() == null) {
              isSignedIn.value = false;
              Get.offAllNamed('/auth');
              PrintLog.printLog(
                  fileName: 'AuthController.dart',
                  functionName: 'logOut(){}',
                  blockNumber: 1,
                  printStatement: 'User Logged Out Successfully !!');
            } else {
              PrintLog.printLog(
                  fileName: 'AuthController.dart',
                  functionName: 'logOut(){}',
                  blockNumber: 2,
                  printStatement: 'Token Still Alive !!');
            }
          }
        );
        
  }

  void checkLoginStatus() {
    final token = getToken();
    if (token != null) {
      isSignedIn.value = true;
    }
  }
}
