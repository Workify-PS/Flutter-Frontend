import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:workify/controllers/AuthController.dart';
import 'package:workify/controllers/UserController.dart';
import 'package:workify/controllers/fetch_all_employees_controller.dart';
import 'package:workify/controllers/profile_widgets_controller.dart';
import 'package:workify/mixins/cache.dart';
import 'package:workify/mixins/middleware.dart';
import 'package:workify/screens/AuthPage/AuthPage.dart';
import 'package:workify/screens/AuthPage/AuthPageController.dart';

// import 'package:workify/screens/AuthPage/ForgotPass.dart';
// import 'package:workify/screens/SettingsPage.dart';
import 'package:workify/screens/ChangePassword.dart';
import 'package:workify/screens/HomePage/HomePage.dart';
import 'package:workify/screens/HomePage/HomePageController.dart';
import 'package:workify/screens/LeavePage/LeavePage.dart';

import 'package:workify/screens/ProfileSection/ModifyEmployeeProfileSection/all_employee_profile.dart';
import 'package:workify/screens/ProfileSection/ModifyEmployeeProfileSection/modify_profile_details.dart';
import 'package:workify/screens/ProfileSection/SelfProfileSection/ProfilePage.dart';
import 'package:workify/screens/SplashScreen/SplashScreen.dart';
// import 'package:workify/services/fetch_all_employee_service.dart';
import 'package:workify/utils/theme.dart';

import 'controllers/modify_profile_widgets_controller.dart';
import 'controllers/profile_details_controller.dart';
import 'controllers/update_profile_details_controller.dart';

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

        GetPage(
            name: "/home",
            page: () => HomePage(),
            middlewares: [AuthMiddlware()],
            children: [
              GetPage(
                name: '/profile',
                page: () => ProfilePage(),
                binding: BindingsBuilder(() => {
                      Get.put(ProfileWidgetsController()),
                      Get.put(ProfileDetailsController()),
                    }),
              ),
              GetPage(name: "/change-password", page: () => ChangePassword()),
              GetPage(
                name: "/modify-employee-profile",
                page: () => ModifyProfileDetails(),
                binding: BindingsBuilder(() => {
                      Get.put(ModifyProfileWidgetsController()),
                      Get.put(ProfileDetailsController()),
                      Get.put(UpdateProfileDetailsController())
                    }),
              ),
              GetPage(
                name: '/all-employee-profile',
                page: () => AllEmployeeProfile(),
                binding: BindingsBuilder(
                    () => {Get.put(FetchAllEmployeesController())}),
              ),
              GetPage(
                name: '/leave',
                page: () => LeavePage(),
                binding: BindingsBuilder(() => {
                      Get.put(ProfileDetailsController()),
                    }),
              ),
            ],
            binding: BindingsBuilder(() => {Get.put(HomePageController())})),
      ],
    );
  }
}
