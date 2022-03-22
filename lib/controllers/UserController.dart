import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
// import 'package:http/http.dart';
import 'package:workify/screens/AuthPage/AuthController.dart';
import 'package:workify/exceptions/print_log.dart';
import 'package:workify/mixins/cache.dart';
import 'package:workify/models/UserModel.dart';
import 'package:workify/services/user_get_service.dart';

class UserController extends GetxController with CacheManager {
  Rx<UserModel>? currentUser;
  final UserGetService userService = UserGetService();
  final _authController = Get.find<AuthController>();
  @override
  void onInit() async {
    if (_authController.isSignedIn.value) {
      final token = _authController.getToken();
      final user = getUser();
      PrintLog.printLog(
          fileName: 'UserController',
          functionName: 'onInit',
          blockNumber: 1,
          printStatement: 'User is signed in with token\n$token');
      if (user != null) {
        currentUser = Rx<UserModel>(user);
        PrintLog.printLog(
            fileName: 'UserController',
            functionName: 'onInit',
            blockNumber: 2,
            printStatement: 'User found in local Storage !!');
      } else {
        PrintLog.printLog(
            fileName: 'UserController',
            functionName: 'onInit',
            blockNumber: 3,
            printStatement: 'User NOT found in local Storage !!');
        _authController.logOut();
      }
    } else {
      PrintLog.printLog(
          fileName: 'UserController',
          functionName: 'onInit',
          blockNumber: 4,
          printStatement: 'NOT Logged In !!');
    }
    super.onInit();
  }

  Future<void> setUser(String token) async {
    final user = await userService.userGetService(token);

    if (user != null) {
      currentUser = Rx<UserModel>(user);
      await saveUser(currentUser!.value);
      PrintLog.printLog(
          fileName: 'UserController', functionName: 'setUser(){}',
          blockNumber: 1,
          printStatement: 'Saved user successfully!!'
          );
    } else {
      Get.defaultDialog(
          middleText: 'Please Contact the Admin',
          title: 'User Not Found',
          textConfirm: 'Dismiss',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
      PrintLog.printLog(
          fileName: 'UserController',
          blockNumber: 1,
          functionName: 'setUser(){}',
          printStatement: 'User found null');
      // throw Exception();
    }
  }
}
