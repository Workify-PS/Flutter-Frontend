import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:get/get.dart';
import 'package:workify/screens/AuthPage.dart';
import 'package:workify/screens/ChangePass.dart';
import 'package:workify/screens/ForgotPass.dart';
import 'package:workify/screens/HomePage.dart';
import 'package:workify/screens/profilesection/profilePage.dart';
import 'package:workify/utils/theme.dart';

// import 'package:workify/components/profile_completion_card.dart';

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
      initialRoute: "/home",
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: ThemeMode.light,
      getPages: [
        // GetPage(
        //     name: "/",
        //     page: () =>
        //         false ? HomePage() : AuthPage()), //check for already signed in
        GetPage(name: "/auth", page: () => AuthPage()),

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
        // GetPage(
        //   name: '/card',
        //   page: () => ProfileCompletionCard(),
        // ),
      ],
    );
  }
}
