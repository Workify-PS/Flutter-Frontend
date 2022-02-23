// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:workify/components/button.dart';
import 'package:workify/controllers/update_profile_details_controller.dart';
import 'package:workify/exceptions/print_log.dart';
import 'package:workify/screens/ProfileSection/ModifyEmployeeProfileSection/text_form_modify_profile_details.dart';
import 'package:workify/utils/sizes.dart';
import 'package:workify/controllers/profile_details_controller.dart';

double screenWidth = 0, screenHeight = 0;
bool portrait = false;

final profileDetailsController = Get.find<ProfileDetailsController>();
final updateProfileDetailsController =
    Get.find<UpdateProfileDetailsController>();

class ModifyBasicDetails extends StatelessWidget {
  const ModifyBasicDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulModifyBasicDetails();
  }
}

class StatefulModifyBasicDetails extends StatefulWidget {
  const StatefulModifyBasicDetails({Key? key}) : super(key: key);

  @override
  _StatefulModifyBasicDetails createState() => _StatefulModifyBasicDetails();
}

class _StatefulModifyBasicDetails extends State<StatefulModifyBasicDetails> {
  var _mobileNumber, _doB, _marriageStatus, _city, _state, _country;

  void getBack() {
    Get.offNamed('/home');
  }

  void callOnSubmitBasicDetails() {
    UpdateProfileDetailsController.onSubmitBasicDetails(
        mobile: _mobileNumber.text,
        dob: _doB.text,
        marriageStatus: _marriageStatus.text,
        city: _city.text,
        state: _state.text,
        country: _country.text);
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

    _mobileNumber = TextEditingController(
      text: profileDetailsController.employeeInfoModelDetails?.mobile ??
          'Mobile Number Not Found',
    );

    _doB = TextEditingController(
        text: DateFormat('dd-MM-yyyy').format(DateTime.parse(
            profileDetailsController.employeeInfoModelDetails?.dob)));

    _marriageStatus = TextEditingController(
      text: profileDetailsController.employeeInfoModelDetails?.marriageStatus ??
          'Marriage Status Not Found',
    );

    _city = TextEditingController(
      text: profileDetailsController.employeeInfoModelDetails?.city ??
          'City Not Found',
    );

    _state = TextEditingController(
      text: profileDetailsController.employeeInfoModelDetails?.state ??
          'State Not Found',
    );

    _country = TextEditingController(
      text: profileDetailsController.employeeInfoModelDetails?.country ??
          'Country Not Found',
    );

    var textFormList_2_Controllers = {
      'Mobile Number': _mobileNumber,
      'Date of Birth': _doB,
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
                          enabled: index == 1 ? false : true,
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
                    onPressed: callOnSubmitBasicDetails,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
