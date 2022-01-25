import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:get/get.dart';
import 'package:workify/screens/AuthPage.dart';
import 'package:workify/screens/HomePage.dart';

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
      initialRoute: "/",
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: ThemeMode.light,
      getPages: [
        GetPage(
            name: "/",
            page: () =>
                false ? HomePage() : AuthPage()), //check for already signed in
        GetPage(name: "/auth", page: () => AuthPage()),
      ],
    );
  }
}
