import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workify/controllers/AuthController.dart';
import 'package:workify/screens/ChangePassword.dart';
import 'package:workify/utils/constants.dart';

class SettingsSubTiles extends StatelessWidget {
  const SettingsSubTiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: kDefaultPadding / 1.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SettingsSubTile(settingsOptions: 'Preferences'),
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
            settingsOptions == 'Preferences'
                ? print('Preferences Selected')
                : settingsOptions == 'Change Password'
                    ? Get.toNamed('/change-password')
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
