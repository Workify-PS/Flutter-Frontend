import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workify/controllers/UserController.dart';
import 'package:workify/exceptions/BadCredentials.dart';
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
      print('\n-- In Auth_Controller file :: loginUser(){} : Block 1\n');
      print('Token received Successfully !! Token :\n $token');
      print('-------------- End Block 1 ---------------');

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
    Get.defaultDialog(
        title: 'Log out !',
        middleText: 'We hate to see you leave...',
        textCancel: 'Cancel',
        textConfirm: 'Log Out',
        onConfirm: () async {
          isSignedIn.value = false;
          final UserController _userController = Get.find<UserController>();
          _userController.currentUser = null;
          try {
            await removeToken();
            await removeUser();
            Get.offAllNamed('/auth');
            print('\n-- In AuthController file :: logOut(){} : Block 1\n');
            if (getToken() == null) {
              print('Token removed Successfully !!');
            } else {
              print('Token still alive !!');
            }
            print("Logged Out Successfully !! ");
            print('-------------- End Block 1 ---------------');
          } catch (error) {
            print('\n-- In AuthController file :: logOut(){} : Block 2\n');
            print('Error :: ' + error.toString());
            print('-------------- End Block 2 ---------------');
          }
        });
  }

  void checkLoginStatus() {
    final token = getToken();
    if (token != null) {
      isSignedIn.value = true;
    }
  }
}
