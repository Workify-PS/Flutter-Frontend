import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:workify/components/button.dart';
import 'package:workify/exceptions/print_log.dart';
import 'package:workify/screens/ProfileSection/text_form_modify_profile_details.dart';
import 'package:workify/utils/sizes.dart';
import 'package:workify/controllers/profile_details_controller.dart';

double screenWidth = 0, screenHeight = 0;
bool portrait = false;

class ModifyPositionDetails extends StatelessWidget {
  ModifyPositionDetails({Key? key}) : super(key: key);
  
  final profileDetailsController = Get.find<ProfileDetailsController>();

  void cancelClicked (){
    PrintLog.printLog(
      fileName: 'modify_position_details',
      functionName: 'Cancel : onPressed',
      blockNumber: 1,
      printStatement: 'Cancel Clicked',
    );
  }
  void submitClicked (){
    PrintLog.printLog(
      fileName: 'modify_position_details',
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
      'User Position ID',
      'Designation',
      'Grade',
      'Job Position',
    ];
    
    var textFormList_2_Controller = {
      'User Position ID' : TextEditingController(
        text: profileDetailsController.employeeDetailsModelDetails?.userPosId.toString()
          ?? 'User Position ID Not Found',
      ),
      'Designation' : TextEditingController(
        text: profileDetailsController.employeeDetailsModelDetails?.designation
          ?? 'Designation Not Found',
      ),
      'Grade' : TextEditingController(
        text: profileDetailsController.employeeDetailsModelDetails?.grade
          ?? 'Grade Not Found',
      ),
      'Job Position' : TextEditingController(
        text: profileDetailsController.employeeInfoModelDetails?.jobPosition
          ?? 'Job Position Not Found',
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
                children: List.generate(4,(index) => TextFormModifyProfileDetails(
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
