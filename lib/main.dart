import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:get/get.dart';
import 'package:workify/screens/auth_page.dart';
import 'package:workify/screens/home_page.dart';
import 'package:workify/screens/profilesection/profilePage.dart';

import 'package:workify/utils/theme.dart';

Future<void> main() async {
  setUrlStrategy(PathUrlStrategy());
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
      initialRoute: "/profile",
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: ThemeMode.light,
      getPages: [
        GetPage(
            name: "/home",
            page: () => HomePage()
                // false ? HomePage() : AuthPage() //check for already signed in
        ), 
        GetPage(
          name: "/auth", page: () => AuthPage(),
        ),
        GetPage(
          name: '/profile',
          page: () => ProfilePage(),
        ),
      ],
    );
  }
}
