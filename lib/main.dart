import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:workify/controllers/AuthController.dart';
import 'package:workify/controllers/UserController.dart';
import 'package:workify/mixins/cache.dart';
import 'package:workify/mixins/middleware.dart';
import 'package:workify/screens/AuthPage/AuthPage.dart';
import 'package:workify/screens/AuthPage/AuthPageController.dart';
import 'package:workify/screens/Error404.dart';
import 'package:workify/screens/SplashScreen/SplashScreen.dart';
import 'package:workify/utils/theme.dart';

Future<void> main() async {
  setUrlStrategy(PathUrlStrategy());
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init('APP_SETTINGS');
  await GetStorage.init('USER');

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
          page: () => OnBoardingScreen(),
          middlewares: [AuthMiddlware()],
        ), //check for already signed in
        GetPage(
            name: "/auth",
            page: () => AuthPage(),
            binding: BindingsBuilder(() => {Get.put(AuthPageController())})),
        GetPage(
          name: "/page-not-found",
          page: () => Error404(),
        )
      ],
    );
  }
}
