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
      final list = controller.getListAsPerIndex();
      if (list == null) {
        return Text('Loading...');
      } else {
        return Padding(
          padding: const EdgeInsets.only(top: kDefaultPadding),
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [Text(list[index].fullName)],
                  );
                },
              ),
              Spacer(),
              BottomNavigationBar(
                currentIndex: controller.selectedIndex.value,
                type: BottomNavigationBarType.fixed,
                backgroundColor: kPrimaryColor,
                unselectedItemColor: Colors.white54,
                selectedItemColor: Colors.white,
                selectedFontSize: 15.8,
                unselectedFontSize: 14,
                elevation: 10,
                enableFeedback: false,
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
