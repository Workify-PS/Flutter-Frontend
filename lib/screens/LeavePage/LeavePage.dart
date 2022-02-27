// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:workify/components/button.dart';
import 'package:workify/components/top_bar.dart';
import 'package:workify/controllers/leavePageController.dart';

import 'package:workify/controllers/profile_details_controller.dart';
import 'package:workify/utils/constants.dart';
import 'package:workify/utils/generators.dart';
import 'package:workify/utils/sizes.dart';

double screenWidth = 0, screenHeight = 0;
bool portrait = false;
var datePicked;
var profileDetailsController, leavePageController;

class LeavePage extends StatelessWidget {
  const LeavePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DeviceSize device = DeviceSize();
    device.size = MediaQuery.of(context).size;
    screenWidth = device.size.width;
    screenHeight = device.size.height;

    portrait = screenWidth < 1000;

    profileDetailsController = Get.find<ProfileDetailsController>();
    leavePageController = Get.find<LeavePageController>();

    return Scaffold(
        appBar:generateTopBar(title: "Leaves"),
        body: portrait == false
            ? Center(
                child: Container(
                width: device.size.width / 1.1,
                height: device.size.height / 1.1,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  // color: Colors.red,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: LeavePageBasicInfo(),
                    ),
                    Container(
                      width: 1,
                      color: Colors.grey,
                    ),
                    Expanded(
                      flex: 7,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Button(
                              buttonTextWidget: Text('New Leave'),
                              onPressed: () {},
                            ),
                            Expanded(
                              flex: 4,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 16, left: 16),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    AttendanceRegularize(),
                                    AttendanceExtended(),
                                  ],
                                ),
                              ),
                            ),
                            WrapPastAttendanceRelated(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ))
            : LeavePagePortrait());
  }
}

class LeavePagePortrait extends StatelessWidget {
  const LeavePagePortrait({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: LeavePageBasicInfo(),
        ),
        Expanded(
          flex: 6,
          child: Row(
            children: [
              WrapPastAttendanceRelated(),
              Container(
                width: 1,
                color: Colors.grey,
              ),
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    Button(
                      buttonTextWidget: Text('New Leave'),
                      onPressed: () {},
                    ),
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            AttendanceRegularize(),
                            AttendanceExtended(),
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
      ],
    );
  }
}

class AttendanceRegularize extends StatelessWidget {
  const AttendanceRegularize({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Attendance',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          // Button(
          //   buttonTextWidget: Text('Regularize'),
          //   onPressed: () {},
          // ),
        ],
      ),
    );
  }
}

