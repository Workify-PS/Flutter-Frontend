import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workify/utils/constants.dart';
import 'package:workify/utils/theme.dart';

import 'package:workify/screens/AuthPage/AuthController.dart';



class WrapSettingsSubItems extends StatelessWidget {
  const WrapSettingsSubItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SettingsSubItems();
  }
}

class SettingsSubItems extends StatefulWidget {
  const SettingsSubItems({Key? key}) : super(key: key);

  @override
  _SettingsSubItemsState createState() => _SettingsSubItemsState();
}

class _SettingsSubItemsState extends State<SettingsSubItems> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: kDefaultPadding / 1.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubTile(tileString: 'Preferences'),
            SubTile(tileString: 'Change Password'),
            SubTile(tileString: 'Log Out'),
          ],
        ));
  }
}

class SubTile extends StatelessWidget {
  String tileString;
  SubTile({
    Key? key,
    required this.tileString,
  }) : super(key: key);

  RxBool isSelected = false.obs;
final authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => InkWell(
          onTap: () {
            tileString == 'Preferences'
                ? print('Preferences Selected')
                : tileString == 'Change Password'
                    ? print('Change Password Selected')
                    : authController.logOut();
          },
          onHover: (value) => isSelected.value = value,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding * 1.5,
              vertical: kDefaultPadding / 1.4,
            ),
            child: Text(
              tileString,
              style: Theme.of(context).textTheme.button!.copyWith(
                  color: isSelected.value ? kPrimaryColor : kGrayColor,
                  fontSize: 13),
            ),
          ),
        ));
  }
}

