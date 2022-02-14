import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workify/controllers/UserController.dart';
import 'package:workify/mixins/cache.dart';
import 'package:workify/models/UserModel.dart';
import 'package:workify/services/auth_service.dart';

class AuthController extends GetxController with CacheManager {
  
  final isSignedIn = false.obs;

  Future<void> loginUser(String username, String password) async {
    final AuthService _authService = AuthService();
    final token = await _authService.loginService(username, password);

    if (token != null) {
      print("TOKEN: $token");
      isSignedIn.value = true;
      await saveToken(token);
      final UserController _userController = Get.find<UserController>();
     await _userController.setUser(token);
    } else {
      Get.defaultDialog(
          middleText: 'Failed to Authenticate',
          textConfirm: 'Dismiss',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
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
    isSignedIn.value = false;
    final UserController _userController = Get.find<UserController>();
    //_userController.currentUser.close();
    
    await removeToken();
  }

  void checkLoginStatus() {
    final token = getToken();
    if (token != null) {
      isSignedIn.value = true;
    }
  }
}
