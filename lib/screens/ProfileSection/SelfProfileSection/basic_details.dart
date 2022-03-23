// import 'dart:html';

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:workify/controllers/profile_details_controller.dart';
import 'package:workify/utils/sizes.dart';

import 'person.dart';
// import 'package:workify/utils/constants.dart';
// import './modify_history_buttons.dart';

double screenWidth = 0, screenHeight = 0;
bool portrait = false;

class BasicDetails extends StatelessWidget {
  const BasicDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DeviceSize device = DeviceSize();
    device.size = MediaQuery.of(context).size;
    screenWidth = device.size.width;
    screenHeight = device.size.height;

    portrait = screenWidth < 1000;

    return portrait == false
        ? Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                //color: Theme.of(context).scaffoldBackgroundColor,
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Person(),
                  ),
                  Expanded(
                    flex: 6,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            // color: Colors.red,
                            color: Colors.transparent,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BasicInfoString(basicInfoString: 'Mobile Number'),
                              BasicInfoString(basicInfoString: 'Date of Birth'),
                              BasicInfoString(
                                  basicInfoString: 'Marriage Status'),
                              BasicInfoString(basicInfoString: 'City'),
                              BasicInfoString(basicInfoString: 'State'),
                              BasicInfoString(basicInfoString: 'Country'),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 7,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FormattedBasicInfo(
                                    basicInfoString: 'Mobile Number'),
                                FormattedBasicInfo(
                                    basicInfoString: 'Date of Birth'),
                                FormattedBasicInfo(
                                    basicInfoString: 'Marriage Status'),
                                FormattedBasicInfo(basicInfoString: 'City'),
                                FormattedBasicInfo(basicInfoString: 'State'),
                                FormattedBasicInfo(basicInfoString: 'Country'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        : BasicDetailsPortraitView();
  }
}

class BasicDetailsPortraitView extends StatelessWidget {
  const BasicDetailsPortraitView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Person(),
        ),
        Expanded(
          flex: 6,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  // color: Colors.red,
                  color: Colors.transparent,
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BasicInfoString(basicInfoString: 'Mobile Number'),
                    BasicInfoString(basicInfoString: 'Date of Birth'),
                    BasicInfoString(basicInfoString: 'Marriage Status'),
                    BasicInfoString(basicInfoString: 'City'),
                    BasicInfoString(basicInfoString: 'State'),
                    BasicInfoString(basicInfoString: 'Country'),
                  ],
                ),
              ),
              Expanded(
                flex: 6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FormattedBasicInfo(basicInfoString: 'Mobile Number'),
                    FormattedBasicInfo(basicInfoString: 'Date of Birth'),
                    FormattedBasicInfo(basicInfoString: 'Marriage Status'),
                    FormattedBasicInfo(basicInfoString: 'City'),
                    FormattedBasicInfo(basicInfoString: 'State'),
                    FormattedBasicInfo(basicInfoString: 'Country'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class BasicInfoString extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final basicInfoString;

  const BasicInfoString({
    Key? key,
    required this.basicInfoString,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      basicInfoString,
      // style: TextStyle(
      //   color: kSecondaryColor,
      // ),
    );
  }
}

class FormattedBasicInfo extends StatelessWidget {
  String basicInfoString;
  FormattedBasicInfo({Key? key, required this.basicInfoString})
      : super(key: key);

  var string_2_BasicInfoMap = {
    'Mobile Number': MobileNumber(),
    'Date of Birth': DoB(),
    'Marriage Status': MarriageStatus(),
    'City': City(),
    'State': State(),
    'Country': Country(),
  };

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: portrait == true ? 200 : 250,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            ':',
            // style: TextStyle(
            //   color: kSecondaryColor,
            // ),
          ),
          Padding(
            padding: portrait == true
                ? const EdgeInsets.only(left: 32)
                : const EdgeInsets.only(left: 40),
            child: SizedBox(
              width: portrait == true ? 150 : 200,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: string_2_BasicInfoMap[basicInfoString],
                // child: Text(
                //   'Hi thereHi thereHi thereHi thereHi thereHi thereHi thereHi thereHi thereHi thereHi thereHi thereHi thereHi thereHi there',
                //   style: TextStyle(
                //     color: kSecondaryColor,
                //   ),
                // ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MobileNumber extends StatelessWidget {
  const MobileNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileDetailsController = Get.find<ProfileDetailsController>();
    return Obx(() {
      if (profileDetailsController.isLoading.value) {
        return Text(
          'Mobile Number Loading',
          // style: TextStyle(
          //   color: kSecondaryColor,
          // ),
        );
      } else {
        return Text(
          // 'HI',
          profileDetailsController.employeeInfoModelDetails?.mobile ??
              'Mobile Number Found Null',
          // style: TextStyle(
          //   color: kSecondaryColor,
          // ),
        );
      }
    });
  }
}

class MarriageStatus extends StatelessWidget {
  const MarriageStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileDetailsController = Get.find<ProfileDetailsController>();
    return Obx(() {
      if (profileDetailsController.isLoading.value) {
        return Text(
          'Marriage Status  Loading',
          // style: TextStyle(
          //   color: kSecondaryColor,
          // ),
        );
      } else {
        return Text(
          // 'HI',
          profileDetailsController.employeeInfoModelDetails?.marriageStatus ??
              'Marriage Status Found Null',
          // style: TextStyle(
          //   color: kSecondaryColor,
          // ),
        );
      }
    });
  }
}

