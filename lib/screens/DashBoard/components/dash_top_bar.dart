import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workify/controllers/UserController.dart';
import 'package:workify/utils/constants.dart';
import 'package:workify/utils/responsive.dart';
import 'package:workify/utils/theme.dart';

class DashTopBar extends StatelessWidget {
  DashTopBar({Key? key}) : super(key: key);
  final user = Get.find<UserController>().currentUser;
  late String fname;
  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) return 'Good Morning, $fname';
    if (hour < 17) return 'Good Afternoon, $fname';
    return 'Good Evening, $fname';
  }

  @override
  Widget build(BuildContext context) {
    fname = user?.value.firstName ?? "Buddy";
    double iconSize = 24;
    return Row(
      children: [
        // false
        //     ? AnimatedTextKit(
        //         animatedTexts: [
        //           TyperAnimatedText(
        //             greeting(),
        //             speed: Duration(milliseconds: 80),
        //             textStyle: Theme.of(context).primaryTextTheme.headline1,
        //           ),
        //         ],
        //         totalRepeatCount: 1,
        //         displayFullTextOnTap: true,
        //         stopPauseOnTap: false,
        //       )
        //     :
        Text(greeting(),
            style: Responsivescreen.isMobile(context)
                ? Theme.of(context).primaryTextTheme.headline5
                : Theme.of(context).primaryTextTheme.headline1),
        Spacer(),
        InkWell(
          borderRadius: BorderRadius.circular(100),
          splashColor: Colors.transparent,
          hoverColor:
              MyTheme().isDark(context) ? Colors.white30 : Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            //widget.parentScaffoldkey!.currentState!.openEndDrawer();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: kDefaultPadding, horizontal: kDefaultPadding * 2),
            child: Icon(
              Icons.notifications_outlined,
              size: iconSize,
            ),
          ),
        ),
        CircleAvatar(
          backgroundColor: Colors.transparent,
          //backgroundImage: AssetImage("assets/avatars/avatar${(fname.length)%15}.png"),
          foregroundImage: AssetImage("assets/avatars/avatar${(fname.length)%15}.png"),
          foregroundColor: Colors.black12,
          //child: Text(fname[0]),
        ),
      ],
    );
  }
}
