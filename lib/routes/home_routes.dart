import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workify/controllers/profile_details_controller.dart';
import 'package:workify/controllers/profile_widgets_controller.dart';
import 'package:workify/screens/DashBoard.dart';
import 'package:workify/screens/ProfileSection/SelfProfileSection/ProfilePage.dart';

class HomeRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return GetPageRoute(
          page: () => DashBoard(),
          
        );
      case "/profile":
        return GetPageRoute(
          page: () => ProfilePage(),
          binding: BindingsBuilder(() => {
                Get.put(ProfileWidgetsController()),
                Get.put(ProfileDetailsController()),
              }),
        );
      default:
        return GetPageRoute(
          page: () => ProfilePage(),
          binding: BindingsBuilder(() => {
                Get.put(ProfileWidgetsController()),
                Get.put(ProfileDetailsController()),
              }),
        );
    }
  }
}
