// import 'dart:math';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workify/utils/sizes.dart';
import 'package:workify/utils/constants.dart';

import 'package:workify/controllers/profile_details_controller.dart';

double screenWidth = 0, screenHeight = 0;
bool portrait = false;

final profileDetailsController = Get.find<ProfileDetailsController>();

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
                    PositionInfoString(positionInfoString: 'User Position ID'),
                    PositionInfoString(positionInfoString: 'Designation'),
                    PositionInfoString(positionInfoString: 'Grade'),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FormattedPositionInfo(
                          positionInfoString: 'User Position ID'),
                      FormattedPositionInfo(positionInfoString: 'Designation'),
                      FormattedPositionInfo(
                          positionInfoString: 'Grade'),
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
                      // color: Colors.white,
                      color: kTextColor,
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
                    // PositionInfoString(positionInfoString: 'Job Role'),
                    Container(
                      height: 30,
                      width: 10,
                      // color: Colors.red,
                      color: Colors.transparent,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FormattedPositionInfo(
                          positionInfoString: 'Official Email'),
                      FormattedPositionInfo(
                          positionInfoString: 'Date of Joining'),
                      // FormattedPositionInfo(positionInfoString: 'Job Role'),
                      Container(
                      height: 30,
                      width: 10,
                      // color: Colors.red,
                      color: Colors.transparent,
                      )
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
                    PositionInfoString(positionInfoString: 'User Position ID'),
                    PositionInfoString(positionInfoString: 'Designation'),
                    PositionInfoString(positionInfoString: 'Grade'),
                    PositionInfoString(positionInfoString: 'Official Email'),
                    PositionInfoString(positionInfoString: 'Date of Joining'),
                    // PositionInfoString(positionInfoString: 'Job Role'),
                    Container(
                      height: 30,
                      width: 10,
                      // color: Colors.red,
                      color: Colors.transparent,
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FormattedPositionInfo(
                          positionInfoString: 'User Position ID'),
                      FormattedPositionInfo(positionInfoString: 'Designation'),
                      FormattedPositionInfo(
                          positionInfoString: 'Grade'),
                      FormattedPositionInfo(
                          positionInfoString: 'Official Email'),
                      FormattedPositionInfo(
                          positionInfoString: 'Date of Joining'),
                      // FormattedPositionInfo(positionInfoString: 'Job Role'),
                      Container(
                      height: 30,
                        width: 10,
                        // color: Colors.red,
                        color: Colors.transparent,
                      )
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
      // style: TextStyle(
      //   color: kSecondaryColor,
      // ),
    );
  }
}

class FormattedPositionInfo extends StatelessWidget {
  String positionInfoString;
  FormattedPositionInfo({
    Key? key, 
    required this.positionInfoString
  })
    : super(key: key);

  Map<String,Widget> string_2_PositionInfoMap = {
    'User Position ID': UserPosID(),
    'Designation': Designation(),
    'Grade': Grade(),
    // 'Employment Status': EmploymentStatus(),
    'Official Email': OfficialEmail(),
    'Date of Joining': DoJ(),
    // 'Job Role': JobRole(),
  };

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: portrait == true ? 250 : 300,
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
              width: portrait == true ? 200 : 250,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: string_2_PositionInfoMap[positionInfoString],
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

class UserPosID extends StatelessWidget {
  const UserPosID({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (profileDetailsController.isLoading.value) {
        return Text('User Position ID Loading');
      } else {
        return Text(
          // 'HI',
          profileDetailsController.employeeDetailsModelDetails?.userPosId.toString() ??
              'User Position ID Not Found',
          // style: TextStyle(
          //   color: kSecondaryColor,
          // ),
        );
      }
    });
  }
}

class Designation extends StatelessWidget {
  const Designation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (profileDetailsController.isLoading.value) {
        return Text('Designation Loading');
      } else {
        return Text(
          // 'HI',
          profileDetailsController.employeeDetailsModelDetails?.designation ??
              'Designation Not Found',
          // style: TextStyle(
          //   color: kSecondaryColor,
          // ),
        );
      }
    });
  }
}

class Grade extends StatelessWidget {
  const Grade({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (profileDetailsController.isLoading.value) {
        return Text('Grade Loading');
      } else {
        return Text(
          // 'HI',
          profileDetailsController.employeeDetailsModelDetails?.grade ??
              'Grade Not Found',
          // style: TextStyle(
          //   color: kSecondaryColor,
          // ),
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
              'Organization ID Not Found',
          // style: TextStyle(
          //   color: kSecondaryColor,
          // ),
        );
      }
    });
  }
}

