import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workify/controllers/fetch_all_employees_controller.dart';
import 'package:workify/controllers/modify_employee_profile_details_controller.dart';

import 'package:workify/utils/sizes.dart';
import 'package:workify/utils/constants.dart';

double screenWidth = 0, screenHeight = 0;
bool portrait = false;

class UserSpecificPerson extends StatelessWidget {
  final index;
  const UserSpecificPerson({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DeviceSize device = DeviceSize();
    device.size = MediaQuery.of(context).size;
    screenWidth = device.size.width;
    screenHeight = device.size.height;
    portrait = screenWidth < 1000;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          // color: Colors.black,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Avatar(),
            Name(
              index: index,
            ),
          ],
        ),
      ),
    );
  }
}

class Avatar extends StatelessWidget {
  const Avatar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      shape: CircleBorder(),
      clipBehavior: Clip.hardEdge,
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          // print('\n\n\n Will change avatar Later \n\n\n');
        },
        child: Ink.image(
          image: AssetImage('images/avatar.png'),
          fit: BoxFit.contain,
          width: portrait == true ? screenWidth * 0.2 : screenWidth * 0.25,
          height: portrait == true ? screenHeight * 0.2 : screenHeight * 0.25,
        ),
      ),
    );
  }
}

class Name extends StatelessWidget {
  final index;
  const Name({
    Key? key,
    required this.index,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: Text(fetchAllEmployeesController.allEmployeeList
          .elementAt(index)
          .fullName
          .toString()),
    );
  }
}
