// import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workify/components/leave_sub_tiles.dart';
import 'package:workify/components/profile_sub_tiles.dart';
import 'package:workify/components/settings_sub_items.dart';
import 'package:workify/components/settings_sub_tiles.dart';
import 'package:workify/components/side_menu_item.dart';
import 'package:workify/routes/router.dart';
import 'package:workify/screens/HomePage/HomePageController.dart';
import 'package:workify/utils/assets.dart';
import 'package:workify/utils/constants.dart';

class SideMenu extends GetView<HomePageController> {
  SideMenu({Key? key}) : super(key: key);
  final titles = [
    "Home",
    "Profile",
    "Attendance",
    "Leave",
    //"Report",
    "Settings"
  ];
  final icons = [
    Icons.home_outlined,
    CupertinoIcons.person,
    CupertinoIcons.square_favorites,
    Icons.time_to_leave_outlined,
    //Icons.flag_outlined,
    CupertinoIcons.gear_alt
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: Theme.of(context).primaryColor,
      child: MouseRegion(
        onExit: (event) {
          if (controller.pageName.value != Routes.home) {
            controller.sideMenuCollapsed.value = true;
          }
        },
        // onExit: (event) {
        //   controller.sideMenuCollapsed.value = true;
        // },
        child: SafeArea(
          child: SingleChildScrollView(
            //controller: ScrollController(),
            physics: ScrollPhysics(),
            child: Column(
              children: [
                Container(
                  height: bannerHeight,
                  width: double.infinity,
                  color: Theme.of(context).primaryColor,
                  padding: const EdgeInsets.all(16),
                  child: Image.asset(
                    Assets.banner,
                    fit: BoxFit.contain,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  // child: FlutterLogo(
                  //   size: 64,
                  // ),
                ),
                SizedBox(height: kDefaultPadding),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        titles.length,
                        (index) => SideMenuItem(
                              icon: icons[index],
                              title: titles[index],
                              subTilesWidget:
                                  generateSubTilesList(titles[index]),
                            )),
                  ),
                ),
                SizedBox(height: kDefaultPadding * 2),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget? generateSubTilesList(String title) {
    switch (title.toLowerCase()) {
      case "settings":
        return SettingsSubTiles();
      case "profile":
        return ProfileSubTiles();
      case "leave":
        return LeaveSubTiles();
      default:
        return null;
    }
  }
}
