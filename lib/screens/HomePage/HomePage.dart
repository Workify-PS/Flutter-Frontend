import 'package:flutter/material.dart';
import 'package:workify/components/side_menu.dart';
import 'package:workify/controllers/UserController.dart';
import 'package:workify/screens/AttendancePage/AttendancePage.dart';
import 'package:workify/screens/DashBoard.dart';
import 'package:workify/screens/HomePage/HomePageController.dart';
import 'package:workify/screens/LeavePage/LeavePage.dart';
import 'package:workify/screens/ProfileSection/SelfProfileSection/ProfilePage.dart';
// import 'package:workify/utils/constants.dart';
import 'package:workify/utils/sizes.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomePageController> {
  final RxBool isCollapsed = true.obs;

  HomePage({Key? key}) : super(key: key);

  // final pages = [DashBoard(), ProfilePage(), AttendancePage(), LeavePage()];
  @override
  Widget build(BuildContext context) {
    DeviceSize device = DeviceSize();
    device.size = MediaQuery.of(context).size;
    final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

    return Obx(() => Scaffold(
          key: _scaffoldkey,
          //backgroundColor:  Theme.of(context).scaffoldBackgroundColor,
          endDrawer: Drawer(),
          body: Row(
            children: [
              SizedBox(
                child: SideMenu(),
                width: 236,
              ),
              Container(
                width: 5,
                height: double.infinity,
                color: Colors.black12,
              ),
              Expanded(child: controller.getScreen()),
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
        ));
  }
}
