import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:workify/controllers/AuthController.dart';
import 'package:workify/screens/AuthPage.dart';
import 'package:workify/screens/ChangePass.dart';
import 'package:workify/screens/ForgotPass.dart';
import 'package:workify/screens/HomePage.dart';
import 'package:workify/screens/ProfileSection/ProfilePage.dart';
import 'package:workify/screens/SettingsPage.dart';
import 'package:workify/screens/SplashScreen/SplashScreen.dart';
import 'package:workify/utils/theme.dart';
import 'package:http/http.dart' as http;

Future<void> main() async {
  setUrlStrategy(PathUrlStrategy());
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: ThemeMode.light,
      initialBinding: BindingsBuilder(() => {Get.put(AuthController())}),
      getPages: [
        GetPage(
          name: "/",
          page: () => SplashScreen(),
        ), //check for already signed in
        GetPage(
          name: "/auth",
          page: () => AuthPage(),
        ),

        GetPage(name: "/home", page: () => HomePage()
            // false ? HomePage() : AuthPage() //check for already signed in
            ),
        GetPage(
          name: '/profile',
          page: () => ProfilePage(),
        ),
        GetPage(
          name: "/forgot",
          page: () => ForgotPass(),
        ),
        GetPage(name: "/change", page: () => ChangePass()),
        GetPage(
          name: '/settings',
          page: () => SettingsPage(),
        ),
      ],
    );
  }
}
