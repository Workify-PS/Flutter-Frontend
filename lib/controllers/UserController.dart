import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:workify/controllers/AuthController.dart';
import 'package:workify/mixins/cache.dart';
import 'package:workify/models/UserModel.dart';
import 'package:workify/services/user_get_service.dart';

class UserController extends GetxController with CacheManager {
  Rx<UserModel>? currentUser;
  final UserGetService userService = UserGetService();
  final _authController = Get.find<AuthController>();
  @override
  void onInit() async {
    //_authController.checkLoginStatus();
    print("ON INIT OF USER CONTROLLER");

    if (_authController.isSignedIn.value) {
      print("USER IS SIGNED IN");
      final token = _authController.getToken();
      print("WITH TOKEN $token");
      await setUser(token!);
      print("name" + currentUser!.value.firstName.toString());
      super.onInit();
    } else {
      print("NOT SIGNED IN");
    }
  }

  Future<void> setUser(String token) async {
    final user = await userService.userGetService(token);

    if (user != null) {
      currentUser = Rx<UserModel>(user);
      await saveUser(currentUser!.value);
    } else {
      Get.defaultDialog(
          middleText: 'Please Contact the Admin',
          title: 'User Not Found',
          textConfirm: 'Dismiss',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
      throw Exception();
    }
  }
}
