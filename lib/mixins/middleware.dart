import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workify/screens/AuthPage/AuthController.dart';
import 'package:workify/mixins/cache.dart';
import 'package:workify/routes/router.dart';
import 'package:workify/screens/HomePage/HomePageController.dart';

class AuthMiddlware extends GetMiddleware with CacheManager {
  @override
  RouteSettings? redirect(String? route) {
    if (Routes.validateRoute(route)) {
      if ((getToken() != null && route != "/auth")) {
        final homeController = Get.find<HomePageController>();
        
       if(route=="/") return RouteSettings(name: "/home");
       homeController.pageName.value = route??"/home";
        homeController.sideMenuCollapsed.value =
            homeController.pageName.value != "/home";
        return null;
      } else {
        return RouteSettings(name: "/auth");
      }
    } else {
      return RouteSettings(name: "/page-not-found"); 
    }
  }
}
