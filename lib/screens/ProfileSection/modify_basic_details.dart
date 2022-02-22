import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:workify/components/button.dart';
import 'package:workify/controllers/update_profile_details_controller.dart';
import 'package:workify/exceptions/print_log.dart';
import 'package:workify/screens/ProfileSection/text_form_modify_profile_details.dart';
import 'package:workify/utils/sizes.dart';
import 'package:workify/controllers/profile_details_controller.dart';

double screenWidth = 0, screenHeight = 0;
bool portrait = false;

class ModifyBasicDetails extends StatelessWidget {
  const ModifyBasicDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WrapModifyBasicDetails();
  }
}

class WrapModifyBasicDetails extends StatefulWidget {
  const WrapModifyBasicDetails({Key? key}) : super(key: key);

  @override
  _WrapModifyBasicDetailsState createState() => _WrapModifyBasicDetailsState();
}

class _WrapModifyBasicDetailsState extends State<WrapModifyBasicDetails> {
  void cancelClicked() {
    PrintLog.printLog(
      fileName: 'modify_basic_details',
      functionName: 'Cancel : onPressed',
      blockNumber: 1,
      printStatement: 'Cancel Clicked',
    );
  }

  @override
  Widget build(BuildContext context) {
    final profileDetailsController = Get.find<ProfileDetailsController>();
    final updateProfileDetailsController =
        Get.put(UpdateProfileDetailsController());

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

    var _mobileNumber = TextEditingController(
      text: profileDetailsController.employeeInfoModelDetails?.mobile ??
          'Mobile Number Not Found',
    );

    var _DoB = TextEditingController(
        text: DateFormat('dd-MM-yyyy').format(DateTime.parse(
            profileDetailsController.employeeInfoModelDetails?.dob)));

    var _marriageStatus = TextEditingController(
      text: profileDetailsController.employeeInfoModelDetails?.marriageStatus ??
          'Marriage Status Not Found',
    );

    var _city = TextEditingController(
      text: profileDetailsController.employeeInfoModelDetails?.city ??
          'City Not Found',
    );

    var _state = TextEditingController(
      text: profileDetailsController.employeeInfoModelDetails?.state ??
          'State Not Found',
    );

    var _country = TextEditingController(
      text: profileDetailsController.employeeInfoModelDetails?.country ??
          'Country Not Found',
    );

    var textFormList_2_Controllers = {
      'Mobile Number': _mobileNumber,
      'Date of Birth': _DoB,
      'Marriage Status': _marriageStatus,
      'City': _city,
      'State': _state,
      'Country': _country
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
                    buttonTextWidget: Text('Cancel'),
                    onPressed: cancelClicked,
                  ),
                  Button(
                      buttonTextWidget: Text('Submit'),
                      onPressed: () {
                        print(_mobileNumber.text);
                      }
                      // updateProfileDetailsController.onSubmitBasicDetails,
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
