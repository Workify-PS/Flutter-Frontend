import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workify/controllers/AuthController.dart';
import 'package:workify/mixins/cache.dart';
import 'package:workify/screens/HomePage/HomePageController.dart';
import 'package:workify/utils/constants.dart';
import 'package:workify/utils/theme.dart';

class SettingsSubTiles extends StatelessWidget {
  SettingsSubTiles({Key? key}) : super(key: key);
  final authController = Get.find<AuthController>();
  final homePageController=Get.find<HomePageController>();
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: kDefaultPadding / 1.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SettingsSubTile(
              settingsOptions: 'Switch Theme',
              onTap: null,
              trailingWidget: ChangeThemeButton(),
            ),
            SettingsSubTile(
              settingsOptions: 'Change Password',
              onTap: () => homePageController.gotoPage("/change-password", context),
            ),
            SettingsSubTile(
              settingsOptions: 'Log Out',
              onTap: () => authController.logOutDialog(),
            ),
          ],
        ));
  }
}

// ignore: must_be_immutable
class SettingsSubTile extends StatelessWidget {
  VoidCallback? onTap;
  String settingsOptions;
  Widget? trailingWidget;
  SettingsSubTile(
      {Key? key,
      required this.settingsOptions,
      required this.onTap,
      this.trailingWidget})
      : super(key: key);
  RxBool isHovered = false.obs;
  @override
  Widget build(BuildContext context) {
    return Obx(() => Padding(
          padding:  EdgeInsets.only(
            left: kDefaultPadding * 1.5,
            top: kDefaultPadding / 1.4,
            bottom:trailingWidget!=null?0: kDefaultPadding / 1.4,
          ),
          child: InkWell(
            onTap: onTap,
            onHover: (value) => isHovered.value = value,
            child: Row(
              children: [
                Text(
                  settingsOptions,
                  style: Theme.of(context).textTheme.button!.copyWith(
                      color: isHovered.value ? kPrimaryColor : kGrayColor,
                      fontSize: 13),
                ),
                Spacer(),
                if (trailingWidget != null) trailingWidget!
              ],
            ),
          ),
        ));
  }
}

class ChangeThemeButton extends StatefulWidget {
  const ChangeThemeButton({Key? key}) : super(key: key);

  @override
  _ChangeThemeButtonState createState() => _ChangeThemeButtonState();
}

class _ChangeThemeButtonState extends State<ChangeThemeButton>
    with CacheManager {
  var _icon;
  late bool isDarkMode;
  @override
  Widget build(BuildContext context) {
    isDarkMode = MyTheme().isDark(context);

    return true
        ? Switch(
          // hoverColor: Colors.transparent,
          // focusColor: Colors.transparent,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          mouseCursor: MouseCursor.uncontrolled,
            activeColor: kPrimaryColor,
            value: isDarkMode,
            onChanged: (value) {
              setState(() {
                isDarkMode = value;
                if (isDarkMode) {
                  Get.changeThemeMode(ThemeMode.dark);
                  saveAppSettings(ThemeMode.dark);
                } else {
                  Get.changeThemeMode(ThemeMode.light);
                  saveAppSettings(ThemeMode.light);
                }
              });
            },
          )
        : IconButton(
            icon: Icon(
              _icon,
              size: 30,
            ),
            onPressed: () {
              setState(() {
                if (_icon == Icons.wb_sunny) {
                  Get.changeThemeMode(ThemeMode.light);
                  saveAppSettings(ThemeMode.light);
                } else {
                  Get.changeThemeMode(ThemeMode.dark);
                  saveAppSettings(ThemeMode.dark);
                }
              });
            },
          );
  }
}
