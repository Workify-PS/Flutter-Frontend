

import 'package:get/get.dart';
import 'package:workify/mixins/cache.dart';

class AuthController extends GetxController with Cache {
  final isSignedIn = false.obs;

  void logOut() {
    isSignedIn.value = false;
    removeToken();
  }

  void login(String? token) async {
    isSignedIn.value = true;
    //Token is cached
    await saveToken(token);
  }

  void checkLoginStatus() {
    final token = getToken();
    if (token != null) {
      isSignedIn.value = true;
    }
  }
}


