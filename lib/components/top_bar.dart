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
  final Widget? extendedWidget;
  final double? height;
  const TopBar({
    Key? key,
    this.customTopBar,
    required this.title,
    this.extendedWidget,
    this.height = bannerHeight,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final scaffoldKey = Get.find<HomePageController>().scaffoldKey;
    return Responsivescreen(
      mobile: AppBar(
        title: Text(title),
        bottom: extendedWidget == null
            ? null
            : PreferredSize(
                child: extendedWidget!,
                preferredSize: Size.fromHeight(bannerHeight),
              ),
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
          height: height,
          padding: extendedWidget == null
              ? const EdgeInsets.only(left: 36, right: 48)
              : const EdgeInsets.only(
                  left: 36,
                  right: 48,
                  top: kDefaultPadding / 1.5,
                ),
          child: Column(
            mainAxisAlignment: extendedWidget == null
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            crossAxisAlignment: extendedWidget == null
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
            children: [
              customTopBar ??
                  Text(title,
                      style: Responsivescreen.isMobile(context)
                          ? Theme.of(context).primaryTextTheme.headline5
                          : Theme.of(context).primaryTextTheme.headline1),
              if (extendedWidget != null) Spacer(),
              if (extendedWidget != null) extendedWidget!
            ],
          ),
        ),
      ),
    );
  }
}
