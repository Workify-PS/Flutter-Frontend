import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workify/controllers/profile_details_controller.dart';

import 'package:workify/utils/sizes.dart';
import 'package:workify/utils/constants.dart';

double screenWidth = 0, screenHeight = 0;
bool portrait = false;

final profileDetailsController = Get.put(ProfileDetailsController());

class Person extends StatelessWidget {
  const Person({Key? key}) : super(key: key);

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
        //width: screenWidth,
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
            Name(),
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
  const Name({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (profileDetailsController.isLoading.value) {
        return Text(
          'Loading',
          style: TextStyle(
            color: kSecondaryColor,
          ),
        );
      } else {
        return Padding(
          padding: const EdgeInsets.only(top: kDefaultPadding),
          child: Text(
            // 'Avatar Name',
            profileDetailsController.employeeInfoModelDetails?.fullName ??
                'Got Null',
            style: TextStyle(
              // fontSize: screenWidth * 0.017,
              fontWeight: FontWeight.bold,
              // color: kSecondaryColor,
            ),
          ),
        );
      }
    });
  }
}
