// import 'dart:html';

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workify/controllers/fetch_all_employees_controller.dart';
import 'package:workify/controllers/modify_employee_profile_details_controller.dart';
import 'package:workify/screens/ProfileSection/ModifySelf_EmployeePosition_Employment/user_specific_person.dart';
import 'package:workify/utils/sizes.dart';

double screenWidth = 0, screenHeight = 0;
bool portrait = false;
int idx = -1;


class UserSpecificBasicDetails extends StatelessWidget {
  final index;
  const UserSpecificBasicDetails({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DeviceSize device = DeviceSize();
    device.size = MediaQuery.of(context).size;
    screenWidth = device.size.width;
    screenHeight = device.size.height;

    portrait = screenWidth < 1000;
    idx = index;

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
                    child: UserSpecificPerson(index: index),
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
  // final index;
  const BasicDetailsPortraitView({
    Key? key,
    // required this.index,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: UserSpecificPerson(index: idx),
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
    return Text(fetchAllEmployeesController.allEmployeeList
        .elementAt(idx)
        .mobile
        .toString());
  }
}

class MarriageStatus extends StatelessWidget {
  const MarriageStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(fetchAllEmployeesController.allEmployeeList
        .elementAt(idx)
        .marriageStatus
        .toString());
  }
}

class DoB extends StatelessWidget {
  const DoB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(DateFormat.yMMMMd('en_US').format(DateTime.parse(
        fetchAllEmployeesController.allEmployeeList
            .elementAt(idx)
            .dob
            .toString())));
  }
}

class City extends StatelessWidget {
  const City({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(fetchAllEmployeesController.allEmployeeList
        .elementAt(idx)
        .city
        .toString());
  }
}

class State extends StatelessWidget {
  const State({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(fetchAllEmployeesController.allEmployeeList
        .elementAt(idx)
        .state
        .toString());
  }
}

class Country extends StatelessWidget {
  const Country({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(fetchAllEmployeesController.allEmployeeList
        .elementAt(idx)
        .country
        .toString());
  }
}
