import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workify/utils/sizes.dart';
import 'package:workify/utils/constants.dart';

import 'package:workify/controllers/profile_details_controller.dart';
import 'package:workify/utils/theme.dart';

double screenWidth = 0, screenHeight = 0;
bool portrait = false;
// bool fresher = false;


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
                    // color: Colors.transparent,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    EmploymentInfoString(
                        employmentInfoString: 'Employee Code'),
                    EmploymentInfoString(employmentInfoString: 'Department'),
                    EmploymentInfoString(employmentInfoString: 'Work Location'),
                    EmploymentInfoString(
                        employmentInfoString: 'Employment Category'),
                    EmploymentInfoString(
                        employmentInfoString: 'Employment Status'),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FormattedEmploymentInfo(employmentInfoString: 'Employee Code'),
                      FormattedEmploymentInfo(employmentInfoString: 'Department'),
                      FormattedEmploymentInfo(employmentInfoString: 'Work Location'),
                      FormattedEmploymentInfo(employmentInfoString: 'Employment Category'),
                      FormattedEmploymentInfo(employmentInfoString: 'Employment Status'),
                    ],
                  ),
                ),
                // Border between Column 1 and Column 2
                VerticalDivider(
                  thickness: 2,
                  color: MyTheme().isDark(context)
                      ? kDividerDarkColor
                      : kDividerColor,
                  indent: kDefaultPadding,
                  endIndent: kDefaultPadding,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 80),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      EmploymentInfoString(employmentInfoString: 'Employment Type'),
                      EmploymentInfoString(employmentInfoString: 'L1 Manager ID'),
                      EmploymentInfoString(employmentInfoString: 'L2 Manager ID'),
                      EmploymentInfoString(employmentInfoString: 'HR Manager ID'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FormattedEmploymentInfo(employmentInfoString: 'Employment Type'),
                      FormattedEmploymentInfo(employmentInfoString: 'L1 Manager ID'),
                      FormattedEmploymentInfo(employmentInfoString: 'L2 Manager ID'),
                      FormattedEmploymentInfo(employmentInfoString: 'HR Manager ID'),
                    ],
                  ),
                ),
                //Side padding after/before Column 2
                Expanded(
                  flex: 1,
                  child: Container(
                    // color: Colors.red,
                    color: Colors.transparent,
                  ),
                ),
              ],
            ),
          ),
          // History Table and Modify Button
          // Expanded(
          //   flex: 3,
          //   child: EmploymentDetailsFooter(),
          // ),
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
                        employmentInfoString: 'Employee Code'),
                    EmploymentInfoString(employmentInfoString: 'Department'),
                    EmploymentInfoString(employmentInfoString: 'Work Location'),
                    EmploymentInfoString(
                        employmentInfoString: 'Employment Category'),
                    EmploymentInfoString(
                        employmentInfoString: 'Employment Status'),
                    EmploymentInfoString(employmentInfoString: 'Employment Type'),
                    EmploymentInfoString(employmentInfoString: 'L1 Manager ID'),
                    EmploymentInfoString(employmentInfoString: 'L2 Manager ID'),
                    EmploymentInfoString(employmentInfoString: 'HR Manager ID'),
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
                      FormattedEmploymentInfo(employmentInfoString: 'Employee Code'),
                      FormattedEmploymentInfo(employmentInfoString: 'Department'),
                      FormattedEmploymentInfo(employmentInfoString: 'Work Location'),
                      FormattedEmploymentInfo(employmentInfoString: 'Employment Category'),
                      FormattedEmploymentInfo(employmentInfoString: 'Employment Status'),
                      FormattedEmploymentInfo(employmentInfoString: 'Employment Type'),
                      FormattedEmploymentInfo(employmentInfoString: 'L1 Manager ID'),
                      FormattedEmploymentInfo(employmentInfoString: 'L2 Manager ID'),
                      FormattedEmploymentInfo(employmentInfoString: 'HR Manager ID'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        // Expanded(
        //   flex: 3,
        //   child: EmploymentDetailsFooter(),
        // ),
      ],
    );
  }
}

