import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:workify/models/UserModel.dart';
import 'package:workify/services/user_get_service.dart';

class UserController extends GetxController {
  late Rx<UserModel?> currentUser;
  final UserGetService userService = Get.put(UserGetService());

  // @override
  // void onInit() async {
  //   print("ON INIT OF USER CONTROLLER");

  //   super.onInit();
  // }

  Future<void> setUser(String token) async {
    final user = await userService.userGetService(token);

    //return;
    if (user != null) {
      currentUser = Rx<UserModel?>(user);
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
