import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:workify/components/button.dart';
import 'package:workify/controllers/profile_details_controller.dart';
import 'package:workify/exceptions/print_log.dart';
import 'package:workify/screens/ProfileSection/text_form_modify_profile_details.dart';
import 'package:workify/utils/sizes.dart';

double screenWidth = 0, screenHeight = 0;
bool portrait = false;

class ModifyEmploymentDetails extends StatelessWidget {
  ModifyEmploymentDetails({Key? key}) : super(key: key);

  final profileDetailsController = Get.find<ProfileDetailsController>();

  void cancelClicked() {
    PrintLog.printLog(
      fileName: 'modify_employment_details',
      functionName: 'Cancel : onPressed',
      blockNumber: 1,
      printStatement: 'Cancel Clicked',
    );
  }

  void submitClicked() {
    PrintLog.printLog(
      fileName: 'modify_employment_details',
      functionName: 'Submit : onPressed',
      blockNumber: 1,
      printStatement: 'Submit Clicked',
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
      'Work Location',
      'Employment Category',
      'Employment Status',
      'Employement Type',
      'L1 Manager ID',
      'L2 Manager ID',
      'HR Manager ID',
    ];


    var textFormList_2_Controller = {
      'Work Location' : TextEditingController(
        text: profileDetailsController.employeeInfoModelDetails?.workLocation ??
        'Work Location Not Found',
      ),
      'Employment Category' : TextEditingController(
        text: profileDetailsController.employeeInfoModelDetails?.employementCategory ??
        'Employment Category Not Found',
      ),
      'Employment Status' : TextEditingController(
        text: profileDetailsController.employeeInfoModelDetails?.employementStatus ??
        'Employment Status Not Found',
      ),
      'Employement Type' : TextEditingController(
        text: profileDetailsController.employeeInfoModelDetails?.employementType ??
        'Employment Type Not Found',
      ),
      'L1 Manager ID' : TextEditingController(
        text: profileDetailsController.employeeInfoModelDetails?.l1ManagerId.toString() ??
        'L1 Manager ID Not Found',
      ),
      'L2 Manager ID' : TextEditingController(
        text: profileDetailsController.employeeInfoModelDetails?.l2ManagerId.toString() ??
        'L2 Manager ID Not Found',
      ),
      'HR Manager ID' : TextEditingController(
        text: profileDetailsController.employeeInfoModelDetails?.hrManagerId.toString() ??
        'HR Manager ID Not Found',
      ),
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
                children: List.generate(7,(index) => TextFormModifyProfileDetails(
                    myFocusNode: FocusNode(),
                    text: textFormList[index],
                    controller:textFormList_2_Controller[textFormList[index]],
                  )
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Button(
                    buttonTextWidget: Text('Cancel'),
                    onPressed: cancelClicked,
                  ),
                  Button(
                    buttonTextWidget: Text('Submit'),
                    onPressed: submitClicked,
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
