// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:workify/components/button.dart';
import 'package:workify/controllers/profile_details_controller.dart';
import 'package:workify/controllers/update_profile_details_controller.dart';
import 'package:workify/exceptions/print_log.dart';
import 'package:workify/screens/ProfileSection/text_form_modify_profile_details.dart';
import 'package:workify/utils/sizes.dart';

double screenWidth = 0, screenHeight = 0;
bool portrait = false;

final profileDetailsController = Get.find<ProfileDetailsController>();
final updateProfileDetailsController =
    Get.find<UpdateProfileDetailsController>();

class ModifyEmploymentDetails extends StatelessWidget {
  const ModifyEmploymentDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulModifyEmploymentDetails();
  }
}

class StatefulModifyEmploymentDetails extends StatefulWidget {
  const StatefulModifyEmploymentDetails({Key? key}) : super(key: key);

  @override
  _StatefulModifyEmploymentDetailsState createState() =>
      _StatefulModifyEmploymentDetailsState();
}

class _StatefulModifyEmploymentDetailsState
    extends State<StatefulModifyEmploymentDetails> {
  var _workLocation, _employementCategory, _employementStatus;
  var _employementType, _l1ManagerId, _l2ManagerId, _hrManagerId;

  void getBack() {
    Get.offNamed('/home');
  }

  void callOnSubmitEmploymentDetails() {
    UpdateProfileDetailsController.onSubmitEmploymentDetails(
        workLocation: _workLocation.text,
        employementCategory: _employementCategory.text,
        employementStatus: _employementStatus.text,
        employementType: _employementType.text,
        l1ManagerId: _l1ManagerId.text,
        l2ManagerId: _l2ManagerId.text,
        hrManagerId: _hrManagerId.text);
  }

  @override
  Widget build(BuildContext context) {
    DeviceSize device = DeviceSize();
    device.size = MediaQuery.of(context).size;
    screenWidth = device.size.width;
    screenHeight = device.size.height;

    portrait = screenWidth < 1000;

    var textFormList = [
      'Work Location',
      'Employment Category',
      'Employment Status',
      'Employement Type',
      'L1 Manager ID',
      'L2 Manager ID',
      'HR Manager ID',
    ];
    _workLocation = TextEditingController(
      text: profileDetailsController.employeeInfoModelDetails?.workLocation ??
          'Work Location Not Found',
    );

    _employementCategory = TextEditingController(
      text: profileDetailsController
              .employeeInfoModelDetails?.employementCategory ??
          'Employment Category Not Found',
    );

    _employementStatus = TextEditingController(
      text: profileDetailsController
              .employeeInfoModelDetails?.employementStatus ??
          'Employment Status Not Found',
    );

    _employementType = TextEditingController(
      text:
          profileDetailsController.employeeInfoModelDetails?.employementType ??
              'Employment Type Not Found',
    );

    _l1ManagerId = TextEditingController(
      text: profileDetailsController.employeeInfoModelDetails?.l1ManagerId
              .toString() ??
          'L1 Manager ID Not Found',
    );

    _l2ManagerId = TextEditingController(
      text: profileDetailsController.employeeInfoModelDetails?.l2ManagerId
              .toString() ??
          'L2 Manager ID Not Found',
    );

    _hrManagerId = TextEditingController(
      text: profileDetailsController.employeeInfoModelDetails?.hrManagerId
              .toString() ??
          'HR Manager ID Not Found',
    );

    var textFormList_2_Controllers = {
      'Work Location': _workLocation,
      'Employment Category': _employementCategory,
      'Employment Status': _employementStatus,
      'Employement Type': _employementType,
      'L1 Manager ID': _l1ManagerId,
      'L2 Manager ID': _l2ManagerId,
      'HR Manager ID': _hrManagerId
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
                    4,
                    (index) => TextFormModifyProfileDetails(
                          myFocusNode: FocusNode(),
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
                  Button(
                    buttonTextWidget: Text('Get Back'),
                    onPressed: getBack,
                  ),
                  Button(
                    buttonTextWidget: Text('Submit'),
                    onPressed: callOnSubmitEmploymentDetails,
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