class EmploymentInfoString extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final employmentInfoString;

  const EmploymentInfoString({
    Key? key,
    required this.employmentInfoString,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      employmentInfoString,
      // style: TextStyle(
      //   color: kSecondaryColor,
      // ),
    );
  }
}


class FormattedEmploymentInfo extends StatelessWidget {
  String employmentInfoString;
  FormattedEmploymentInfo({
    Key? key,
    required this.employmentInfoString
  }) : super(key: key);

  var string_2_EmploymentInfoMap = {
    'Employee Code' : EmployeeCode(),
    'Department': Department(),
    'Work Location': WorkLocation(),
    'Employment Category': EmploymentCategory(),
    'Employment Status': EmploymentStatus(),
    'Employment Type': EmploymentType(),
    'L1 Manager ID': L1ManagerID(),
    'L2 Manager ID': L2ManagerID(),
    'HR Manager ID': HRManagerID(),
  };

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: portrait == true ? 200 : 200,
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
              width: portrait == true ? 150 : 150,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: string_2_EmploymentInfoMap[employmentInfoString],
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
          // style: TextStyle(
          //   color: kSecondaryColor,
          // ),
        );
      }
    });
  }
}

class Department extends StatelessWidget {
  const Department({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileDetailsController = Get.find<ProfileDetailsController>();
    return Obx(() {
      if (profileDetailsController.isLoading.value) {
        return Text('Department Loading');
      } else {
        return Text(
          // 'HI',
          profileDetailsController.employeeInfoModelDetails?.department ??
              'Department Found Null',
          // style: TextStyle(
          //   color: kSecondaryColor,
          // ),
        );
      }
    });
  }
}

class WorkLocation extends StatelessWidget {
  const WorkLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileDetailsController = Get.find<ProfileDetailsController>();
    return Obx(() {
      if (profileDetailsController.isLoading.value) {
        return Text('Work Location Loading');
      } else {
        return Text(
          // 'HI',
          profileDetailsController.employeeInfoModelDetails?.workLocation ??
              'Work Location Found Null',
          // style: TextStyle(
          //   color: kSecondaryColor,
          // ),
        );
      }
    });
  }
}



class EmploymentCategory extends StatelessWidget {
  const EmploymentCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileDetailsController = Get.find<ProfileDetailsController>();
    return Obx(() {
      if (profileDetailsController.isLoading.value) {
        return Text('Employment Category Loading');
      } else {
        return Text(
          // 'HI',
          profileDetailsController.employeeInfoModelDetails?.employementCategory ??
              'Employment Category Found Null',
          // style: TextStyle(
          //   color: kSecondaryColor,
          // ),
        );
      }
    });
  }
}


class EmploymentStatus extends StatelessWidget {
  const EmploymentStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileDetailsController = Get.find<ProfileDetailsController>();
    return Obx(() {
      if (profileDetailsController.isLoading.value) {
        return Text('Employment Status Loading');
      } else {
        return Text(
          // 'HI',
          profileDetailsController.employeeInfoModelDetails?.employementStatus ??
              'Employment Status Found Null',
          // style: TextStyle(
          //   color: kSecondaryColor,
          // ),
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
          // style: TextStyle(
          //   color: kSecondaryColor,
          // ),
        );
      }
    });
  }
}


