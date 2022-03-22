import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:workify/controllers/WishController.dart';
// import 'package:workify/routes/router.dart';
// import 'package:workify/screens/AttendancePage/AttendancePage.dart';
// import 'package:workify/screens/DashBoard/DashBoard.dart';
// import 'package:workify/screens/LeavePage/LeavePage.dart';
import 'dart:html' as html;

import 'package:workify/controllers/LeavePage/AllEmployeeLeavesController.dart';

class HomePageController extends GetxController {
  RxString pageName = ''.obs;
  RxBool sideMenuCollapsed = false.obs;
  late GlobalKey<ScaffoldState> scaffoldKey;
  @override
  void onInit() {
    pageName.value = "/home";
    Get.put(AllEmployeeLeavesController());
    super.onInit();
  }

  void gotoPage(String page, BuildContext context, {Object? arguments}) {
    if (pageName.value == page) return;
    pageName.value = page;

    //sideMenuCollapsed.value = page != Routes.home;

    print("Request to go to ${pageName.value}");

    Get.keys[1]!.currentState!.pushNamed(page, arguments: arguments);
    html.window.history.replaceState(null, "/", page);
  }
}
