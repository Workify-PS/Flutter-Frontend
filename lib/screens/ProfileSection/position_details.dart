// import 'dart:math';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:workify/utils/sizes.dart';
import 'package:workify/utils/constants.dart';

import './modify_history_buttons.dart';
import 'package:workify/screens/ProfileSection/ProfileSectionControllers/profile_details_controller.dart';

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
    // print('\n\n\n' + portrait.toString() + '\n\n');
    // Condition to get Portrait or LandScape View
    return portrait == false
        ? Column(
            children: [
              Expanded(
                flex: 7,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Employeecode,poscode,designation,grade,
                        EmployeeCode(),
                        PositionCode(),
                        Designation(),
                        Grade(),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // empCate,empstat,emptyp,dept
                        EmploymentCategory(),
                        EmploymentStatus(),
                        EmploymentType(),
                        Department(),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // workLoc,l1,l2,hr
                        WorkLocation(),
                        L1ManagerId(),
                        L2ManagerId(),
                        HRManagerId(),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // orgId,isAct,ofmail,doj,
                        OrgId(),
                        IsActive(),
                        OfficialEmail(),
                        DoJ(),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        JobRole(),
                        SizedBox(
                          height: screenHeight * 0.16,
                        ),
                        ModifyButton(),
                      ],
                    ),
                  ],
                ),
              ),
              // Landscape Footer
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Text(
                          'History',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: kSecondaryColor,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        PositionHistory(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        : PositionDetailsPortraitView();
  }
}

class PositionDetailsPortraitView extends StatelessWidget {
  const PositionDetailsPortraitView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // return Column(
    //   children: [
    //     Expanded(
    //       flex: 8,
    //       child: Padding(
    //         padding: const EdgeInsets.symmetric(
    //           horizontal: 8,
    //           vertical: 5,
    //         ),
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //           children: [
    //             EmployeeCode(),
    //             PositionCode(),
    //             Designation(),
    //             Grade(),
    //             EmploymentCategory(),
    //             EmploymentStatus(),
    //             EmploymentType(),
    //             Department(),
    //             WorkLocation(),
    //             L1ManagerId(),
    //             L2ManagerId(),
    //             HRManagerId(),
    //             OrgId(),
    //             IsActive(),
    //             OfficialEmail(),
    //             DoJ(),
    //             JobRole(),
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.start,
    //               children: [
    //                 ModifyButton(),
    //               ],
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    // Expanded(
    //   flex: 2,
    //   child: SingleChildScrollView(
    //     scrollDirection: Axis.vertical,
    //     child: Padding(
    //       padding: const EdgeInsets.all(8.0),
    //       child: Column(
    //         children: [
    //           Text(
    //             'History',
    //             style: TextStyle(
    //               fontWeight: FontWeight.bold,
    //               color:kSecondaryColor,
    //             ),
    //           ),
    //           SizedBox(
    //                   height: 10,
    //           ),
    //           PositionHistory(),
    //         ],
    //       ),
    //     ),
    //   ),
    // ),
    //   ],
    // );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 6,
          // child: Container(
          //   width: 500,
          //   height: double.infinity,
          //   color: Colors.red,
          // ),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                // child: Container(
                //   width: 500,
                //   height: double.infinity,
                //   color: Colors.red,
                // ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Employee Code',
                      style: TextStyle(
                        color: kSecondaryColor,
                      ),
                    ),
                    // Text(
                    //   'Employment Status', //accountLocked ?
                    //   style: TextStyle(
                    //     color: kSecondaryColor,
                    //   ),
                    // ),
                    Text(
                      'Department',
                      style: TextStyle(
                        color: kSecondaryColor,
                      ),
                    ),
                    Text(
                      'Work Location',
                      style: TextStyle(
                        color: kSecondaryColor,
                      ),
                    ),
                    Text(
                      'Organization ID',
                      style: TextStyle(
                        color: kSecondaryColor,
                      ),
                    ),
                    Text(
                      'Account Active ?',
                      style: TextStyle(
                        color: kSecondaryColor,
                      ),
                    ),
                    Text(
                      'Official Mail',
                      style: TextStyle(
                        color: kSecondaryColor,
                      ),
                    ),
                    Text(
                      'Date of Joining',
                      style: TextStyle(
                        color: kSecondaryColor,
                      ),
                    ),
                    Text(
                      'Job Role',
                      style: TextStyle(
                        color: kSecondaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: screenWidth * 0.1,
                height: double.infinity,
                color: Colors.transparent,
              ),
              Expanded(
                flex: 4,
                // child: Container(
                //   width: 500,
                //   height: double.infinity,
                //   color: Colors.amber,
                // ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: EmployeeCode_(),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Department_(),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: WorkLocation_(),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: OrgID_(),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: AccountActive_(),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: OfficialEmail_(),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DoJ_(),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: JobRole_(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child:ModifyButton(),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                flex: 0,
                child: Text(
                  'History',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kSecondaryColor,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
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

class EmployeeCode_ extends StatelessWidget {
  const EmployeeCode_({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (profileDetailsController.isLoading.value) {
        return Text('Employee Code Loading');
      } else {
        return Text(
          // 'HI',
          profileDetailsController.profileModelDetails?.empCode ??
              'Employee Code Null',
          style: TextStyle(
            color: kSecondaryColor,
          ),
        );
      }
    });
  }
}

class Department_ extends StatelessWidget {
  const Department_({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (profileDetailsController.isLoading.value) {
        return Text('Department Loading');
      } else {
        return Text(
          // 'HI',
          profileDetailsController.profileModelDetails?.department ??
              'Department Null',
          style: TextStyle(
            color: kSecondaryColor,
          ),
        );
      }
    });
  }
}

class WorkLocation_ extends StatelessWidget {
  const WorkLocation_({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (profileDetailsController.isLoading.value) {
        return Text('Work Location Loading');
      } else {
        return Text(
          // 'HI',
          profileDetailsController.profileModelDetails?.workLocation ??
              'Work Location Null',
          style: TextStyle(
            color: kSecondaryColor,
          ),
        );
      }
    });
  }
}


