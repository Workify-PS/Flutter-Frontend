// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workify/screens/AuthPage/AuthController.dart';
import 'package:workify/mixins/cache.dart';
import 'package:workify/screens/AuthPage/PasswordRelated/ChangePasswordWidget.dart';
import 'package:workify/screens/HomePage/HomePageController.dart';
import 'package:workify/services/change_password_service.dart';
import 'package:workify/utils/constants.dart';
import 'package:workify/utils/sizes.dart';
import 'package:workify/utils/theme.dart';

class SettingsSubTiles extends StatelessWidget {
  SettingsSubTiles({Key? key}) : super(key: key);
  final authController = Get.find<AuthController>();
  final homePageController = Get.find<HomePageController>();

  double screenWidth = 0, screenHeight = 0;

  @override
  Widget build(BuildContext context) {
    DeviceSize device = DeviceSize();
    device.size = MediaQuery.of(context).size;
    screenWidth = device.size.width;
    screenHeight = device.size.height;

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
              onTap: () {
                Get.defaultDialog(
                    navigatorKey: Get.keys[1],
                    radius: 8,
                    backgroundColor: Colors.grey.shade200,
                    barrierDismissible: false,
                    title: 'Change Password',
                    content: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: screenWidth / 2,
                        height: screenHeight / 3,
                        child: Row(
                          children: [
                            Expanded(flex: 5, child: ChangePasswordWidget()),
                          ],
                        ),
                      ),
                    ));
              },
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
          padding: EdgeInsets.only(
            left: kDefaultPadding * 1.5,
            top: kDefaultPadding / 1.4,
            bottom: trailingWidget != null ? 0 : kDefaultPadding / 1.4,
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

    // return true
    //     ?
    return Switch(
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
    );
    // : IconButton(
    //     icon: Icon(
    //       _icon,
    //       size: 30,
    //     ),
    //     onPressed: () {
    //       setState(() {
    //         if (_icon == Icons.wb_sunny) {
    //           Get.changeThemeMode(ThemeMode.light);
    //           saveAppSettings(ThemeMode.light);
    //         } else {
    //           Get.changeThemeMode(ThemeMode.dark);
    //           saveAppSettings(ThemeMode.dark);
    //         }
    //       });
    //     },
    //   );
  }
}
