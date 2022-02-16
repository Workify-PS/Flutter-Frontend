import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workify/utils/sizes.dart';
import 'package:workify/utils/constants.dart';

import 'package:workify/controllers/profile_details_controller.dart';

double screenWidth = 0, screenHeight = 0;
bool portrait = false;
// bool fresher = false;

final profileDetailsController = Get.put(ProfileDetailsController());

class WrapEmploymentDetails extends StatefulWidget {
  const WrapEmploymentDetails({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return WrapEmploymentDetailsState();
  }
}

class WrapEmploymentDetailsState extends State<WrapEmploymentDetails> {
  @override
  Widget build(BuildContext context) {
    return EmploymentDetails();
  }
}

class EmploymentDetails extends StatelessWidget {
  const EmploymentDetails({Key? key}) : super(key: key);

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
                    EmploymentInfoString(
                        positionInfoString: 'User Position ID'),
                    EmploymentInfoString(positionInfoString: 'Designation'),
                    EmploymentInfoString(positionInfoString: 'Grade'),
                    EmploymentInfoString(
                        positionInfoString: 'Employment Category'),
                    EmploymentInfoString(
                        positionInfoString: 'Employment Status'),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      FormattedUserPosID(),
                      FormattedDesignation(),
                      FormattedGrade(),
                      FormattedEmploymentCategory(),
                      FormattedEmploymentStatus(),
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
                    EmploymentInfoString(positionInfoString: 'Employment Type'),
                    EmploymentInfoString(positionInfoString: 'L1 Manager ID'),
                    EmploymentInfoString(positionInfoString: 'L2 Manager ID'),
                    EmploymentInfoString(positionInfoString: 'HR Manager ID'),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FormattedEmploymentType(),
                      FormattedL1ManagerID(),
                      FormattedL2ManagerID(),
                      FormattedHRManagerID(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // History Table and Modify Button
          Expanded(
            flex: 3,
            child: EmploymentDetailsFooter(),
          ),
        ],
      );
    } else {
      return EmploymentDetailsPortraitView();
    }
  }
}

class EmploymentDetailsPortraitView extends StatelessWidget {
  const EmploymentDetailsPortraitView({Key? key}) : super(key: key);
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
                    EmploymentInfoString(
                        positionInfoString: 'User Position ID'),
                    EmploymentInfoString(positionInfoString: 'Designation'),
                    EmploymentInfoString(positionInfoString: 'Grade'),
                    EmploymentInfoString(
                        positionInfoString: 'Employment Category'),
                    EmploymentInfoString(
                        positionInfoString: 'Employment Status'),
                    EmploymentInfoString(positionInfoString: 'Employment Type'),
                    EmploymentInfoString(positionInfoString: 'L1 Manager ID'),
                    EmploymentInfoString(positionInfoString: 'L2 Manager ID'),
                    EmploymentInfoString(positionInfoString: 'HR Manager ID'),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FormattedUserPosID(),
                      FormattedDesignation(),
                      FormattedGrade(),
                      FormattedEmploymentCategory(),
                      FormattedEmploymentStatus(),
                      FormattedEmploymentType(),
                      FormattedL1ManagerID(),
                      FormattedL2ManagerID(),
                      FormattedHRManagerID(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: EmploymentDetailsFooter(),
        ),
      ],
    );
  }
}

class EmploymentInfoString extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final positionInfoString;

  const EmploymentInfoString({
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

class FormattedUserPosID extends StatelessWidget {
  const FormattedUserPosID({Key? key}) : super(key: key);

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
                child: UserPosID(),
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


class FormattedDesignation extends StatelessWidget {
  const FormattedDesignation({Key? key}) : super(key: key);

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
                child: Designation(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class FormattedGrade extends StatelessWidget {
  const FormattedGrade({Key? key}) : super(key: key);

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
                child: Grade(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class FormattedEmploymentCategory extends StatelessWidget {
  const FormattedEmploymentCategory({Key? key}) : super(key: key);

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
                child: EmploymentCategory(),
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class FormattedEmploymentType extends StatelessWidget {
  const FormattedEmploymentType({Key? key}) : super(key: key);

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
                child: EmploymentType(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class FormattedL1ManagerID extends StatelessWidget {
  const FormattedL1ManagerID({Key? key}) : super(key: key);

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
                child: L1ManagerID(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class FormattedL2ManagerID extends StatelessWidget {
  const FormattedL2ManagerID({Key? key}) : super(key: key);

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
                child: L2ManagerID(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class FormattedHRManagerID extends StatelessWidget {
  const FormattedHRManagerID({Key? key}) : super(key: key);

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
                child: HRManagerID(),
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
              'User Position ID Null',
          style: TextStyle(
            color: kSecondaryColor,
          ),
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
              'Designation Null',
          style: TextStyle(
            color: kSecondaryColor,
          ),
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
              'Grade Null',
          style: TextStyle(
            color: kSecondaryColor,
          ),
        );
      }
    });
  }
}


class EmploymentCategory extends StatelessWidget {
  const EmploymentCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (profileDetailsController.isLoading.value) {
        return Text('Employment Category Loading');
      } else {
        return Text(
          // 'HI',
          profileDetailsController.employeeDetailsModelDetails?.empCategory ??
              'Employment Category Null',
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
        return Text('Employment Status Loading');
      } else {
        return Text(
          // 'HI',
          profileDetailsController.employeeDetailsModelDetails?.empStatus ??
              'Employment Status Null',
          style: TextStyle(
            color: kSecondaryColor,
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
    return Obx(() {
      if (profileDetailsController.isLoading.value) {
        return Text('Employment Type Loading');
      } else {
        return Text(
          // 'HI',
          profileDetailsController.employeeDetailsModelDetails?.empType ??
              'Employment Type Null',
          style: TextStyle(
            color: kSecondaryColor,
          ),
        );
      }
    });
  }
}


class L1ManagerID extends StatelessWidget {
  const L1ManagerID({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (profileDetailsController.isLoading.value) {
        return Text('L1 Manager ID Loading');
      } else {
        return Text(
          // 'HI',
          profileDetailsController.employeeDetailsModelDetails?.l1ManagerId.toString() ??
              'L1 Manager ID Null',
          style: TextStyle(
            color: kSecondaryColor,
          ),
        );
      }
    });
  }
}


class L2ManagerID extends StatelessWidget {
  const L2ManagerID({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (profileDetailsController.isLoading.value) {
        return Text('L2 Manager ID Loading');
      } else {
        return Text(
          // 'HI',
          profileDetailsController.employeeDetailsModelDetails?.l2ManagerId.toString() ??
              'L2 Manager ID Null',
          style: TextStyle(
            color: kSecondaryColor,
          ),
        );
      }
    });
  }
}


class HRManagerID extends StatelessWidget {
  const HRManagerID({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (profileDetailsController.isLoading.value) {
        return Text('HR Manager ID Loading');
      } else {
        return Text(
          // 'HI',
          profileDetailsController.employeeDetailsModelDetails?.hrManagerId.toString() ??
              'HR Manager ID Null',
          style: TextStyle(
            color: kSecondaryColor,
          ),
        );
      }
    });
  }
}

class EmploymentDetailsFooter extends StatelessWidget {
  const EmploymentDetailsFooter({Key? key}) : super(key: key);

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
                  // Padding(
                  //   padding: const EdgeInsets.only(bottom: 8),
                  //   child: ModifyButton(),
                  // ),
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
                  child: EmploymentHistory(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class EmploymentHistory extends StatelessWidget {
  const EmploymentHistory({Key? key}) : super(key: key);

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
