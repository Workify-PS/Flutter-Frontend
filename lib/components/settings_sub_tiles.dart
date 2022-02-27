import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workify/controllers/AuthController.dart';
import 'package:workify/mixins/cache.dart';
import 'package:workify/utils/constants.dart';
import 'package:workify/utils/theme.dart';

class SettingsSubTiles extends StatelessWidget {
  const SettingsSubTiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: kDefaultPadding / 1.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WrapChangeTheme(),
            SettingsSubTile(settingsOptions: 'Change Password'),
            SettingsSubTile(settingsOptions: 'Log Out'),
          ],
        ));
  }
}

// ignore: must_be_immutable
class SettingsSubTile extends StatelessWidget {
  final authController = Get.find<AuthController>();

  String settingsOptions;
  SettingsSubTile({Key? key, required this.settingsOptions}) : super(key: key);
  RxBool isSelected = false.obs;
  @override
  Widget build(BuildContext context) {
    return Obx(() => InkWell(
          onTap: () {
            settingsOptions == 'Change Theme'
                ? WrapChangeTheme()
                : settingsOptions == 'Change Password'
                    ? Get.toNamed('/change-password',id: 1)
                    : authController.callLogOut();
          },
          onHover: (value) => isSelected.value = value,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding * 1.5,
              vertical: kDefaultPadding / 1.4,
            ),
            child: Text(
              settingsOptions,
              style: Theme.of(context).textTheme.button!.copyWith(
                  color: isSelected.value ? kPrimaryColor : kGrayColor,
                  fontSize: 13),
            ),
          ),
        ));
  }
}

class WrapChangeTheme extends StatelessWidget {
  const WrapChangeTheme({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding * 0.8,
        vertical: kDefaultPadding / 1.4,
      ),
      child: ChangeTheme(),
    );
  }
}

class ChangeTheme extends StatefulWidget {
  const ChangeTheme({Key? key}) : super(key: key);

  @override
  _ChangeThemeState createState() => _ChangeThemeState();
}

class _ChangeThemeState extends State<ChangeTheme> with CacheManager {
  var _icon;

  @override
  Widget build(BuildContext context) {
    setState(() {
      if (MyTheme().isDark(context) == true) {
        _icon = Icons.wb_sunny;
      } else {
        _icon = Icons.brightness_2;
      }
    });
    return IconButton(
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
