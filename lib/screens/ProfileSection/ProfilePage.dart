// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workify/controllers/UserController.dart';

// import 'package:workify/controllers/profile_details_controller.dart';
import 'package:workify/controllers/profile_widgets_controller.dart';
import 'package:workify/screens/ProfileSection/modify_basic_details.dart';
import 'package:workify/screens/ProfileSection/modify_profile_details.dart';
import 'package:workify/utils/constants.dart';
import 'package:workify/utils/sizes.dart';

import 'basic_details.dart';
import 'position_details.dart';
import 'employment_details.dart';

double screenWidth = 0, screenHeight = 0;

// ignore: must_be_immutable
class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  Map<String, Widget> profileWidgets = {
    'Basic Details': BasicDetails(),
    'Position Details': PositionDetails(),
    'Employment Details': EmploymentDetails(),
    'Modify Basic Details': ModifyBasicDetails(),
  };

  final profileWidgetsController = Get.find<ProfileWidgetsController>();
  final userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    // print('JobRole');
    // print(userController.currentUser?.value.role);
    DeviceSize device = DeviceSize();
    device.size = MediaQuery.of(context).size;
    screenWidth = device.size.width;
    screenHeight = device.size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile Page',
          // style: TextStyle(
          //   color: kPrimaryColor,
          //   fontWeight: FontWeight.bold,
          // ),
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
            // color: Colors.transparent,
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
                      child: BasicDetailsButton(
                        profileDetails: "Basic Details",
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: PositionDetailsButton(
                        profileDetails: "Position Details",
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: EmploymentDetailsButton(
                        profileDetails: "Employment Details",
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: ModifyProfileDetailsButton(
                          profileDetails: 'Modify Basic Details'
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
                          .widgetString.value
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
  // onpressed: () => profileWidgetHandler(profileDetails);

  final String profileDetails;
  final int buttonIndex;

  Buttons(
      {Key? key, required this.profileDetails, required this.buttonIndex})
      : super(key: key);

  final profileWidgetsController = Get.find<ProfileWidgetsController>();
  
  @override
  Widget build(BuildContext context) {

    var button = buttonIndex == 0
        ? profileWidgetsController.basicButton
        : buttonIndex == 1
            ? profileWidgetsController.positionButton
            : buttonIndex == 2
                ? profileWidgetsController.employmentButton
                : profileDetails == 'Modify Basic Details'
                    ? profileWidgetsController.modifyBasicButton
                    : profileWidgetsController.modifyButton;

    return Obx(() => ElevatedButton(
          onPressed: () {
            if (buttonIndex == 3 &&
                profileDetails == 'Modify Profile Details') {
              Get.to(ModifyProfileDetails());
            } else {
              profileWidgetsController.resetButtons();
              profileWidgetsController.updateWidgetString(profileDetails);
              profileWidgetsController.setButton(str: profileDetails);
            }
          },
          style: ElevatedButton.styleFrom(
            primary: button.value == true ? kPrimaryColor : kSecondaryColor,
          ),
          child: Center(
            child: Text(
              profileDetails,
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

class BasicDetailsButton extends StatelessWidget {
  final String profileDetails;

  const BasicDetailsButton({
    Key? key,
    required this.profileDetails,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Buttons(
      profileDetails: profileDetails,
      buttonIndex: 0,
    );
  }
}

class PositionDetailsButton extends StatelessWidget {
  final String profileDetails;

  const PositionDetailsButton({
    Key? key,
    required this.profileDetails,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Buttons(
      profileDetails: profileDetails,
      buttonIndex: 1,
    );
  }
}

class EmploymentDetailsButton extends StatelessWidget {
  final String profileDetails;

  const EmploymentDetailsButton({
    Key? key,
    required this.profileDetails,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Buttons(
      profileDetails: profileDetails,
      buttonIndex: 2,
    );
  }
}

class ModifyProfileDetailsButton extends StatelessWidget {
  final String profileDetails;

  const ModifyProfileDetailsButton({
    Key? key,
    required this.profileDetails,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Buttons(
      profileDetails: profileDetails,
      buttonIndex: 3,
    );
  }
}
