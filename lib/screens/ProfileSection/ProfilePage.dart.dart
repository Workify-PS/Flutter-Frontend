// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
<<<<<<< HEAD:lib/screens/ProfileSection/profilePage.dart
// import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:workify/utils/constants.dart';
import 'package:workify/utils/sizes.dart';
import 'package:get/get.dart';

import 'ProfileSectionControllers/profile_widgets.dart';
=======
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:workify/utils/constants.dart';
import 'package:workify/utils/sizes.dart';
import 'package:workify/utils/extensions.dart';
import 'package:workify/utils/theme.dart';
>>>>>>> ea02943d38476f71ad56e2a64f056ea298882690:lib/screens/ProfileSection/ProfilePage.dart.dart
import 'basic_details.dart';
import 'position_details.dart';
import 'education_details.dart';
import 'employment_details.dart';
// import 'id_details.dart';
// import 'bank_details.dart';
// import 'contact_details.dart';
// import 'dependent_details.dart';

double screenWidth = 0, screenHeight = 0;

final controller = Get.put(ProfileWidget());

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  Map<String, Widget> profileWidgets = {
    'Basic Details': BasicDetails(),
    'Education Details': EducationDetails(),
    'Employment Details': EmploymentDetails(),
    'Position Details': PositionDetails(),
    // 'Bank_Details': BankDetails(),
    // 'Contact_Details': ContactDetails(),
    // 'Dependent_Details': DependentDetails(),
    // 'Id_Details': IdDetails(),
  };

  @override
  Widget build(BuildContext context) {
    DeviceSize device = DeviceSize();
    device.size = MediaQuery.of(context).size;
    screenWidth = device.size.width;
    screenHeight = device.size.height;
    // bool portrait = screenWidth < 1000;

    return Scaffold(
<<<<<<< HEAD:lib/screens/ProfileSection/profilePage.dart
      appBar: AppBar(
        title: Text(
          'Profile Page',
          style: TextStyle(
            color: kSecondaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            // gradient: LinearGradient(
            //   begin: Alignment.topRight,
            //   end: Alignment.bottomLeft,
            //   colors: [kPrimaryColor,Colors.teal],
            // ),
            color: kPrimaryColor,
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: device.size.width / 1.1,
          height: device.size.height / 1.1,
          decoration: BoxDecoration(
            // gradient: LinearGradient(
            //   begin: Alignment.topRight,
            //   end: Alignment.bottomLeft,
            //   colors: [Colors.transparent, Colors.teal],
            // ),
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Flex(
            //Outer shell design
            // direction: portrait == true ? Axis.horizontal : Axis.vertical,
            direction: Axis.vertical,
            children: [
              Expanded(
                flex: 1,
                child: Flex(
                  // details buttons design
                  // direction: portrait == true ? Axis.vertical : Axis.horizontal,
                  direction: Axis.horizontal,
                  children: [
                    Expanded(
                      // flex: portrait == true ? 1 : 2,
                      flex: 1,
                      child: BasicDetailsButton(
                        profileDetails: "Basic Details",
                        // profileWidgetHandler: setProfileWidget,
                      ),
                    ),
                    Expanded(
                      // flex: portrait == true ? 1 : 2,
                      flex: 1,
                      child: PositionDetailsButton(
                        profileDetails: "Position Details",
                        // profileWidgetHandler: setProfileWidget,
                      ),
                    ),
                    Expanded(
                      // flex: portrait == true ? 1 : 2,

                      flex: 1,
                      child: EmploymentDetailsButton(
                        profileDetails: "Employment Details",
                        // profileWidgetHandler: setProfileWidget,
                      ),
                    ),
                    Expanded(
                      // flex: portrait == true ? 1 : 2,
                      flex: 1,
                      child: EducationDetailsButton(
                        profileDetails: "Education Details",
                        // profileWidgetHandler: setProfileWidget,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 10,
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Container(
                    width: screenWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      // gradient: LinearGradient(
                      //   begin: Alignment.bottomLeft,
                      //   end: Alignment.topRight,
                      //   colors: [Colors.transparent, Colors.teal],
                      // ),
                      color: kPrimaryColor,
                    ),
                    // Rendering All widgets here
                    child: Obx(() => profileWidgets[
                        controller.widgetString.value.toString()]!),
=======
        appBar: AppBar(
          title: Text('ProfilePage'),
        ),
        body: Center(
            child: Neumorphic(
              style: NeumorphicStyle(
                color: kScaffoldColor,
                shadowLightColor: kBottomShadowColor,
                shape: NeumorphicShape.flat,
                boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(16))
              ),

          child: Container(
            alignment: Alignment.center,
            width: device.size.width / 1.25,
            height: device.size.height / 1.25,
            decoration: BoxDecoration(
              // gradient: LinearGradient(
              //   begin: Alignment.topRight,
              //   end: Alignment.bottomLeft,
              //   colors: [Colors.transparent, Colors.teal],
              // ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Flex(
              //Outer shell design
              // direction: portrait == true ? Axis.horizontal : Axis.vertical,
              direction: Axis.vertical,
              children: [
                Expanded(
                  flex: 1,
                  child: Flex(
                    // details buttons design
                    // direction: portrait == true ? Axis.vertical : Axis.horizontal,
                    direction: Axis.horizontal,
                    children: [
                      Expanded(
                        // flex: portrait == true ? 1 : 2,
                        flex: 1,
                        child: BasicDetailsButton(
                          profileDetails: "Basic_Details",
                          profileWidgetHandler: setProfileWidget,
                        ),
                      ),
                      Expanded(
                        // flex: portrait == true ? 1 : 2,
                        flex: 1,
                        child: PositionDetailsButton(
                          profileDetails: "Position_Details",
                          profileWidgetHandler: setProfileWidget,
                        ),
                      ),
                      // Expanded(
                      //   flex: portrait == true ? 1 : 2,
                      //   // child: ContactDetailsButton(),
                      //   child: ContactDetailsButton(
                      //     profileDetails: "Contact_Details",
                      //     profileWidgetHandler: setProfileWidget,
                      //   ),
                      // ),
                      // Expanded(
                      //   flex: portrait == true ? 1 : 2,
                      //   // child: DependentDetailsButton(),
                      //   child: DependentDetailsButton(
                      //     profileDetails: "Dependent_Details",
                      //     profileWidgetHandler: setProfileWidget,
                      //   ),
                      // ),
                      Expanded(
                        // flex: portrait == true ? 1 : 2,

                        flex: 1,
                        child: EmploymentDetailsButton(
                          profileDetails: "Employment_Details",
                          profileWidgetHandler: setProfileWidget,
                        ),
                      ),
                      Expanded(
                        // flex: portrait == true ? 1 : 2,
                        flex: 1,
                        child: EducationDetailsButton(
                          profileDetails: "Education_Details",
                          profileWidgetHandler: setProfileWidget,
                        ),
                      ),
                      // Expanded(
                      //   flex: portrait == true ? 1 : 2,
                      //   child: BankDetailsButton(
                      //     profileDetails: "Bank_Details",
                      //     profileWidgetHandler: setProfileWidget,
                      //   ),
                      // ),
                      // Expanded(
                      //   flex: portrait == true ? 1 : 2,
                      //   // child: IdDetailsButton(),
                      //   child: IdDetailsButton(
                      //     profileDetails: "Id_Details",
                      //     profileWidgetHandler: setProfileWidget,
                      //   ),
                      // ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Container(
                      width: screenWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        // gradient: LinearGradient(
                        //   begin: Alignment.bottomLeft,
                        //   end: Alignment.topRight,
                        //   colors: [Colors.transparent, Colors.teal],
                        // ),
                      ),
                      // Rendering All widgets here
                      child: profileWidgets[profileWidgetString]!,
                    ),
>>>>>>> ea02943d38476f71ad56e2a64f056ea298882690:lib/screens/ProfileSection/ProfilePage.dart.dart
                  ),
                ),
              ],
            ),
          )
        )));
  }
}

class Buttons extends StatelessWidget {
  // method with parameters in stateful widget
  // final void Function(String) profileWidgetHandler;

  final String profileDetails;
  final int buttonIndex;
  const Buttons(
      {Key? key, required this.profileDetails, required this.buttonIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var button = buttonIndex == 0
        ? controller.basicButton
        : buttonIndex == 1
            ? controller.positionButton
            : buttonIndex == 2
                ? controller.employmentButton
                : controller.educationButton;

    return Obx(() => ElevatedButton(
          onPressed: () {
            // step to call such a method
            // profileWidgetHandler(profileDetails);

            controller.resetButtons();
            controller.updateWidgetString(profileDetails);
            controller.setButton(str: profileDetails);
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
<<<<<<< HEAD:lib/screens/ProfileSection/profilePage.dart
    return Buttons(
      profileDetails: profileDetails,
      buttonIndex: 2,
=======
    return ElevatedButton(
      
      onPressed: () {
        profileWidgetHandler(profileDetails);

        // bankButtonPressed = false;
        // contactButtonPressed = false;
        // dependentButtonPressed = false;
        educationButtonPressed = false;
        // idButtonPressed = false;
        basicButtonPressed = false;
        positionButtonPressed = false;

        employmentButtonPressed = true;
      },
      style: ElevatedButton.styleFrom(
        
        primary: employmentButtonPressed == true
            ? kScaffoldDarkColor
            : kScaffoldColor,
      ),
      child: Center(
        child: Text(
          'Employment Details',
          style: TextStyle(fontSize: screenWidth * 0.012, color: employmentButtonPressed == true? kTextDarkColor:kTextColor
              // fontWeight: FontWeight.bold,
              ),
        ),
      ),
>>>>>>> ea02943d38476f71ad56e2a64f056ea298882690:lib/screens/ProfileSection/ProfilePage.dart.dart
    );
  }
}

class EducationDetailsButton extends StatelessWidget {
  final String profileDetails;

  const EducationDetailsButton({
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