class OrgID_ extends StatelessWidget {
  const OrgID_({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (profileDetailsController.isLoading.value) {
        return Text('Organization ID Loading');
      } else {
        return Text(
          // 'HI',
          profileDetailsController.profileModelDetails?.orgId.toString() ??
              'Organization ID Null',
          style: TextStyle(
            color: kSecondaryColor,
          ),
        );
      }
    });
  }
}


class AccountActive_ extends StatelessWidget {
  const AccountActive_({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (profileDetailsController.isLoading.value) {
        return Text('Account Active Loading');
      } else {
        return Text(
          // 'HI',
          profileDetailsController.profileModelDetails?.active == true ? 'Yes' : 'No',
          style: TextStyle(
            color: kSecondaryColor,
          ),
        );
      }
    });
  }
}


class OfficialEmail_ extends StatelessWidget {
  const OfficialEmail_({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (profileDetailsController.isLoading.value) {
        return Text('Official Email Loading');
      } else {
        return Text(
          // 'HI',
          profileDetailsController.profileModelDetails?.officialMail ??
              'Official Email Null',
          style: TextStyle(
            color: kSecondaryColor,
          ),
        );
      }
    });
  }
}


class DoJ_ extends StatelessWidget {
  const DoJ_({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (profileDetailsController.isLoading.value) {
        return Text('Date of Joining Loading');
      } else {
        return Text(
          // 'HI',
          profileDetailsController.profileModelDetails?.doj ??
              'Date of Joining Null',
          style: TextStyle(
            color: kSecondaryColor,
          ),
        );
      }
    });
  }
}