// class EmploymentStatus extends StatelessWidget {
//   const EmploymentStatus({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       if (profileDetailsController.isLoading.value) {
//         return Text('Account Active Loading');
//       } else {
//         return Text(
//           // 'HI',
//           profileDetailsController.employeeInfoModelDetails?.isActive == true
//               ? 'Active'
//               : 'Inactive',
//           // style: TextStyle(
//           //   color: kSecondaryColor,
//           // ),
//         );
//       }
//     });
//   }
// }

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
              'Official Email Not Found',
          // style: TextStyle(
          //   color: kSecondaryColor,
          // ),
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
          // style: TextStyle(
          //   color: kSecondaryColor,
          // ),
        );
      } else {
        if (profileDetailsController.checkValidDate(
            profileDetailsController.employeeInfoModelDetails?.doj)) {
          return Text(
            DateFormat.yMMMMd('en_US').format(DateTime.parse(
                profileDetailsController.employeeInfoModelDetails?.doj)),
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
          profileDetailsController.employeeInfoModelDetails?.jobRole ??
              'Job Role Not Found',
          // style: TextStyle(
          //   color: kSecondaryColor,
          // ),
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
                      // color: kSecondaryColor,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              Table(
                border: TableBorder.all(
                  // color: kPrimaryColor,
                  color: kTextColor,
                ),
                children: [
                  TableRow(
                    children: [
                      Text(
                        'Heading 1',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          // color: kSecondaryColor,
                        ),
                      ),
                      Text(
                        'Heading 2',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          // color: kSecondaryColor,
                        ),
                      ),
                      Text(
                        'Heading 3',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          // color: kSecondaryColor,
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
        // color: kPrimaryColor,
        color: kTextColor,
      ),
      children: [
        TableRow(
          children: [
            Text(
              'Cell 1',
              // style: TextStyle(
              //   color: kSecondaryColor,
              // ),
            ),
            Text(
              'Cell 2',
              // style: TextStyle(
              //   color: kSecondaryColor,
              // ),
            ),
            Text(
              'Cell 3',
              // style: TextStyle(
              //   color: kSecondaryColor,
              // ),
            ),
          ],
        ),
        TableRow(
          children: [
            Text(
              'Cell 1',
              // style: TextStyle(
              //   color: kSecondaryColor,
              // ),
            ),
            Text(
              'Cell 2',
              // style: TextStyle(
              //   color: kSecondaryColor,
              // ),
            ),
            Text(
              'Cell 3',
              // style: TextStyle(
              //   color: kSecondaryColor,
              // ),
            ),
          ],
        ),
        TableRow(
          children: [
            Text(
              'Cell 1',
              // style: TextStyle(
              //   color: kSecondaryColor,
              // ),
            ),
            Text(
              'Cell 2',
              // style: TextStyle(
              //   color: kSecondaryColor,
              // ),
            ),
            Text(
              'Cell 3',
              // style: TextStyle(
              //   color: kSecondaryColor,
              // ),
            ),
          ],
        ),
        TableRow(
          children: [
            Text(
              'Cell 1',
              // style: TextStyle(
              //   color: kSecondaryColor,
              // ),
            ),
            Text(
              'Cell 2',
              // style: TextStyle(
              //   color: kSecondaryColor,
              // ),
            ),
            Text(
              'Cell 3',
              // style: TextStyle(
              //   color: kSecondaryColor,
              // ),
            ),
          ],
        ),
        TableRow(
          children: [
            Text(
              'Cell 1',
              // style: TextStyle(
              //   color: kSecondaryColor,
              // ),
            ),
            Text(
              'Cell 2',
              // style: TextStyle(
              //   color: kSecondaryColor,
              // ),
            ),
            Text(
              'Cell 3',
              // style: TextStyle(
              //   color: kSecondaryColor,
              // ),
            ),
          ],
        ),
        TableRow(
          children: [
            Text(
              'Cell 1',
              // style: TextStyle(
              //   color: kSecondaryColor,
              // ),
            ),
            Text(
              'Cell 2',
              // style: TextStyle(
              //   color: kSecondaryColor,
              // ),
            ),
            Text(
              'Cell 3',
              // style: TextStyle(
              //   color: kSecondaryColor,
              // ),
            ),
          ],
        ),
        TableRow(
          children: [
            Text(
              'Cell 1',
              // style: TextStyle(
              //   color: kSecondaryColor,
              // ),
            ),
            Text(
              'Cell 2',
              // style: TextStyle(
              //   color: kSecondaryColor,
              // ),
            ),
            Text(
              'Cell 3',
              // style: TextStyle(
              //   color: kSecondaryColor,
              // ),
            ),
          ],
        ),
        TableRow(
          children: [
            Text(
              'Cell 1',
              // style: TextStyle(
              //   color: kSecondaryColor,
              // ),
            ),
            Text(
              'Cell 2',
              // style: TextStyle(
              //   color: kSecondaryColor,
              // ),
            ),
            Text(
              'Cell 3',
              // style: TextStyle(
              //   color: kSecondaryColor,
              // ),
            ),
          ],
        ),
        TableRow(
          children: [
            Text(
              'Cell 1',
              // style: TextStyle(
              //   color: kSecondaryColor,
              // ),
            ),
            Text(
              'Cell 2',
              // style: TextStyle(
              //   color: kSecondaryColor,
              // ),
            ),
            Text(
              'Cell 3',
              // style: TextStyle(
              //   color: kSecondaryColor,
              // ),
            ),
          ],
        ),
        TableRow(
          children: [
            Text(
              'Cell 1',
              // style: TextStyle(
              //   color: kSecondaryColor,
              // ),
            ),
            Text(
              'Cell 2',
              // style: TextStyle(
              //   color: kSecondaryColor,
              // ),
            ),
            Text(
              'Cell 3',
              // style: TextStyle(
              //   color: kSecondaryColor,
              // ),
            ),
          ],
        ),
        TableRow(
          children: [
            Text(
              'Cell 1',
              // style: TextStyle(
              //   color: kSecondaryColor,
              // ),
            ),
            Text(
              'Cell 2',
              // style: TextStyle(
              //   color: kSecondaryColor,
              // ),
            ),
            Text(
              'Cell 3',
              // style: TextStyle(
              //   color: kSecondaryColor,
              // ),
            ),
          ],
        ),
        
      ],
    );
  }
}