class DoB extends StatelessWidget {
  const DoB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileDetailsController = Get.find<ProfileDetailsController>();
    return Obx(() {
      if (profileDetailsController.isLoading.value) {
        return Text(
          'Date of Birth Loading',
          // style: TextStyle(
          //   color: kSecondaryColor,
          // ),
        );
      } else {
        if (profileDetailsController.checkValidDate(
            profileDetailsController.employeeInfoModelDetails?.dob)) {
          return Text(
            DateFormat.yMMMMd('en_US').format(DateTime.parse(
                profileDetailsController.employeeInfoModelDetails?.dob)),
            // style: TextStyle(
            //   color: kSecondaryColor,
            // ),
          );
        } else {
          return Text(
            'Invalid date found',
            // style: TextStyle(
            //   color: kSecondaryColor,
            // ),
          );
        }
      }
    });
  }
}

class City extends StatelessWidget {
  const City({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileDetailsController = Get.find<ProfileDetailsController>();
    return Obx(() {
      if (profileDetailsController.isLoading.value) {
        return Text(
          'City Loading',
          // style: TextStyle(
          //   color: kSecondaryColor,
          // ),
        );
      } else {
        return Text(
          // 'HI',
          profileDetailsController.employeeInfoModelDetails?.city ??
              'City Found Null',
          // style: TextStyle(
          //   color: kSecondaryColor,
          // ),
        );
      }
    });
  }
}

class State extends StatelessWidget {
  const State({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileDetailsController = Get.find<ProfileDetailsController>();
    return Obx(() {
      if (profileDetailsController.isLoading.value) {
        return Text(
          'State Loading',
          // style: TextStyle(
          //   color: kSecondaryColor,
          // ),
        );
      } else {
        return Text(
          // 'HI',
          profileDetailsController.employeeInfoModelDetails?.state ??
              'State Found Null',
          // style: TextStyle(
          //   color: kSecondaryColor,
          // ),
        );
      }
    });
  }
}

class Country extends StatelessWidget {
  const Country({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileDetailsController = Get.find<ProfileDetailsController>();
    return Obx(() {
      if (profileDetailsController.isLoading.value) {
        return Text(
          'Country Loading',
          // style: TextStyle(
          //   color: kSecondaryColor,
          // ),
        );
      } else {
        return Text(
          // 'HI',
          profileDetailsController.employeeInfoModelDetails?.country ??
              'Country Found Null',
          // style: TextStyle(
          //   color: kSecondaryColor,
          // ),
        );
      }
    });
  }
}