class JobRole_ extends StatelessWidget {
  const JobRole_({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (profileDetailsController.isLoading.value) {
        return Text('Job Role Loading');
      } else {
        return Text(
          // 'HI',
          profileDetailsController.profileModelDetails?.role ??
              'Job Role Null',
          style: TextStyle(
            color: kSecondaryColor,
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
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Employee Code',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: kSecondaryColor,
          ),
        ),
        SizedBox(
          // color: Colors.red,
          width: screenHeight * 0.2,
          height: screenHeight * 0.025,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              'Happy ForeverHappy ForeverHappy ForeverHappy ForeverHappy Forever',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class PositionCode extends StatelessWidget {
  const PositionCode({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Position Code',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: kSecondaryColor,
          ),
        ),
        SizedBox(
          // color: Colors.red,
          width: screenHeight * 0.2,
          height: screenHeight * 0.025,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              'Happy ForeverHappy ForeverHappy ForeverHappy ForeverHappy Forever',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Designation extends StatelessWidget {
  const Designation({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Designation',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: kSecondaryColor,
          ),
        ),
        SizedBox(
          // color: Colors.red,
          width: screenHeight * 0.2,
          height: screenHeight * 0.025,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              'Happy ForeverHappy ForeverHappy ForeverHappy ForeverHappy Forever',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Grade extends StatelessWidget {
  const Grade({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Grade',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: kSecondaryColor,
          ),
        ),
        SizedBox(
          // color: Colors.red,
          width: screenHeight * 0.2,
          height: screenHeight * 0.025,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              'Happy ForeverHappy ForeverHappy ForeverHappy ForeverHappy Forever',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class EmploymentCategory extends StatelessWidget {
  const EmploymentCategory({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Employment Category',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: kSecondaryColor,
          ),
        ),
        SizedBox(
          // color: Colors.red,
          width: screenHeight * 0.2,
          height: screenHeight * 0.025,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              'Happy ForeverHappy ForeverHappy ForeverHappy ForeverHappy Forever',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class EmploymentStatus extends StatelessWidget {
  const EmploymentStatus({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Employment Status',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: kSecondaryColor,
          ),
        ),
        SizedBox(
          // color: Colors.red,
          width: screenHeight * 0.2,
          height: screenHeight * 0.025,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              'Happy ForeverHappy ForeverHappy ForeverHappy ForeverHappy Forever',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class EmploymentType extends StatelessWidget {
  const EmploymentType({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Employment Type',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: kSecondaryColor,
          ),
        ),
        SizedBox(
          // color: Colors.red,
          width: screenHeight * 0.2,
          height: screenHeight * 0.025,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              'Happy ForeverHappy ForeverHappy ForeverHappy ForeverHappy Forever',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Department extends StatelessWidget {
  const Department({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Department',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: kSecondaryColor,
          ),
        ),
        SizedBox(
          // color: Colors.red,
          width: screenHeight * 0.2,
          height: screenHeight * 0.025,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              'Happy ForeverHappy ForeverHappy ForeverHappy ForeverHappy Forever',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class WorkLocation extends StatelessWidget {
  const WorkLocation({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Work Location',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: kSecondaryColor,
          ),
        ),
        SizedBox(
          // color: Colors.red,
          width: screenHeight * 0.2,
          height: screenHeight * 0.025,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              'Happy ForeverHappy ForeverHappy ForeverHappy ForeverHappy Forever',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class L1ManagerId extends StatelessWidget {
  const L1ManagerId({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'L1 Manager ID',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: kSecondaryColor,
          ),
        ),
        SizedBox(
          // color: Colors.red,
          width: screenHeight * 0.2,
          height: screenHeight * 0.025,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              'Happy ForeverHappy ForeverHappy ForeverHappy ForeverHappy Forever',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class L2ManagerId extends StatelessWidget {
  const L2ManagerId({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'L2 Manager ID',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: kSecondaryColor,
          ),
        ),
        SizedBox(
          // color: Colors.red,
          width: screenHeight * 0.2,
          height: screenHeight * 0.025,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              'Happy ForeverHappy ForeverHappy ForeverHappy ForeverHappy Forever',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class HRManagerId extends StatelessWidget {
  const HRManagerId({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'HR Manager ID',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: kSecondaryColor,
          ),
        ),
        SizedBox(
          // color: Colors.red,
          width: screenHeight * 0.2,
          height: screenHeight * 0.025,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              'Happy ForeverHappy ForeverHappy ForeverHappy ForeverHappy Forever',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class OrgId extends StatelessWidget {
  const OrgId({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Organization ID',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: kSecondaryColor,
          ),
        ),
        SizedBox(
          // color: Colors.red,
          width: screenHeight * 0.2,
          height: screenHeight * 0.025,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              'Happy ForeverHappy ForeverHappy ForeverHappy ForeverHappy Forever',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class IsActive extends StatelessWidget {
  const IsActive({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Is Active ?',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: kSecondaryColor,
          ),
        ),
        SizedBox(
          // color: Colors.red,
          width: screenHeight * 0.2,
          height: screenHeight * 0.025,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              'Happy ForeverHappy ForeverHappy ForeverHappy ForeverHappy Forever',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class OfficialEmail extends StatelessWidget {
  const OfficialEmail({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Official Email',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: kSecondaryColor,
          ),
        ),
        SizedBox(
          // color: Colors.red,
          width: screenHeight * 0.2,
          height: screenHeight * 0.025,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              'Happy ForeverHappy ForeverHappy ForeverHappy ForeverHappy Forever',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DoJ extends StatelessWidget {
  const DoJ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Date of Joining',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: kSecondaryColor,
          ),
        ),
        SizedBox(
          // color: Colors.red,
          width: screenHeight * 0.2,
          height: screenHeight * 0.025,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              'Happy ForeverHappy ForeverHappy ForeverHappy ForeverHappy Forever',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class JobRole extends StatelessWidget {
  const JobRole({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Job Role',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: kSecondaryColor,
          ),
        ),
        SizedBox(
          // color: Colors.red,
          width: screenHeight * 0.2,
          height: screenHeight * 0.025,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              'Happy ForeverHappy ForeverHappy ForeverHappy ForeverHappy Forever',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
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
