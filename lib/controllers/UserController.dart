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
      super.onInit();
    if (_authController.isSignedIn.value) {
      final token = _authController.getToken();
      print('\n-- In UserController file :: onInit(){} : Block 1\n');
      print("USER IS SIGNED IN with TOKEN :: $token");
      print('-------------- End Block 1 ---------------');
      //await setUser(token!);
      final user = getUser();
      if (user != null) {
        currentUser = Rx<UserModel>(user);
        print('\n-- In UserController file :: onInit(){} : Block 2\n');
        print("User First Name : " + currentUser!.value.firstName.toString());
        print('-------------- End Block 2 ---------------');
      } else {
        print('\n-- In UserController file :: onInit(){} : Block 3\n');
        print("USER NOT FOUND IN LOCAL STORAGE");
        print('-------------- End Block 3 ---------------');
        _authController.logOut();
      }
    } else {
      print('\n-- In UserController file :: onInit(){} : Block 4\n');
      print("NOT SIGNED IN");
      print('-------------- End Block 4 ---------------');
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
      print('\n-- In UserController file :: setUser(){} : Block 1\n');
      print("User Not found ");
      print('-------------- End Block 1 ---------------');
      throw Exception();
    }
  }
}
