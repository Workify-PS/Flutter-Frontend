import 'package:flutter/material.dart';
import 'package:workify/components/button.dart';
import 'package:workify/exceptions/print_log.dart';
import 'package:workify/screens/ProfileSection/text_form_modify_profile_details.dart';
import 'package:workify/utils/sizes.dart';

double screenWidth = 0, screenHeight = 0;
bool portrait = false;

class ModifyEmploymentDetails extends StatelessWidget {
  const ModifyEmploymentDetails({Key? key}) : super(key: key);

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
      'Work Location' : TextEditingController(text: 'workLoc'),
      'Employment Category' : TextEditingController(text: 'empCat'),
      'Employment Status' : TextEditingController(text: 'empStatus'),
      'Employement Type' : TextEditingController(text: 'empType'),
      'L1 Manager ID' : TextEditingController(text: 'L1_id'),
      'L2 Manager ID' : TextEditingController(text: 'L2_id'),
      'HR Manager ID' : TextEditingController(text: 'hr_id'),
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
