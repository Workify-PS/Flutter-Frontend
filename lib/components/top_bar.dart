import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workify/controllers/UserController.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:workify/utils/constants.dart';
import 'package:workify/utils/theme.dart';

class TopBar extends StatefulWidget {
  final GlobalKey<ScaffoldState> parentScaffoldkey;
  const TopBar({
    Key? key,
    required this.parentScaffoldkey,
  }) : super(key: key);

  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  final user = Get.find<UserController>().currentUser.value;
  late String fname;
  String greeting() {
     fname = user?.firstName ?? "Buddy";
    var hour = DateTime.now().hour;
    if (hour < 12) return 'Good Morning, $fname';
    if (hour < 17) return 'Good Afternoon $fname';
    return 'Good Evening $fname';
  }

  @override
  Widget build(BuildContext context) {
    double iconSize = 24;
    return Material(
      color: Theme.of(context).primaryColor,
      borderOnForeground: true,
      child: Container(
        height: bannerHeight,
        padding: const EdgeInsets.only(left: 36, right: 48),
        child: Row(
          children: [
            false
                ? AnimatedTextKit(
                    animatedTexts: [
                      TyperAnimatedText(
                        greeting(),
                        speed: Duration(milliseconds: 80),
                        textStyle: Theme.of(context).primaryTextTheme.headline1,
                      ),
                    ],
                    totalRepeatCount: 1,
                    displayFullTextOnTap: true,
                    stopPauseOnTap: false,
                  )
                : Text(greeting(),
                    style: Theme.of(context).primaryTextTheme.headline1),
            Spacer(),
            InkWell(
              borderRadius: BorderRadius.circular(100),
              splashColor: Colors.transparent,
              hoverColor: MyTheme().isDark(context)
                  ? Colors.white30
                  : Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                widget.parentScaffoldkey.currentState!.openEndDrawer();
              },
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Icon(
                  Icons.notifications_outlined,
                  size: iconSize,
                ),
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(100),
              radius: 100,
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                final themeTobeChanged = MyTheme().isDark(context)
                    ? ThemeMode.light
                    : ThemeMode.dark;
                Get.changeThemeMode(themeTobeChanged);
              },
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Icon(
                  Icons.switch_camera_outlined,
                  size: iconSize,
                ),
              ),
            ),
            SizedBox(width: kDefaultPadding),
            CircleAvatar(
              backgroundColor: kBadgeColor,
              child: Text(fname[0]),
            ),
          ],
        ),
      ),
    );
  }
}
