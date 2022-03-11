import 'package:flutter/material.dart';
import 'package:workify/models/LeavePage/AllEmployeeLeavesModel.dart';
import 'package:workify/utils/constants.dart';
import 'package:workify/utils/theme.dart';

class NotificationItem extends StatelessWidget {
  final AllEmployeeLeavesModel leave;
  const NotificationItem({Key? key,required this.leave}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color dividerColor =
        !(MyTheme().isDark(context)) ? kDividerColor : kDividerDarkColor;
    return Padding(
        padding: const EdgeInsets.only(
            top: kDefaultPadding, bottom: kDefaultPadding),
        child: Container(
          padding: EdgeInsets.only(bottom: kDefaultPadding * 1.5, right: 5),
          width: double.infinity,
          child: Text("Data"),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: dividerColor),
            ),
          ),
        ));
  }
}
