// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workify/controllers/modify_profile_widgets_controller.dart';
import 'package:workify/screens/ProfileSection/ModifySelf_EmployeePosition_Employment/user_specific_basic_details.dart';
import 'package:workify/utils/constants.dart';
import 'package:workify/utils/sizes.dart';

import 'modify_position_details.dart';
import 'modify_employment_details.dart';

double screenWidth = 0, screenHeight = 0;

// ignore: must_be_immutable
class ModifyEmployeeProfileDetails extends StatelessWidget {
  const ModifyEmployeeProfileDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DeviceSize device = DeviceSize();
    device.size = MediaQuery.of(context).size;
    screenWidth = device.size.width;
    screenHeight = device.size.height;

    final modifyProfileWidgetsController =
        Get.find<ModifyProfileWidgetsController>();

    final index =
        (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{});



    Map<String, Widget> profileWidgets = {
      'Employee Basic Details': UserSpecificBasicDetails(
        index: index,
      ),
      'Modify Position Details': ModifyPositionDetails(
        index: index,
      ),
      'Modify Employment Details': ModifyEmploymentDetails(index: index),
    };

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
                        ModifyEmployeeProfileDetailsString:
                            "Employee Basic Details",
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: PositionDetailsButton(
                        ModifyEmployeeProfileDetailsString:
                            "Modify Position Details",
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: EmploymentDetailsButton(
                        ModifyEmployeeProfileDetailsString:
                            "Modify Employment Details",
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
                      child: Obx(() => profileWidgets[
                          modifyProfileWidgetsController
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
  // onpressed: () => profileWidgetHandler(ModifyEmployeeProfileDetailsString);

  final String ModifyEmployeeProfileDetailsString;
  // final int buttonIndex;
  Buttons({
    Key? key,
    required this.ModifyEmployeeProfileDetailsString,
    // required this.buttonIndex
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final modifyProfileWidgetsController =
        Get.find<ModifyProfileWidgetsController>();

    var button = ModifyEmployeeProfileDetailsString == 'Employee Basic Details'
        ? modifyProfileWidgetsController.employeeBasicDetailsButton
        : ModifyEmployeeProfileDetailsString == 'Modify Position Details'
            ? modifyProfileWidgetsController.modifyPositionButton
            : modifyProfileWidgetsController.modifyEmploymentButton;

    return Obx(() => ElevatedButton(
          onPressed: () {
            modifyProfileWidgetsController.resetModifyProfileButtons();
            modifyProfileWidgetsController.updateModifyProfileWidgetString(
                ModifyEmployeeProfileDetailsString);
            modifyProfileWidgetsController.setModifyProfileButton(
                str: ModifyEmployeeProfileDetailsString);
          },
          style: ElevatedButton.styleFrom(
            primary: button.value == true ? kPrimaryColor : kSecondaryColor,
          ),
          child: Center(
            child: Text(
              ModifyEmployeeProfileDetailsString,
              style: TextStyle(
                fontSize: screenWidth * 0.015,
                color: button.value == true ? kSecondaryColor : kPrimaryColor,
              ),
            ),
          ),
        ));
  }
}

class EmployeeBasicDetailsButton extends StatelessWidget {
  final String ModifyEmployeeProfileDetailsString;

  const EmployeeBasicDetailsButton({
    Key? key,
    required this.ModifyEmployeeProfileDetailsString,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Buttons(
      ModifyEmployeeProfileDetailsString: ModifyEmployeeProfileDetailsString,
    );
  }
}

class PositionDetailsButton extends StatelessWidget {
  final String ModifyEmployeeProfileDetailsString;

  const PositionDetailsButton({
    Key? key,
    required this.ModifyEmployeeProfileDetailsString,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Buttons(
      ModifyEmployeeProfileDetailsString: ModifyEmployeeProfileDetailsString,
    );
  }
}

class EmploymentDetailsButton extends StatelessWidget {
  final String ModifyEmployeeProfileDetailsString;

  const EmploymentDetailsButton({
    Key? key,
    required this.ModifyEmployeeProfileDetailsString,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Buttons(
      ModifyEmployeeProfileDetailsString: ModifyEmployeeProfileDetailsString,
    );
  }
}
