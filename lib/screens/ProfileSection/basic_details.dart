// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:workify/utils/sizes.dart';

import 'person.dart';
import '../../controllers/profile_details_controller.dart';
import 'package:workify/utils/constants.dart';
// import './modify_history_buttons.dart';

double screenWidth = 0, screenHeight = 0;
bool portrait = false;

final profileDetailsController = Get.put(ProfileDetailsController());

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
                color: Colors.transparent,
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
                                FormattedMobileNumber(),
                                FormattedDoB(),
                                FormattedCity(),
                                FormattedState(),
                                FormattedCountry(),
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
                    FormattedMobileNumber(),
                    FormattedDoB(),
                    FormattedCity(),
                    FormattedState(),
                    FormattedCountry(),
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
      style: TextStyle(
        color: kSecondaryColor,
      ),
    );
  }
}


class MobileNumber extends StatelessWidget {
  const MobileNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (profileDetailsController.isLoading.value) {
        return Text(
          'Mobile Number Loading',
          style: TextStyle(
            color: kSecondaryColor,
          ),
        );
      } else {
        return Text(
          // 'HI',
          profileDetailsController.profileModelDetails?.mobile ??
              'Mobile Number Null',
          style: TextStyle(
            color: kSecondaryColor,
          ),
        );
      }
    });
  }
}

class DoB extends StatelessWidget {
  const DoB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Obx(() {
        if (profileDetailsController.isLoading.value) {
          return Text(
            'Date of Birth Loading',
            style: TextStyle(
              color: kSecondaryColor,
            ),
          );
        } 
        else {
          if (profileDetailsController.checkValidDate(profileDetailsController.profileModelDetails?.dob)) {
            return Text(
                DateFormat.yMMMMd('en_US').format(DateTime.parse(profileDetailsController.profileModelDetails?.dob)),
                style: TextStyle(
                  color: kSecondaryColor,
                ),
              );
          } 
          else {
            return Text(
            'Invalid date found',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            );
          }
        }
      }
    );
  }
}

class City extends StatelessWidget {
  const City({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (profileDetailsController.isLoading.value) {
        return Text(
          'City Loading',
          style: TextStyle(
            color: kSecondaryColor,
          ),
        );
      } else {
        return Text(
          // 'HI',
          profileDetailsController.profileModelDetails?.city ?? 'City Null',
          style: TextStyle(
            color: kSecondaryColor,
          ),
        );
      }
    });
  }
}

class State extends StatelessWidget {
  const State({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (profileDetailsController.isLoading.value) {
        return Text(
          'State Loading',
          style: TextStyle(
            color: kSecondaryColor,
          ),
        );
      } else {
        return Text(
          // 'HI',
          profileDetailsController.profileModelDetails?.state ?? 'State Null',
          style: TextStyle(
            color: kSecondaryColor,
          ),
        );
      }
    });
  }
}

class Country extends StatelessWidget {
  const Country({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (profileDetailsController.isLoading.value) {
        return Text(
          'Country Loading',
          style: TextStyle(
            color: kSecondaryColor,
          ),
        );
      } else {
        return Text(
          // 'HI',
          profileDetailsController.profileModelDetails?.country ??
              'Country Null',
          style: TextStyle(
            color: kSecondaryColor,
          ),
        );
      }
    });
  }
}


class FormattedMobileNumber extends StatelessWidget {
  const FormattedMobileNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: portrait == true ? 250 : 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            ':',
            style: TextStyle(
              color: kSecondaryColor,
            ),
          ),
          Padding(
            padding: portrait == true ? const EdgeInsets.only(left: 32) : const EdgeInsets.only(left: 40),
            child: SizedBox(
              width: portrait == true ? 200 : 250,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: MobileNumber(),
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


class FormattedDoB extends StatelessWidget {
  const FormattedDoB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: portrait == true ? 250 : 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            ':',
            style: TextStyle(
              color: kSecondaryColor,
            ),
          ),
          Padding(
            padding: portrait == true ? const EdgeInsets.only(left: 32) : const EdgeInsets.only(left: 40),
            child: SizedBox(
              width: portrait == true ? 200 : 250,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DoB(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class FormattedCity extends StatelessWidget {
  const FormattedCity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: portrait == true ? 250 : 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            ':',
            style: TextStyle(
              color: kSecondaryColor,
            ),
          ),
          Padding(
            padding: portrait == true ? const EdgeInsets.only(left: 32) : const EdgeInsets.only(left: 40),
            child: SizedBox(
              width: portrait == true ? 200 : 250,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: City(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class FormattedState extends StatelessWidget {
  const FormattedState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: portrait == true ? 250 : 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            ':',
            style: TextStyle(
              color: kSecondaryColor,
            ),
          ),
          Padding(
            padding: portrait == true ? const EdgeInsets.only(left: 32) : const EdgeInsets.only(left: 40),
            child: SizedBox(
              width: portrait == true ? 200 : 250,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: State(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class FormattedCountry extends StatelessWidget {
  const FormattedCountry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: portrait == true ? 250 : 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            ':',
            style: TextStyle(
              color: kSecondaryColor,
            ),
          ),
          Padding(
            padding: portrait == true ? const EdgeInsets.only(left: 32) : const EdgeInsets.only(left: 40),
            child: SizedBox(
              width: portrait == true ? 200 : 250,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Country(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