class AttendanceExtended extends StatelessWidget {
  const AttendanceExtended({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    leavePageController = Get.find<LeavePageController>();

    return Expanded(
      flex: 8,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                LeavePageTextWidgets(leavePageTextWidgetString: 'Absent'),
                LeavePageTextWidgets(
                    leavePageTextWidgetString: 'Status(Half/Full Day)'),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: portrait == true ? 90 : 100,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Absent(),
                  ),
                ),
                SizedBox(
                  width: portrait == true ? 90 : 100,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Status(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class WrapPastAttendanceRelated extends StatelessWidget {
  const WrapPastAttendanceRelated({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulPastAttendanceRelated();
  }
}

class StatefulPastAttendanceRelated extends StatefulWidget {
  const StatefulPastAttendanceRelated({Key? key}) : super(key: key);

  @override
  _StatefulPastAttendanceRelatedState createState() =>
      _StatefulPastAttendanceRelatedState();
}

class _StatefulPastAttendanceRelatedState
    extends State<StatefulPastAttendanceRelated> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Padding(
        padding: const EdgeInsets.only(top: 16, left: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: portrait == true
                    ? const EdgeInsets.only(right: 16)
                    : const EdgeInsets.only(right: 0.001),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    datePicked == null
                        ? Text(
                            'Past',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          )
                        : Text(DateFormat.yMMMMd('en_US')
                            .format(DateTime.parse(datePicked))),
                    Button(
                      buttonTextWidget: Text('Date'),
                      onPressed: () {
                        DatePicker.showDatePicker(context,
                            theme: DatePickerTheme(
                              backgroundColor: Colors.grey.shade200,
                            ), onConfirm: (value) {
                          var date = value.toString().split(' ');
                          var onlyDate = date[0];
                          setState(() {
                            datePicked = onlyDate;
                          });
                          leavePageController.date = onlyDate;
                          leavePageController.findDateSpecificAttendanceList();
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // LeavePageTextWidgets(
                        //     leavePageTextWidgetString: 'Leave'),
                        // LeavePageTextWidgets(
                        //     leavePageTextWidgetString: 'Present hours'),
                        LeavePageTextWidgets(
                            leavePageTextWidgetString: 'Shift'),
                        LeavePageTextWidgets(
                            leavePageTextWidgetString: 'In time'),
                        LeavePageTextWidgets(
                            leavePageTextWidgetString: 'Out time'),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // LeavePageTextWidgets(leavePageTextWidgetString: '--'),
                        // PresentHours(),
                        SizedBox(
                          width: portrait == true? 100:200,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Shift(),
                          ),
                        ),
                        InTime(),
                        OutTime(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LeavePageBasicInfo extends StatelessWidget {
  const LeavePageBasicInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Avatar(),
              Name(),
            ],
          ),
        ),
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Employee Code'),
                    Text('Employment Type'),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    EmployeeCode(),
                    EmploymentType(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
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
        return Text(
          // 'Avatar Name',
          profileDetailsController.employeeInfoModelDetails?.fullName ??
              'Got Null',
          style: TextStyle(
              // fontWeight: FontWeight.bold,
              // color: kSecondaryColor,
              ),
        );
      }
    });
  }
}

class EmployeeCode extends StatelessWidget {
  const EmployeeCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileDetailsController = Get.find<ProfileDetailsController>();
    return Obx(() {
      if (profileDetailsController.isLoading.value) {
        return Text('Employee Code Loading');
      } else {
        return Text(
          // 'HI',
          profileDetailsController.employeeInfoModelDetails?.empCode ??
              'Employee Code Found Null',
          style: TextStyle(
              // color: kSecondaryColor,
              ),
        );
      }
    });
  }
}

class EmploymentType extends StatelessWidget {
  const EmploymentType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileDetailsController = Get.find<ProfileDetailsController>();
    return Obx(() {
      if (profileDetailsController.isLoading.value) {
        return Text('Employment Type Loading');
      } else {
        return Text(
          // 'HI',
          profileDetailsController.employeeInfoModelDetails?.employementType ??
              'Employment Type Found Null',
          style: TextStyle(
              // color: kSecondaryColor,
              ),
        );
      }
    });
  }
}

class LeavePageTextWidgets extends StatelessWidget {
  final leavePageTextWidgetString;
  const LeavePageTextWidgets({
    Key? key,
    required this.leavePageTextWidgetString,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Text(leavePageTextWidgetString)),
    );
  }
}

class Absent extends StatelessWidget {
  const Absent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (leavePageController.isLoading.value) {
        return Text('Loading Data');
      } else {
        return leavePageController.index != '-1'
            ? Text(leavePageController.absent == true ? 'Yes' : 'No')
            : Text('Not Found');
      }
    });
  }
}

class Status extends StatelessWidget {
  const Status({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (leavePageController.isLoading.value) {
        return Text('Loading Data');
      } else {
        return Text(leavePageController.index != '-1'
            ? leavePageController
                .attendanceList[int.parse(leavePageController.index.value)]
                .status
            : 'Not Found');
      }
    });
  }
}

class Shift extends StatelessWidget {
  const Shift({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (leavePageController.isLoading.value) {
        return Text('Loading Data');
      } else {
        return Text(leavePageController.index != '-1'
            ? leavePageController
                .attendanceList[int.parse(leavePageController.index.value)]
                .shift
            : 'Not Found');
      }
    });
  }
}

class InTime extends StatelessWidget {
  const InTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (leavePageController.isLoading.value) {
        return Text('Loading Data');
      } else {
        return Text(leavePageController.index != '-1'
            ? leavePageController
                .attendanceList[int.parse(leavePageController.index.value)]
                .actualIn
            : 'Not Found');
      }
    });
  }
}

class OutTime extends StatelessWidget {
  const OutTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (leavePageController.isLoading.value) {
        return Text('Loading Data');
      } else {
        return Text(leavePageController.index != '-1'
            ? leavePageController
                .attendanceList[int.parse(leavePageController.index.value)]
                .actualOut
            : 'Not Found');
      }
    });
  }
}
