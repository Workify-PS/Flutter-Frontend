import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workify/controllers/AuthController.dart';
import 'package:workify/mixins/cache.dart';

class AuthMiddlware extends GetMiddleware with CacheManager {
  
  RouteSettings? redirect(String? route) =>
      (getToken() != null || route == "/auth")
          ? null
          : RouteSettings(name: "/auth");
}
