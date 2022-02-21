import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workify/components/button.dart';
import 'package:workify/exceptions/print_log.dart';
import 'package:workify/screens/ProfileSection/text_form_modify_profile_details.dart';
import 'package:workify/utils/sizes.dart';
import 'package:workify/controllers/profile_details_controller.dart';

double screenWidth = 0, screenHeight = 0;
bool portrait = false;

class ModifyBasicDetails extends StatelessWidget {
   ModifyBasicDetails({Key? key}) : super(key: key);

final profileDetailsController = Get.find<ProfileDetailsController>();

  void cancelClicked() {
    PrintLog.printLog(
      fileName: 'modify_basic_details',
      functionName: 'Cancel : onPressed',
      blockNumber: 1,
      printStatement: 'Cancel Clicked',
    );
  }

  void submitClicked() {
    PrintLog.printLog(
      fileName: 'modify_basic_details',
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
      'Mobile Number',
      'Date of Birth',
      'Marriage Status',
      'City',
      'State',
      'Country'
    ];

    var textFormList_2_Controller = {
      'Mobile Number' : TextEditingController(
        text: profileDetailsController.employeeInfoModelDetails?.mobile 
          ?? 'Mobile Number Not Found',
      ),
      'Date of Birth' : TextEditingController(
        text: profileDetailsController.employeeInfoModelDetails?.dob
          ?? 'Date of Birth Not Found',
      ),
      'Marriage Status' : TextEditingController(
        text: profileDetailsController.employeeInfoModelDetails?.marriageStatus
          ?? 'Marriage Status Not Found',
      ),
      'City' : TextEditingController(
        text: profileDetailsController.employeeInfoModelDetails?.city 
          ?? 'City Not Found',
      ),
      'State' : TextEditingController(
        text: profileDetailsController.employeeInfoModelDetails?.state
          ?? 'State Not Found',
      ),
      'Country' : TextEditingController(
        text: profileDetailsController.employeeInfoModelDetails?.country 
          ?? 'Country Not Found',
      )
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
                    5,
                    (index) => TextFormModifyProfileDetails(
                          myFocusNode: FocusNode(),
                          text: textFormList[index],
                          controller:textFormList_2_Controller[textFormList[index]],
                        )),
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
