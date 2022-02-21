import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:workify/controllers/AuthController.dart';
import 'package:workify/controllers/UserController.dart';
import 'package:workify/controllers/profile_widgets_controller.dart';
import 'package:workify/mixins/cache.dart';
import 'package:workify/screens/AuthPage/AuthPage.dart';
import 'package:workify/screens/AuthPage/AuthPageController.dart';

// import 'package:workify/screens/AuthPage/ForgotPass.dart';
// import 'package:workify/screens/SettingsPage.dart';
import 'package:workify/screens/ChangePassword.dart';
import 'package:workify/screens/HomePage.dart';
import 'package:workify/screens/ProfileSection/ProfilePage.dart';
import 'package:workify/screens/ProfileSection/modify_profile_details.dart';
import 'package:workify/screens/SplashScreen/SplashScreen.dart';
import 'package:workify/utils/theme.dart';

import 'controllers/profile_details_controller.dart';


Future<void> main() async {
  setUrlStrategy(PathUrlStrategy());
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init('APP_SETTINGS');
  await GetStorage.init('USER');
  // final box = GetStorage('USER');
  // final res = box.read(CacheManagerKey.ACCESS_TOKEN.toString());
  // final boxt = GetStorage('APP_SETTINGS');
  // final rest = boxt.read(CacheManagerKey.THEME.toString());
  
  // print(res);
  // print(rest);

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with CacheManager {
  @override
  Widget build(BuildContext context) {
    final String theme =
        GetStorage("APP_SETTINGS").read(CacheManagerKey.THEME.toString()) ??
            ThemeMode.light.name;

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode:
          theme == ThemeMode.light.name ? ThemeMode.light : ThemeMode.dark,
      initialBinding: BindingsBuilder(() => {
            Get.put(AuthController()).checkLoginStatus(),
            Get.put(UserController())
          }),
      getPages: [
        GetPage(
          name: "/",
          page: () => SplashScreen(),
        ), //check for already signed in
        GetPage(
            name: "/auth",
            page: () => AuthPage(),
            binding: BindingsBuilder(() => {Get.put(AuthPageController())})),

        if (getToken() != null) GetPage(name: "/home", page: () => HomePage()),

        if(getToken() != null)
        GetPage(
          name: '/profile',
          page: () => ProfilePage(),
          binding: BindingsBuilder(() => {
            Get.put(ProfileWidgetsController()),
            Get.put(ProfileDetailsController()),
          }),
        ),
        // GetPage(
        //   name: "/forgot",
        //   page: () => ForgotPass(),
        // ),
        if(getToken() != null)
          GetPage(name: "/change-password", 
          page: () => ChangePassword()
        ),
        
        if(getToken() != null)
          GetPage(
            name: "/modify-employee-profile",
            page: () => ModifyProfileDetails(),
            binding: BindingsBuilder(() => {
              Get.put(ProfileWidgetsController()),
              Get.put(ProfileDetailsController()),
            }),
          ),
          
        // GetPage(
        //   name: '/settings',
        //   page: () => SettingsPage(),
        // ),
      ],
    );
  }
}
