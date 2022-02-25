import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workify/controllers/WishController.dart';
import 'package:workify/routes/router.dart';
import 'package:workify/screens/AttendancePage/AttendancePage.dart';
import 'package:workify/screens/DashBoard.dart';
import 'package:workify/screens/LeavePage/LeavePage.dart';

class HomePageController extends GetxController {
  RxString pageName = ''.obs;
  @override
  void onInit() {
    Get.put(WishController());
    pageName.value = Routes.home;
    super.onInit();
  }

  void gotoPage(String page) {
    pageName.value = page.toLowerCase();
    print("PAGE CHANGED TO $page");
  }

  Widget getScreen() {
    switch (pageName.value) {
      case "home":
        return DashBoard();
      case "attendance":
        return AttendancePage();
      case "leave":
        return LeavePage();
      default:
        return DashBoard();
    }
  }
}
