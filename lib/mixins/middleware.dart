import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workify/controllers/AuthController.dart';
import 'package:workify/mixins/cache.dart';
import 'package:workify/routes/router.dart';
import 'package:workify/screens/HomePage/HomePageController.dart';

class AuthMiddlware extends GetMiddleware with CacheManager {
  @override
  RouteSettings? redirect(String? route) {
    if (Routes.validateRoute(route)) {
      if ((getToken() != null || route == "/auth")) {
        final homeController = Get.put(HomePageController());

        homeController.pageName.value = "/home";
        homeController.sideMenuCollapsed.value =
            homeController.pageName.value != "/home";
        return null;
      } else {
        return RouteSettings(name: "/auth");
      }
    } else {
      return RouteSettings(name: "/page-not-found"); //TODO: RETURN 404
    }
  }
}