class L1ManagerID extends StatelessWidget {
  const L1ManagerID({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileDetailsController = Get.find<ProfileDetailsController>();
    return Obx(() {
      if (profileDetailsController.isLoading.value) {
        return Text('L1 Manager ID Loading');
      } else {
        return Text(
          // 'HI',
          profileDetailsController.employeeInfoModelDetails?.l1ManagerId.toString() ??
              'L1 Manager ID Found Null',
          // style: TextStyle(
          //   color: kSecondaryColor,
          // ),
        );
      }
    });
  }
}


class L2ManagerID extends StatelessWidget {
  const L2ManagerID({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileDetailsController = Get.find<ProfileDetailsController>();
    return Obx(() {
      if (profileDetailsController.isLoading.value) {
        return Text('L2 Manager ID Loading');
      } else {
        return Text(
          // 'HI',
          profileDetailsController.employeeInfoModelDetails?.l2ManagerId.toString() ??
              'L2 Manager ID Found Null',
          // style: TextStyle(
          //   color: kSecondaryColor,
          // ),
        );
      }
    });
  }
}


class HRManagerID extends StatelessWidget {
  const HRManagerID({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileDetailsController = Get.find<ProfileDetailsController>();
    return Obx(() {
      if (profileDetailsController.isLoading.value) {
        return Text('HR Manager ID Loading');
      } else {
        return Text(
          // 'HI',
          profileDetailsController.employeeInfoModelDetails?.hrManagerId.toString() ??
              'HR Manager ID Found Null',
          // style: TextStyle(
          //   color: kSecondaryColor,
          // ),
        );
      }
    });
  }
}

// class EmploymentDetailsFooter extends StatelessWidget {
//   const EmploymentDetailsFooter({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Expanded(
//           flex: 1,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'History',
//                     style: TextStyle(
//                       // color: kSecondaryColor,
//                       fontSize: 15,
//                     ),
//                   ),
//                   // Padding(
//                   //   padding: const EdgeInsets.only(bottom: 8),
//                   //   child: ModifyButton(),
//                   // ),
//                 ],
//               ),
//               Table(
//                 border: TableBorder.all(
//                   // color: kPrimaryColor,
//                   color: kTextColor,
//                 ),
//                 children: [
//                   TableRow(
//                     children: [
//                       Text(
//                         'Heading 1',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           // color: kSecondaryColor,
//                         ),
//                       ),
//                       Text(
//                         'Heading 2',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           // color: kSecondaryColor,
//                         ),
//                       ),
//                       Text(
//                         'Heading 3',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           // color: kSecondaryColor,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               Expanded(
//                 flex: 2,
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.vertical,
//                   child: EmploymentHistory(),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// class EmploymentHistory extends StatelessWidget {
//   const EmploymentHistory({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Table(
//       border: TableBorder.all(
//         // color: kPrimaryColor,
//         color: kTextColor,
//       ),
//       children: [
//         TableRow(
//           children: [
//             Text(
//               'Cell 1',
//               // style: TextStyle(
//               //   color: kSecondaryColor,
//               // ),
//             ),
//             Text(
//               'Cell 2',
//               // style: TextStyle(
//               //   color: kSecondaryColor,
//               // ),
//             ),
//             Text(
//               'Cell 3',
//               // style: TextStyle(
//               //   color: kSecondaryColor,
//               // ),
//             ),
//           ],
//         ),
//         TableRow(
//           children: [
//             Text(
//               'Cell 1',
//               // style: TextStyle(
//               //   color: kSecondaryColor,
//               // ),
//             ),
//             Text(
//               'Cell 2',
//               // style: TextStyle(
//               //   color: kSecondaryColor,
//               // ),
//             ),
//             Text(
//               'Cell 3',
//               // style: TextStyle(
//               //   color: kSecondaryColor,
//               // ),
//             ),
//           ],
//         ),
//         TableRow(
//           children: [
//             Text(
//               'Cell 1',
//               // style: TextStyle(
//               //   color: kSecondaryColor,
//               // ),
//             ),
//             Text(
//               'Cell 2',
//               // style: TextStyle(
//               //   color: kSecondaryColor,
//               // ),
//             ),
//             Text(
//               'Cell 3',
//               // style: TextStyle(
//               //   color: kSecondaryColor,
//               // ),
//             ),
//           ],
//         ),
//         TableRow(
//           children: [
//             Text(
//               'Cell 1',
//               // style: TextStyle(
//               //   color: kSecondaryColor,
//               // ),
//             ),
//             Text(
//               'Cell 2',
//               // style: TextStyle(
//               //   color: kSecondaryColor,
//               // ),
//             ),
//             Text(
//               'Cell 3',
//               // style: TextStyle(
//               //   color: kSecondaryColor,
//               // ),
//             ),
//           ],
//         ),
//         TableRow(
//           children: [
//             Text(
//               'Cell 1',
//               // style: TextStyle(
//               //   color: kSecondaryColor,
//               // ),
//             ),
//             Text(
//               'Cell 2',
//               // style: TextStyle(
//               //   color: kSecondaryColor,
//               // ),
//             ),
//             Text(
//               'Cell 3',
//               // style: TextStyle(
//               //   color: kSecondaryColor,
//               // ),
//             ),
//           ],
//         ),
//         TableRow(
//           children: [
//             Text(
//               'Cell 1',
//               // style: TextStyle(
//               //   color: kSecondaryColor,
//               // ),
//             ),
//             Text(
//               'Cell 2',
//               // style: TextStyle(
//               //   color: kSecondaryColor,
//               // ),
//             ),
//             Text(
//               'Cell 3',
//               // style: TextStyle(
//               //   color: kSecondaryColor,
//               // ),
//             ),
//           ],
//         ),
//         TableRow(
//           children: [
//             Text(
//               'Cell 1',
//               // style: TextStyle(
//               //   color: kSecondaryColor,
//               // ),
//             ),
//             Text(
//               'Cell 2',
//               // style: TextStyle(
//               //   color: kSecondaryColor,
//               // ),
//             ),
//             Text(
//               'Cell 3',
//               // style: TextStyle(
//               //   color: kSecondaryColor,
//               // ),
//             ),
//           ],
//         ),
//         TableRow(
//           children: [
//             Text(
//               'Cell 1',
//               // style: TextStyle(
//               //   color: kSecondaryColor,
//               // ),
//             ),
//             Text(
//               'Cell 2',
//               // style: TextStyle(
//               //   color: kSecondaryColor,
//               // ),
//             ),
//             Text(
//               'Cell 3',
//               // style: TextStyle(
//               //   color: kSecondaryColor,
//               // ),
//             ),
//           ],
//         ),
//         TableRow(
//           children: [
//             Text(
//               'Cell 1',
//               // style: TextStyle(
//               //   color: kSecondaryColor,
//               // ),
//             ),
//             Text(
//               'Cell 2',
//               // style: TextStyle(
//               //   color: kSecondaryColor,
//               // ),
//             ),
//             Text(
//               'Cell 3',
//               // style: TextStyle(
//               //   color: kSecondaryColor,
//               // ),
//             ),
//           ],
//         ),
//         TableRow(
//           children: [
//             Text(
//               'Cell 1',
//               // style: TextStyle(
//               //   color: kSecondaryColor,
//               // ),
//             ),
//             Text(
//               'Cell 2',
//               // style: TextStyle(
//               //   color: kSecondaryColor,
//               // ),
//             ),
//             Text(
//               'Cell 3',
//               // style: TextStyle(
//               //   color: kSecondaryColor,
//               // ),
//             ),
//           ],
//         ),
//         TableRow(
//           children: [
//             Text(
//               'Cell 1',
//               // style: TextStyle(
//               //   color: kSecondaryColor,
//               // ),
//             ),
//             Text(
//               'Cell 2',
//               // style: TextStyle(
//               //   color: kSecondaryColor,
//               // ),
//             ),
//             Text(
//               'Cell 3',
//               // style: TextStyle(
//               //   color: kSecondaryColor,
//               // ),
//             ),
//           ],
//         ),
//         TableRow(
//           children: [
//             Text(
//               'Cell 1',
//               // style: TextStyle(
//               //   color: kSecondaryColor,
//               // ),
//             ),
//             Text(
//               'Cell 2',
//               // style: TextStyle(
//               //   color: kSecondaryColor,
//               // ),
//             ),
//             Text(
//               'Cell 3',
//               // style: TextStyle(
//               //   color: kSecondaryColor,
//               // ),
//             ),
//           ],
//         ),
        
//       ],
//     );
//   }
// }
