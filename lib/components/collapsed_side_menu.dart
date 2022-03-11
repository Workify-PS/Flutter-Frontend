import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workify/screens/HomePage/HomePageController.dart';
import 'package:flutter/cupertino.dart';

import 'package:workify/components/profile_sub_tiles.dart';
import 'package:workify/components/settings_sub_items.dart';
import 'package:workify/components/settings_sub_tiles.dart';
import 'package:workify/components/side_menu_item.dart';
import 'package:workify/routes/router.dart';
import 'package:workify/utils/assets.dart';

import 'package:workify/utils/constants.dart';
import 'package:workify/utils/theme.dart';

class CollapsedSideMenu extends GetView<HomePageController> {
  CollapsedSideMenu({Key? key}) : super(key: key);
  bool? exited;
  bool? entered;
  final icons = [
    Icons.home_filled,
    CupertinoIcons.person_fill,
    CupertinoIcons.square_list_fill,
    Icons.time_to_leave_rounded,
    //Icons.flag_outlined,
    CupertinoIcons.gear_alt_fill
  ];
  @override
  Widget build(BuildContext context) {
    Color dividerColor =
        !(MyTheme().isDark(context)) ? kDividerColor : kDividerDarkColor;
    return InkWell(
      onTap: () {},
      autofocus: false,

      onHover: (value) {
        
        controller.sideMenuCollapsed.value = !value;
      },
      child: Container(
        height: double.infinity,
        color: Theme.of(context).primaryColor,
        child: SingleChildScrollView(
          //controller: ScrollController(),
          physics: ScrollPhysics(),
          child: Column(
            children: [
              Container(
                height: bannerHeight,
                width: double.infinity,
                color: Theme.of(context).primaryColor,
                padding: const EdgeInsets.symmetric(
                    vertical: kDefaultPadding, horizontal: 12),
                child: Image.asset(
                  Assets.logo,
                  fit: BoxFit.fitWidth,
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
                    icons.length,
                    (index) => Padding(
                        padding: const EdgeInsets.only(
                            top: kDefaultPadding, bottom: kDefaultPadding),
                        child: Container(
                          padding: EdgeInsets.only(
                              bottom: kDefaultPadding * 1.5, right: 5),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: dividerColor),
                            ),
                          ),
                          child: Icon(
                            icons[index],
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        )),
                  ),
                ),
              ),
              SizedBox(height: kDefaultPadding),
            ],
          ),
        ),
      ),
    );
  }
}
