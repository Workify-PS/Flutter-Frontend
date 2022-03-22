import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workify/controllers/AttendanceCardController.dart';
import 'package:workify/controllers/LeavePage/AllEmployeeLeavesApproveRejectController.dart';
import 'package:workify/controllers/LeavePage/leavePageController.dart';
import 'package:workify/controllers/WishController.dart';
import 'package:workify/controllers/fetch_all_employees_controller.dart';
import 'package:workify/controllers/LeavePage/AllEmployeeLeavesController.dart';
import 'package:workify/controllers/LeavePage/applyLeaveController.dart';
import 'package:workify/controllers/LeavePage/leavePageController.dart';
import 'package:workify/controllers/LeavePage/leaveStatusController.dart';
import 'package:workify/controllers/LeavePage/yourBalanceLeavesController.dart';
import 'package:workify/controllers/WishController.dart';
import 'package:workify/controllers/fetch_all_employees_controller.dart';
import 'package:workify/controllers/modify_employee_profile_details_controller.dart';

import 'package:workify/controllers/modify_profile_widgets_controller.dart';
import 'package:workify/controllers/profile_details_controller.dart';
import 'package:workify/controllers/profile_widgets_controller.dart';

import 'package:workify/screens/AttendancePage/AttendancePage.dart';
import 'package:workify/screens/AttendancePage/AttendanceShiftController.dart';
import 'package:workify/screens/DashBoard/DashBoard.dart';
import 'package:workify/screens/Error404.dart';
import 'package:workify/screens/HomePage/HomePageController.dart';
import 'package:workify/screens/LeavePage/AllEmployeeLeaves.dart';
import 'package:workify/screens/LeavePage/ApplyLeave.dart';
import 'package:workify/screens/LeavePage/LeavePage.dart';
import 'package:workify/screens/ProfileSection/ModifySelf_EmployeePosition_Employment/all_employee_profile.dart';
import 'package:workify/screens/ProfileSection/ModifySelf_EmployeePosition_Employment/modify_employee_profile_details.dart';
import 'package:workify/screens/ProfileSection/SelfProfileSection/ProfilePage.dart';
import 'package:workify/screens/SplashScreen/splash_widget.dart';

class HomeRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    print("Route name is " + settings.name.toString());
    switch (settings.name) {
       
      case "/home":
        return GetPageRoute(
          routeName: "/home",
          page: () => DashBoard(),
          settings: settings,
          binding: BindingsBuilder(() => {
                Get.lazyPut(() => WishCardController()),
                Get.put(AttendanceCardController()),
                Get.put(AllEmployeeLeavesController()),
                Get.put(ProfileDetailsController()),
                Get.put(AllEmployeeLeavesApproveRejcectController())
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
      case "/modify-employee-profile":
        return GetPageRoute(
          settings: settings,
          routeName: "/modify-employee-profile",
          page: () => ModifyEmployeeProfileDetails(),
          binding: BindingsBuilder(() => {
                // Get.lazyPut(() => ModifyProfileWidgetsController()),
                // Get.lazyPut(() => ProfileDetailsController()),
                // Get.lazyPut(() => ModifyEmployeeProfileDetailsController())
                Get.put(ModifyProfileWidgetsController()),
                Get.put(ProfileDetailsController()),
                Get.put(ModifyEmployeeProfileDetailsController())
              }),
        );
      case '/all-employee-profile':
        return GetPageRoute(
          settings: settings,
          routeName: '/all-employee-profile',
          page: () => AllEmployeeProfile(),
          binding: BindingsBuilder(() => {
                
                Get.put(FetchAllEmployeesController()),
              }),
        );
      case "/leave":
        return GetPageRoute(
          settings: settings,
          routeName: '/leave',
          page: () => LeavePage(),
          binding: BindingsBuilder(() => {
                // Get.lazyPut(() => ProfileDetailsController()),
                // Get.lazyPut(() => LeavePageController())
                Get.put(ProfileDetailsController()),
                Get.put(LeavePageController())
              }),
        );
      case "/apply-leave":
        return GetPageRoute(
          settings: settings,
          routeName: '/apply-leave',
          page: () => ApplyLeave(),
          binding: BindingsBuilder(() => {
                // Get.lazyPut(() => ProfileDetailsController()),
                // Get.lazyPut(() => ApplyLeaveController()),
                // Get.lazyPut(() => LeaveStatusController()),
                Get.put(ProfileDetailsController()),
                Get.put(ApplyLeaveController()),
                Get.put(YourBalanceLeavesController()),
                Get.put(LeaveStatusController())
              }),
        );
      case "/all-employee-leaves":
        return GetPageRoute(
          settings: settings,
          routeName: '/all-employee-leaves',
          page: () => AllEmployeeLeaves(),
          binding: BindingsBuilder(() => {
                // Get.lazyPut(() => AllEmployeeLeavesController()),
                // Get.put(AllEmployeeLeavesController())
              }),
        );

      case "/attendance":
        return GetPageRoute(
            settings: settings,
            routeName: '/attendance',
            page: () => AttendancePage(),
            binding:
                BindingsBuilder(() => {Get.put(AttendanceShiftController())}));

      default:
        print("UNKNOWN ROUTE RETURNING DEFAULT");
        return GetPageRoute(
          settings: settings,
          page: () => Error404(), //TODO: THROW 404
        );
    }
  }
}
