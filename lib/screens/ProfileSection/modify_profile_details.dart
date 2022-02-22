// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workify/controllers/profile_widgets_controller.dart';
import 'package:workify/utils/constants.dart';
import 'package:workify/utils/sizes.dart';

import 'modify_position_details.dart';
import 'modify_employment_details.dart';

double screenWidth = 0, screenHeight = 0;


// ignore: must_be_immutable
class ModifyProfileDetails extends StatelessWidget {
  ModifyProfileDetails({Key? key}) : super(key: key);

  Map<String, Widget> profileWidgets = {
    'Modify Position Details': ModifyPositionDetails(),
    'Modify Employment Details': ModifyEmploymentDetails(),
  };

  @override
  Widget build(BuildContext context) {
    DeviceSize device = DeviceSize();
    device.size = MediaQuery.of(context).size;
    screenWidth = device.size.width;
    screenHeight = device.size.height;
    ProfileWidgetsController profileWidgetsController =
        Get.find<ProfileWidgetsController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Modify Employee Profile',
          style: TextStyle(
            // color: kSecondaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        // flexibleSpace: Container(
        //   decoration: BoxDecoration(
        //     color: kPrimaryColor,
        //   ),
        // ),
      ),
      body: Center(
        child: Container(
          width: device.size.width / 1.1,
          height: device.size.height / 1.1,
          decoration: BoxDecoration(
            // color: kPrimaryColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Flex(
            direction: Axis.vertical,
            children: [
              Expanded(
                flex: 1,
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(
                      flex: 1,
                      child: PositionDetailsButton(
                        modifyProfileDetailsString: "Modify Position Details",
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: EmploymentDetailsButton(
                        modifyProfileDetailsString: "Modify Employment Details",
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 10,
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Material(
                    elevation: 20,
                    color: Colors.transparent,
                    child: SizedBox(
                      width: screenWidth,
                      // decoration: BoxDecoration(
                      //   borderRadius: BorderRadius.circular(20),
                      // ),
                      // Rendering All widgets here
                      child: Obx(() => profileWidgets[profileWidgetsController
                          .modifyProfileWidgetString.value
                          .toString()]!),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Buttons extends StatelessWidget {
  // method with parameters in stateful widget
  // final void Function(String) profileWidgetHandler;
  // step to call such a method
  // onpressed: () => profileWidgetHandler(modifyProfileDetailsString);

  final String modifyProfileDetailsString;
  final int buttonIndex;
  Buttons(
      {Key? key,
      required this.modifyProfileDetailsString,
      required this.buttonIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileWidgetsController =
        Get.find<ProfileWidgetsController>();

    var button = buttonIndex == 0
        ? profileWidgetsController.modifyPositionButton
        : profileWidgetsController.modifyEmploymentButton;

    return Obx(() => ElevatedButton(
          onPressed: () {
            profileWidgetsController.resetModifyProfileButtons();
            profileWidgetsController
                .updateModifyProfileWidgetString(modifyProfileDetailsString);
            profileWidgetsController.setModifyProfileButton(
                str: modifyProfileDetailsString);
          },
          style: ElevatedButton.styleFrom(
            primary: button.value == true ? kPrimaryColor : kSecondaryColor,
          ),
          child: Center(
            child: Text(
              modifyProfileDetailsString,
              style: TextStyle(
                fontSize: screenWidth * 0.015,
                // fontWeight: FontWeight.bold,
                color: button.value == true ? kSecondaryColor : kPrimaryColor,
              ),
            ),
          ),
        ));
  }
}

class PositionDetailsButton extends StatelessWidget {
  final String modifyProfileDetailsString;

  const PositionDetailsButton({
    Key? key,
    required this.modifyProfileDetailsString,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Buttons(
      modifyProfileDetailsString: modifyProfileDetailsString,
      buttonIndex: 0,
    );
  }
}

class EmploymentDetailsButton extends StatelessWidget {
  final String modifyProfileDetailsString;

  const EmploymentDetailsButton({
    Key? key,
    required this.modifyProfileDetailsString,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Buttons(
      modifyProfileDetailsString: modifyProfileDetailsString,
      buttonIndex: 1,
    );
  }
}
