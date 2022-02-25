import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:workify/components/button.dart';
import 'package:workify/controllers/WishController.dart';
import 'package:workify/screens/SplashScreen/splash_widget.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:workify/utils/constants.dart';
// import 'package:workify/utils/extensions.dart';

class WishCard extends GetView<WishController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.activeList == null) {
        return Text('Loading...');
      } else {
        return Padding(
          padding: const EdgeInsets.only(top: kDefaultPadding),
          child: Column(
            children: [
              controller.activeList.isEmpty
                  ? Center(
                      child: Text("Pardon, This list seems to be empty"),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.activeList.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      kDefaultPadding, 2, kDefaultPadding, 2),
                                  child: CircleAvatar(
                                      backgroundColor: Colors.primaries[index +
                                          ((controller.selectedIndex.value *
                                                  4) %
                                              Colors.primaries.length)],
                                      child: Text(
                                        controller
                                            .activeList[index].fullName[0],
                                      )),
                                ),
                                Text(
                                  controller.activeList[index].fullName +
                                      " (" +
                                      controller.activeList[index].empCode +
                                      ")",
                                  style: Theme.of(context).textTheme.subtitle1,
                                )
                              ],
                            ),
                            Divider(
                              indent: kDefaultPadding,
                              endIndent: kDefaultPadding,
                            )
                          ],
                        );
                      },
                    ),
              Spacer(),
              BottomNavigationBar(
                currentIndex: controller.selectedIndex.value,
                type: BottomNavigationBarType.fixed,
                backgroundColor: kPrimaryColor,
                unselectedItemColor: Colors.white60,
                selectedItemColor: Colors.white,
                selectedFontSize: 15.8,
                unselectedFontSize: 14,
                unselectedIconTheme: IconThemeData(opacity: 0, size: 0),
                selectedIconTheme: IconThemeData(opacity: 0, size: 0),
                items: [
                  menu(label: 'Birthdays'),
                  menu(label: 'Anniversaries'),
                  menu(label: 'New Joiners'),
                ],
                onTap: (index) {
                  controller.switchTabTo(index);
                },
              )
            ],
          ),
        );
      }
    });
  }

  menu({required String label}) {
    return BottomNavigationBarItem(label: label, icon: Icon(Icons.ac_unit));
  }
}
