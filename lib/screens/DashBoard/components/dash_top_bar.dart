import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:workify/controllers/LeavePage/AllEmployeeLeavesController.dart';
import 'package:workify/controllers/UserController.dart';
import 'package:workify/screens/DashBoard/components/tasks_icon.dart';
import 'package:workify/screens/HomePage/HomePageController.dart';
import 'package:workify/utils/constants.dart';
import 'package:workify/utils/responsive.dart';
import 'package:workify/utils/theme.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;
import 'package:localize_and_translate/localize_and_translate.dart' as ok;

class DashTopBar extends StatelessWidget {
  DashTopBar({Key? key}) : super(key: key);
  final user = Get.find<UserController>().currentUser;
  late String fname;
  String greeting() {
    var hour = DateTime.now().hour;
    fname = toBeginningOfSentenceCase(fname)!;
    if (hour < 12) return 'Good Morning, $fname';
    if (hour < 17)
      return translator.activeLanguageCode == 'ar'
          ? '${ok.translator.translate('Good Afternoon')}, $fname'
          : 'Good Afternoon $fname';
    return 'Good Evening, $fname';
  }

  final allEmpLeaveController = Get.find<AllEmployeeLeavesController>();

  @override
  Widget build(BuildContext context) {
    fname = user?.value.firstName ?? "Buddy";

    return Row(
      children: [
        true
            ? AnimatedTextKit(
                key: ValueKey<bool>(MyTheme().isDark(context)),
                animatedTexts: [
                  TyperAnimatedText(
                    greeting(),
                    speed: Duration(milliseconds: 50),
                    textStyle: Theme.of(context)
                        .primaryTextTheme
                        .headline1!
                        .copyWith(
                            color: MyTheme().isDark(context)
                                ? kTextDarkColor
                                : kTextColor),
                  ),
                ],
                totalRepeatCount: 1,
                displayFullTextOnTap: true,
                stopPauseOnTap: false,
              )
            : Text(greeting(),
                style: Responsivescreen.isMobile(context)
                    ? Theme.of(context).primaryTextTheme.headline5
                    : Theme.of(context).primaryTextTheme.headline1),
        Spacer(),
        InkWell(
          borderRadius: BorderRadius.circular(100),
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            translator.setNewLanguage(
              context,
              newLanguage: translator.activeLanguageCode == 'ar' ? 'en' : 'ar',
              remember: true,
              restart: true,
            );
          },
          child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: kDefaultPadding, horizontal: kDefaultPadding),
              child: Icon(Icons.language_outlined)),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(100),
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            Get.find<HomePageController>()
                .scaffoldKey
                .currentState
                ?.openEndDrawer();
          },
          child: Padding(
            padding: const EdgeInsets.only(
                top: kDefaultPadding,
                bottom: kDefaultPadding,
                right: kDefaultPadding * 2),
            child: Obx(() {
              return TasksIconWidget(
                counter: allEmpLeaveController.leaveList.length,
              );
            }),
          ),
        ),
        CircleAvatar(
          backgroundColor: Colors.transparent,
          //backgroundImage: AssetImage("assets/avatars/avatar${(fname.length)%15}.png"),
          foregroundImage:
              AssetImage("assets/avatars/avatar${(fname.hashCode) % 15}.png"),
          foregroundColor: Colors.black12,
          //child: Text(fname[0]),
        ),
      ],
    );
  }
}
