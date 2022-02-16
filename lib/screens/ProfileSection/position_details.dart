// import 'dart:math';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workify/utils/sizes.dart';
import 'package:workify/utils/constants.dart';

import './modify_history_buttons.dart';
import 'package:workify/controllers/profile_details_controller.dart';

double screenWidth = 0, screenHeight = 0;
bool portrait = false;

final profileDetailsController = Get.put(ProfileDetailsController());

class WrapPositionDetails extends StatefulWidget {
  const WrapPositionDetails({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return WrapPositionDetailsState();
  }
}

class WrapPositionDetailsState extends State<WrapPositionDetails> {
  @override
  Widget build(BuildContext context) {
    return PositionDetails();
  }
}

class PositionDetails extends StatelessWidget {
  const PositionDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DeviceSize device = DeviceSize();
    device.size = MediaQuery.of(context).size;
    screenWidth = device.size.width;
    screenHeight = device.size.height;
    portrait = screenWidth < 1000;
    if (portrait == false) {
      return Column(
        children: [
          Expanded(
            flex: 7,
            child: Row(
              children: [
                //Side padding before Column 1
                Expanded(
                  flex: 1,
                  child: Container(
                    // color: Colors.red,
                    color: Colors.transparent,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PositionInfoString(positionInfoString: 'Employee Code'),
                    PositionInfoString(positionInfoString: 'Department'),
                    PositionInfoString(positionInfoString: 'Work Location'),
                    PositionInfoString(positionInfoString: 'Employment Status'),
                    // PositionInfoString(positionInfoString: 'Organization ID'),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FormattedEmployeeCode(),
                      FormattedDepartment(),
                      FormattedWorkLocation(),
                      FormattedEmploymentStatus(),
                      // FormattedOrgID(),
                    ],
                  ),
                ),
                // Border between Column 1 and Column 2
                Container(
                  width: 30,
                  color: Colors.transparent,
                  // color:Colors.black,
                  child: Center(
                    child: Container(
                      width: 1,
                      height: 300,
                      color: kSecondaryColor,
                    ),
                  ),
                ),
                //Side padding before Column 2
                Expanded(
                  flex: 1,
                  child: Container(
                    // color: Colors.red,
                    color: Colors.transparent,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    PositionInfoString(positionInfoString: 'Official Email'),
                    PositionInfoString(positionInfoString: 'Date of Joining'),
                    PositionInfoString(positionInfoString: 'Job Role'),
                    SizedBox(height: 5,),
                    
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FormattedOfficialEmail(),
                      FormattedDoJ(),
                      FormattedJobRole(),
                      SizedBox(height: 5,),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // History Table and Modify Button
          Expanded(
            flex: 3,
            child: PositionDetailsFooter(),
          ),
        ],
      );
    } else {
      return PositionDetailsPortraitView();
    }
  }
}

class PositionDetailsPortraitView extends StatelessWidget {
  const PositionDetailsPortraitView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 6,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    PositionInfoString(positionInfoString: 'Employee Code'),
                    PositionInfoString(positionInfoString: 'Department'),
                    PositionInfoString(positionInfoString: 'Work Location'),
                    // PositionInfoString(positionInfoString: 'Organization ID'),
                    PositionInfoString(positionInfoString: 'Employment Status'),
                    PositionInfoString(positionInfoString: 'Official Email'),
                    PositionInfoString(positionInfoString: 'Date of Joining'),
                    PositionInfoString(positionInfoString: 'Job Role'),
                  ],
                ),
              ),

              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(left:8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FormattedEmployeeCode(),
                      FormattedDepartment(),
                      FormattedWorkLocation(),
                      // FormattedOrgID(),
                      FormattedEmploymentStatus(),
                      FormattedOfficialEmail(),
                      FormattedDoJ(),
                      FormattedJobRole(),
                    ],
                  ),
                ),
              ),
              
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: PositionDetailsFooter(),
        ),
      ],
    );
  }
}

