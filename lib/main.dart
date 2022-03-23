import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:workify/screens/AuthPage/AuthController.dart';
// import 'package:workify/controllers/LeavePage/AllEmployeeLeavesController.dart';
// import 'package:workify/controllers/LeavePage/applyLeaveController.dart';
// import 'package:workify/controllers/LeavePage/LeaveStatusController.dart';
import 'package:workify/controllers/UserController.dart';
// import 'package:workify/controllers/fetch_all_employees_controller.dart';
// import 'package:workify/controllers/LeavePage/leavePageController.dart';
// import 'package:workify/controllers/profile_widgets_controller.dart';
import 'package:workify/mixins/cache.dart';
import 'package:workify/mixins/middleware.dart';
import 'package:workify/screens/AuthPage/AuthPage.dart';
import 'package:workify/screens/AuthPage/AuthPageController.dart';
import 'package:workify/screens/Error404.dart';
import 'package:workify/screens/HomePage/HomePageController.dart';
import 'package:workify/screens/SplashScreen/OnBoarding.dart';
import 'package:workify/screens/SplashScreen/splash_widget.dart';
import 'package:workify/utils/constants.dart';
import 'package:workify/utils/theme.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  setUrlStrategy(PathUrlStrategy());
  WidgetsFlutterBinding.ensureInitialized();
   await translator.init(
    localeType: LocalizationDefaultType.device,
    languagesList: <String>['ar', 'en'],
    assetsDirectory: 'assets/lang/',
    
  );
  await GetStorage.init('APP_SETTINGS');
  
  await GetStorage.init('USER');
  await Firebase.initializeApp();
  await dotenv.load(fileName: ".env");
  port = dotenv.env['PORT'];
  ip = dotenv.env['IP'];
  runApp(LocalizedApp(child:MyApp()));
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
      localizationsDelegates: translator.delegates, 
      locale: translator.activeLocale, 
      supportedLocales: translator.locals(), 
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode:
          theme == ThemeMode.light.name ? ThemeMode.light : ThemeMode.dark,
      initialBinding: BindingsBuilder(() => {
            Get.put(AuthController()).checkLoginStatus(),
            Get.put(UserController()),
            Get.put(HomePageController())
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
        ),
        GetPage(
          name: '/loading',
          page: () => SplashWidget(),
        )
      ],
    );
  }
}
