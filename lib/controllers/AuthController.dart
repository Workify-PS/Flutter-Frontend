import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workify/controllers/user_controller.dart';
import 'package:workify/mixins/cache.dart';
import 'package:workify/models/UserModel.dart';
import 'package:workify/services/auth_service.dart';

class AuthController extends GetxController with CacheManager {
  final AuthService _authService = Get.put(AuthService());
  final isSignedIn = false.obs;
  Future<void> loginUser(String username, String password) async {
    final token = await _authService.loginService(username, password);
    
    if (token != null) {
      loginWithToken(token);
      final userController = Get.put(UserController());
      userController.getUser(token);
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

  void logOut() {
    isSignedIn.value = false;
    removeToken();
  }

  void loginWithToken(String? token) async {
    isSignedIn.value = true;

    await saveToken(token);
  }

  void checkLoginStatus() {
    final token = getToken();
    if (token != null) {
      isSignedIn.value = true;
    }
  }
}