class PositionInfoString extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final positionInfoString;

  const PositionInfoString({
    Key? key,
    required this.positionInfoString,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      positionInfoString,
      style: TextStyle(
        color: kSecondaryColor,
      ),
    );
  }
}


class FormattedEmployeeCode extends StatelessWidget {
  const FormattedEmployeeCode({Key? key}) : super(key: key);

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
            padding: const EdgeInsets.only(left: 8),
            child: SizedBox(
              width: portrait == true ? 200 : 250,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: EmployeeCode(),
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

class FormattedDepartment extends StatelessWidget {
  const FormattedDepartment({Key? key}) : super(key: key);

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
            padding: const EdgeInsets.only(left: 8),
            child: SizedBox(
               width: portrait == true ? 200 : 250,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Department(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FormattedWorkLocation extends StatelessWidget {
  const FormattedWorkLocation({Key? key}) : super(key: key);

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
            padding: const EdgeInsets.only(left: 8),
            child: SizedBox(
               width: portrait == true ? 200 : 250,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: WorkLocation(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FormattedOrgID extends StatelessWidget {
  const FormattedOrgID({Key? key}) : super(key: key);

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
            padding: const EdgeInsets.only(left: 8),
            child: SizedBox(
               width: portrait == true ? 200 : 250,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: OrgID(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FormattedEmploymentStatus extends StatelessWidget {
  const FormattedEmploymentStatus({Key? key}) : super(key: key);

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
            padding: const EdgeInsets.only(left: 8),
            child: SizedBox(
               width: portrait == true ? 200 : 250,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: EmploymentStatus(),
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

class FormattedOfficialEmail extends StatelessWidget {
  const FormattedOfficialEmail({Key? key}) : super(key: key);

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
            padding: const EdgeInsets.only(left: 8),
            child: SizedBox(
               width: portrait == true ? 200 : 250,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: OfficialEmail(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FormattedDoJ extends StatelessWidget {
  const FormattedDoJ({Key? key}) : super(key: key);

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
            padding: const EdgeInsets.only(left: 8),
            child: SizedBox(
               width: portrait == true ? 200 : 250,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DoJ(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FormattedJobRole extends StatelessWidget {
  const FormattedJobRole({Key? key}) : super(key: key);

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
            padding: const EdgeInsets.only(left: 8),
            child: SizedBox(
               width: portrait == true ? 200 : 250,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: JobRole(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}






class EmployeeCode extends StatelessWidget {
  const EmployeeCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (profileDetailsController.isLoading.value) {
        return Text('Employee Code Loading');
      } else {
        return Text(
          // 'HI',
          profileDetailsController.employeeInfoModelDetails?.empCode ??
              'Employee Code Null',
          style: TextStyle(
            color: kSecondaryColor,
          ),
        );
      }
    });
  }
}

class Department extends StatelessWidget {
  const Department({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (profileDetailsController.isLoading.value) {
        return Text('Department Loading');
      } else {
        return Text(
          // 'HI',
          profileDetailsController.employeeInfoModelDetails?.department ??
              'Department Null',
          style: TextStyle(
            color: kSecondaryColor,
          ),
        );
      }
    });
  }
}

class WorkLocation extends StatelessWidget {
  const WorkLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (profileDetailsController.isLoading.value) {
        return Text('Work Location Loading');
      } else {
        return Text(
          // 'HI',
          profileDetailsController.employeeInfoModelDetails?.workLocation ??
              'Work Location Null',
          style: TextStyle(
            color: kSecondaryColor,
          ),
        );
      }
    });
  }
}

class OrgID extends StatelessWidget {
  const OrgID({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (profileDetailsController.isLoading.value) {
        return Text('Organization ID Loading');
      } else {
        return Text(
          // 'HI',
          profileDetailsController.employeeInfoModelDetails?.orgId.toString() ??
              'Organization ID Null',
          style: TextStyle(
            color: kSecondaryColor,
          ),
        );
      }
    });
  }
}

class EmploymentStatus extends StatelessWidget {
  const EmploymentStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (profileDetailsController.isLoading.value) {
        return Text('Account Active Loading');
      } else {
        return Text(
          // 'HI',
          profileDetailsController.employeeInfoModelDetails?.active == true
              ? 'Active'
              : 'Inactive',
          style: TextStyle(
            color: kSecondaryColor,
          ),
        );
      }
    });
  }
}

class OfficialEmail extends StatelessWidget {
  const OfficialEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (profileDetailsController.isLoading.value) {
        return Text('Official Email Loading');
      } else {
        return Text(
          // 'HI',
          profileDetailsController.employeeInfoModelDetails?.officialMail ??
              'Official Email Null',
          style: TextStyle(
            color: kSecondaryColor,
          ),
        );
      }
    });
  }
}

class DoJ extends StatelessWidget {
  const DoJ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (profileDetailsController.isLoading.value) {
        return Text(
          'Date of Joining Loading',
          style: TextStyle(
            color: kSecondaryColor,
          ),
        );
      } else {
        if (profileDetailsController.checkValidDate(
            profileDetailsController.employeeInfoModelDetails?.doj)) {
          return Text(
            DateFormat.yMMMMd('en_US').format(DateTime.parse(
                profileDetailsController.employeeInfoModelDetails?.doj)),
            style: TextStyle(
              color: kSecondaryColor,
            ),
          );
        } else {
          return Text(
            'Invalid date found',
            style: TextStyle(
              color: kSecondaryColor,
            ),
          );
        }
      }
    });
  }
}

class JobRole extends StatelessWidget {
  const JobRole({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (profileDetailsController.isLoading.value) {
        return Text('Job Role Loading');
      } else {
        return Text(
          // 'HI',
          profileDetailsController.employeeInfoModelDetails?.role ?? 'Job Role Null',
          style: TextStyle(
            color: kSecondaryColor,
          ),
        );
      }
    });
  }
}

class PositionDetailsFooter extends StatelessWidget {
  const PositionDetailsFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'History',
                    style: TextStyle(
                      color: kSecondaryColor,
                      fontSize: 15,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: ModifyButton(),
                  ),
                ],
              ),
              Table(
                border: TableBorder.all(
                  color: kSecondaryColor,
                ),
                children: [
                  TableRow(
                    children: [
                      Text(
                        'Heading 1',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: kSecondaryColor,
                        ),
                      ),
                      Text(
                        'Heading 2',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: kSecondaryColor,
                        ),
                      ),
                      Text(
                        'Heading 3',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: kSecondaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                flex: 2,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: PositionHistory(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PositionHistory extends StatelessWidget {
  const PositionHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(
        color: kSecondaryColor,
      ),
      children: [
        TableRow(
          children: [
            Text(
              'Cell 1',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
            Text(
              'Cell 2',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
            Text(
              'Cell 3',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            Text(
              'Cell 1',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
            Text(
              'Cell 2',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
            Text(
              'Cell 3',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            Text(
              'Cell 1',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
            Text(
              'Cell 2',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
            Text(
              'Cell 3',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            Text(
              'Cell 1',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
            Text(
              'Cell 2',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
            Text(
              'Cell 3',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            Text(
              'Cell 1',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
            Text(
              'Cell 2',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
            Text(
              'Cell 3',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            Text(
              'Cell 1',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
            Text(
              'Cell 2',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
            Text(
              'Cell 3',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            Text(
              'Cell 1',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
            Text(
              'Cell 2',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
            Text(
              'Cell 3',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            Text(
              'Cell 1',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
            Text(
              'Cell 2',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
            Text(
              'Cell 3',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            Text(
              'Cell 1',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
            Text(
              'Cell 2',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
            Text(
              'Cell 3',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            Text(
              'Cell 1',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
            Text(
              'Cell 2',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
            Text(
              'Cell 3',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            Text(
              'Cell 1',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
            Text(
              'Cell 2',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
            Text(
              'Cell 3',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            Text(
              'Cell 1',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
            Text(
              'Cell 2',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
            Text(
              'Cell 3',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
