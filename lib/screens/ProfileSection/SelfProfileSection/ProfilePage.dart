// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workify/components/tab_button.dart';

import 'package:workify/controllers/profile_widgets_controller.dart';
import 'package:workify/screens/ProfileSection/SelfProfileSection/basic_details.dart';
import 'package:workify/screens/ProfileSection/SelfProfileSection/employment_details.dart';
import 'package:workify/screens/ProfileSection/SelfProfileSection/modify_basic_details.dart';
import 'package:workify/screens/ProfileSection/SelfProfileSection/position_details.dart';
import 'package:workify/utils/constants.dart';
import 'package:workify/utils/extensions.dart';
import 'package:workify/utils/generators.dart';
import 'package:workify/utils/responsive.dart';
import 'package:workify/utils/sizes.dart';

class ProfileBar extends StatelessWidget {
  const ProfileBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
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
          child:
              ModifyBasicDetailsButton(profileDetails: 'Modify Basic Details'),
        ),
      ],
    );
  }
}

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

  @override
  Widget build(BuildContext context) {
    final profileWidgetsController = Get.find<ProfileWidgetsController>();
    DeviceSize device = DeviceSize();
    device.size = MediaQuery.of(context).size;
    screenWidth = device.size.width;
    screenHeight = device.size.height;

    return Scaffold(
      appBar: generateTopBar(title: "My Profile", extendedWidget: ProfileBar()),
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
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: ProfileBar(),
              // ),
              Expanded(
                //flex: 10,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 32.0, horizontal: 4.0),
                  child: Material(
                    elevation: 40,
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: SizedBox(
                      width: screenWidth,
                      // decoration: BoxDecoration(
                      //   borderRadius: BorderRadius.circular(20),
                      // ),
                      // Rendering All widgets here
                      child: Obx(() => Responsivescreen(
                          mobile: profileWidgets[profileWidgetsController
                              .widgetString.value
                              .toString()]!,
                          child: profileWidgets[profileWidgetsController
                              .widgetString.value
                              .toString()]!)),
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

class BasicDetailsButton extends StatelessWidget {
  final String profileDetails;

  const BasicDetailsButton({
    Key? key,
    required this.profileDetails,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TabButton(
      profileDetails: profileDetails,
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
    return TabButton(
      profileDetails: profileDetails,
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
    return TabButton(
      profileDetails: profileDetails,
    );
  }
}

class ModifyBasicDetailsButton extends StatelessWidget {
  final String profileDetails;

  const ModifyBasicDetailsButton({
    Key? key,
    required this.profileDetails,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TabButton(
      profileDetails: profileDetails,
    );
  }
}
