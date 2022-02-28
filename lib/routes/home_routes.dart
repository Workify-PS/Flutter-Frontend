import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workify/controllers/LeavePage/leavePageController.dart';
import 'package:workify/controllers/WishController.dart';
import 'package:workify/controllers/fetch_all_employees_controller.dart';
import 'package:workify/controllers/modify_profile_details_controller.dart';
import 'package:workify/controllers/modify_profile_widgets_controller.dart';
import 'package:workify/controllers/profile_details_controller.dart';
import 'package:workify/controllers/profile_widgets_controller.dart';

import 'package:workify/screens/AttendancePage/AttendancePage.dart';
import 'package:workify/screens/ChangePassword.dart';
import 'package:workify/screens/DashBoard/DashBoard.dart';
import 'package:workify/screens/LeavePage/LeavePage.dart';
import 'package:workify/screens/ProfileSection/ModifyEmployeeProfileSection/all_employee_profile.dart';
import 'package:workify/screens/ProfileSection/ModifyEmployeeProfileSection/modify_profile_details.dart';
import 'package:workify/screens/ProfileSection/SelfProfileSection/ProfilePage.dart';
import 'package:workify/screens/SplashScreen/splash_widget.dart';

class HomeRouter {
  static List<GetPage> getHomePages() => [
        GetPage(
          name: '/home',
          page: () => DashBoard(),
          binding: BindingsBuilder(() => {
                Get.lazyPut(() => WishController()),
              }),
        ),
        GetPage(
          name: '/profile',
          page: () => ProfilePage(),
          binding: BindingsBuilder(() => {
                Get.lazyPut(() => ProfileWidgetsController()),
                Get.lazyPut(() => ProfileDetailsController()),
              }),
        ),
        GetPage(name: "/change-password", page: () => ChangePassword()),
        GetPage(
          name: "/modify-employee-profile",
          page: () => ModifyProfileDetails(),
          binding: BindingsBuilder(() => {
                Get.lazyPut(() => ModifyProfileWidgetsController()),
                Get.lazyPut(() => ProfileDetailsController()),
                Get.lazyPut(() => UpdateProfileDetailsController())
              }),
        ),
        GetPage(
          name: '/all-employee-profile',
          page: () => AllEmployeeProfile(),
          binding: BindingsBuilder(
              () => {Get.lazyPut(() => FetchAllEmployeesController())}),
        ),
        GetPage(
          name: '/leave',
          page: () => LeavePage(),
          binding: BindingsBuilder(() => {
                Get.lazyPut(() => ProfileDetailsController()),
              }),
        ),
      ];

  static Route<dynamic> generateRoute(RouteSettings settings) {
    print("Route name is " + settings.name.toString());
    switch (settings.name) {
      case "/home":
        return GetPageRoute(
          routeName: "/home",
          page: () => DashBoard(),
          settings: settings,
          binding: BindingsBuilder(() => {
                Get.lazyPut(() => WishController()),
              }),
        );
      case "/profile":
        return GetPageRoute(
          page: () => ProfilePage(),
          routeName: "/profile",
          settings: settings,
          binding: BindingsBuilder(() => {
                Get.lazyPut(() => ProfileWidgetsController()),
                Get.lazyPut(() => ProfileDetailsController()),
              }),
        );
      case "/change-password":
        return GetPageRoute(
            settings: settings,
            routeName: "/change-password",
            page: () => ChangePassword());
      case "/modify-employee-profile":
        return GetPageRoute(
          settings: settings,
          routeName: "/modify-employee-profile",
          page: () => ModifyProfileDetails(),
          binding: BindingsBuilder(() => {
                Get.lazyPut(() => ModifyProfileWidgetsController()),
                Get.lazyPut(() => ProfileDetailsController()),
                Get.lazyPut(() => UpdateProfileDetailsController())
              }),
        );
      case '/all-employee-profile':
        return GetPageRoute(
          settings: settings,
          routeName: '/all-employee-profile',
          page: () => AllEmployeeProfile(),
          binding: BindingsBuilder(
              () => {Get.lazyPut(() => FetchAllEmployeesController())}),
        );
      case "/leave":
        return GetPageRoute(
          settings: settings,
          routeName: '/leave',
          page: () => LeavePage(),
          binding: BindingsBuilder(() => {
                Get.lazyPut(() => ProfileDetailsController()),
                Get.lazyPut(() => LeavePageController())
              }),
        );

      case "/attendance":
        return GetPageRoute(
          settings: settings,
          routeName: '/attendance',
          page: () => AttendancePage(),
        );
      default:
        print("UNKNOWN ROUTE RETURNING DEFAULT");
        return GetPageRoute(
          settings: settings,
          page: () => LoadingWidget(), //TODO: THROW 404
        );
    }
  }
}
