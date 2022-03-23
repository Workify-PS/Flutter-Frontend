import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:workify/components/collapsed_side_menu.dart';
import 'package:workify/components/side_menu.dart';
import 'package:workify/controllers/UserController.dart';
import 'package:workify/routes/home_routes.dart';
import 'package:workify/screens/AttendancePage/AttendancePage.dart';
import 'package:workify/screens/DashBoard/DashBoard.dart';
import 'package:workify/screens/DashBoard/components/notification_drawer.dart';
import 'package:workify/screens/HomePage/HomePageController.dart';
import 'package:workify/screens/LeavePage/LeavePage.dart';
import 'package:workify/screens/ProfileSection/SelfProfileSection/ProfilePage.dart';
import 'package:workify/utils/responsive.dart';
// import 'package:workify/utils/constants.dart';
import 'package:workify/utils/sizes.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomePageController> {
  final RxBool isCollapsed = true.obs;

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DeviceSize device = DeviceSize();
    device.size = MediaQuery.of(context).size;
    final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
    controller.scaffoldKey = _scaffoldkey;
    return WillPopScope(
      onWillPop: () async {
        print("ON POP");
        return false;
      },
      child: Obx(() => Responsivescreen(
            mobile: Scaffold(
                key: controller.scaffoldKey,
                drawer: Drawer(
                  child: SideMenu(),
                ),
                //backgroundColor:  Theme.of(context).scaffoldBackgroundColor,
                endDrawer: Drawer(),
                body: Navigator(
                  key: Get.nestedKey(1),
                  initialRoute: controller.pageName.value,
                  onGenerateRoute: HomeRouter.generateRoute,
                )),
            child: Directionality(
              textDirection: translator.activeLanguageCode == 'ar'
                  ? TextDirection.rtl
                  : TextDirection.ltr,
              child: Scaffold(
                key: controller.scaffoldKey,
                //backgroundColor:  Theme.of(context).scaffoldBackgroundColor,
                endDrawer: NotificationDrawer(),
                body: Row(
                  children: [
                    AnimatedContainer(
                      duration: Duration(milliseconds: 1000),
                      curve: Curves.linear,
                      height: double.infinity,
                      child: SizedBox(
                        child: controller.sideMenuCollapsed.value
                            ? CollapsedSideMenu()
                            : SideMenu(),
                        width: controller.sideMenuCollapsed.value ? 64 : 236,
                      ),
                    ),
                    Container(
                      width: 5,
                      height: double.infinity,
                      color: Colors.black12,
                    ),
                    Expanded(
                        child: Navigator(
                      key: Get.nestedKey(1),
                      initialRoute: controller.pageName.value,
                      onGenerateRoute: HomeRouter.generateRoute,
                    ))
                    //Expanded(child: controller.getScreen()),
                  ],
                ),

                // Row(
                //   children: [
                //     Obx(() => AnimatedContainer(
                //           duration: Duration(milliseconds: 200),
                //           curve: isCollapsed.value ? Curves.linear : Curves.linear,
                //           height: double.infinity,
                //           width: isCollapsed.value ? 76 : 224,
                //           child: MouseRegion(
                //             onEnter: (event) => isCollapsed.value = false,
                //             onExit: (event) => isCollapsed.value = true,
                //             child: Material(
                //               elevation: 100,
                //               color: Theme.of(context).primaryColor,
                //               borderOnForeground: true,
                //               type: MaterialType.card,
                //               shadowColor: Colors.black,
                //               shape: RoundedRectangleBorder(
                //                   borderRadius: BorderRadius.only(
                //                       topRight: Radius.circular(6),
                //                       bottomRight: Radius.circular(6))),
                //               child: ListView(
                //                 children: [
                //                   Container(
                //                     padding: EdgeInsets.symmetric(vertical: 24),
                //                     height: bannerHeight,
                //                     decoration: BoxDecoration(
                //                         border: Border.fromBorderSide(
                //                             BorderSide(color: Colors.black12))),
                //                     child: buildHeader(),
                //                   ),
                //                   // Divider(
                //                   //   color: kScaffoldColor,
                //                   //   thickness: 1,
                //                   // ),
                //                   buildTiles()
                //                 ],
                //               ),
                //             ),
                //           ),
                //         )),
                //     const SizedBox(
                //       width: 6,
                //     ),
                //     DashBoard(),
                //   ],
                // ),
              ),
            ),
          )),
    );
  }
}
