// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:workify/components/button.dart';
import 'package:workify/controllers/fetch_all_employees_controller.dart';
import 'package:workify/controllers/modify_employee_profile_details_controller.dart';
import 'package:workify/screens/ProfileSection/ModifySelf_EmployeePosition_Employment/text_form_modify_profile_details.dart';
// import 'package:workify/exceptions/print_log.dart';

import 'package:workify/utils/sizes.dart';
import 'package:workify/controllers/profile_details_controller.dart';

double screenWidth = 0, screenHeight = 0;
bool portrait = false;
int idx = -1;

final profileDetailsController = Get.find<ProfileDetailsController>();
final modifyEmployeeProfileDetailsController =
    Get.find<ModifyEmployeeProfileDetailsController>();

class ModifyPositionDetails extends StatelessWidget {
  final index;
  const ModifyPositionDetails({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    idx = index;
    return StatefulModifyPositionDetails();
  }
}

class StatefulModifyPositionDetails extends StatefulWidget {
  const StatefulModifyPositionDetails({
    Key? key,
  }) : super(key: key);

  @override
  _StatefulModifyPositionDetailsState createState() =>
      _StatefulModifyPositionDetailsState();
}

class _StatefulModifyPositionDetailsState
    extends State<StatefulModifyPositionDetails> {
  var _userId, _designation, _grade, _jobPosition;

  void getBack() {
    Get.offAndToNamed('/all-employee-profile');
  }

  void callOnSubmitPositionDetails() {
    ModifyEmployeeProfileDetailsController.onSubmitPositionDetails(
        index : idx,
        userId: _userId.text,
        designation: _designation.text == 'Need to update.' ? '-1' : _designation.text ,
        grade: _grade.text == 'Need to update.' ? '-1' : _grade.text ,
        jobPosition: _jobPosition.text == 'Need to update.' ? '-1' : _jobPosition.text 
    );
  }

  @override
  Widget build(BuildContext context) {
    DeviceSize device = DeviceSize();
    device.size = MediaQuery.of(context).size;
    screenWidth = device.size.width;
    screenHeight = device.size.height;

    portrait = screenWidth < 1000;

    var textFormList = [
      // 'User Position ID',
      'Designation',
      'Grade',
      'Job Position',
    ];

    _userId = TextEditingController(
        // text: profileDetailsController.employeeInfoModelDetails?.userId
        //         .toString() ??
        // 'User Position ID Not Found',
        text: idx == -1
            ? 'User Position ID Not Found'
            : fetchAllEmployeesController.allEmployeeList
                .elementAt(idx)
                .userId
                .toString());

    _designation = TextEditingController(
        // text: profileDetailsController.employeeInfoModelDetails?.designation ??
        //     'Designation Not Found',
        text: idx == -1
            ? 'Designation  Not Found'
            : fetchAllEmployeesController.allEmployeeList
                .elementAt(idx)
                .designation
                .toString());

    _grade = TextEditingController(
        // text: profileDetailsController.employeeInfoModelDetails?.grade ??
        //     'Grade Not Found',
        text: idx == -1
            ? 'Grade  Not Found'
            : fetchAllEmployeesController.allEmployeeList
                .elementAt(idx)
                .grade
                .toString());

    _jobPosition = TextEditingController(
        // text: profileDetailsController.employeeInfoModelDetails?.jobPosition ??
        //     'Job Position Not Found',
        text: idx == -1
            ? 'Job Position  Not Found'
            : fetchAllEmployeesController.allEmployeeList
                .elementAt(idx)
                .jobPosition
                .toString());

    var textFormList_2_Controllers = {
      // 'User Position ID': _userId,
      'Designation': _designation,
      'Grade': _grade,
      'Job Position': _jobPosition
    };

    return Padding(
      padding: portrait == false
          ? const EdgeInsets.symmetric(horizontal: 300)
          : const EdgeInsets.all(8),
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                    3,
                    (index) => TextFormModifyDetails(
                          myFocusNode: FocusNode(),
                          keyBoardType: TextInputType.text,
                          enabled: true,
                          text: textFormList[index],
                          controller:
                              textFormList_2_Controllers[textFormList[index]],
                        )),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  PrimaryButton(
                    buttonTextWidget: Text('Get Back'),
                    onPressed: getBack,
                  ),
                  PrimaryButton(
                    buttonTextWidget: Text('Submit'),
                    onPressed: callOnSubmitPositionDetails,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
