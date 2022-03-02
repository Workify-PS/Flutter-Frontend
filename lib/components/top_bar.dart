import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workify/controllers/UserController.dart';
import 'package:workify/mixins/cache.dart';
import 'package:workify/screens/HomePage/HomePageController.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:workify/utils/constants.dart';
import 'package:workify/utils/responsive.dart';
import 'package:workify/utils/theme.dart';

class TopBar extends StatelessWidget with CacheManager {
  final Widget? customTopBar;
  final String title;
  const TopBar({
    Key? key,
    this.customTopBar,
    required this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final scaffoldKey = Get.find<HomePageController>().scaffoldKey;
    return Responsive(
      mobile: AppBar(
        title: Text(title),
        leading: IconButton(
            onPressed: () {
              scaffoldKey.currentState?.openDrawer();
            },
            icon: Icon(Icons.menu_rounded)),
      ),
      child: Material(
        color: Theme.of(context).primaryColor,
        borderOnForeground: true,
        child: Container(
          height: bannerHeight,
          padding: const EdgeInsets.only(left: 36, right: 48),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customTopBar ??
                  Text(title,
                      style: Responsive.isMobile(context)
                          ? Theme.of(context).primaryTextTheme.headline5
                          : Theme.of(context).primaryTextTheme.headline1),
            ],
          ),
        ),
      ),
    );
  }
}
