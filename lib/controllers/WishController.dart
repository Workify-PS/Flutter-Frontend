import 'dart:math';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:workify/models/WishModel.dart';
import 'package:workify/services/wish_get_service.dart';

final WishGetService userService = Get.put(WishGetService());

class WishController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    setUser();
  }

  late Rx<WishModel> cuser;
  Future<void> setUser() async {
    try {
      final _user = await userService.wishGetService();
      if (_user != null) {
        print(
            '\n-- In Wish Details Controller file :: setUser(){} : Block 1\n');
        print('Data Received :: ');
        print('-------------- End Block 1 ---------------');
      } else {}
    } catch (e) {
      print('\n-- In Wish Details Controller file :: setUser(){} : Block 1\n');
      print('Login Error :: ' + e.toString());
      print('-------------- End Block 1 ---------------');
    }

    // final _user = await userService.wishGetService();
    // if (_user != null) {
    //   print(_user.empCode);
    //   cuser = Rx<WishModel>(_user);
    // } else {
    //   Get.defaultDialog(
    //       middleText: 'Please Contact the Admin',
    //       title: 'User Not Found',
    //       textConfirm: 'Dismiss',
    //       confirmTextColor: Colors.white,
    //       onConfirm: () {
    //         Get.back();
    //       });
    // }
  }
}
