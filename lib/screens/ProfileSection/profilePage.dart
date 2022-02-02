import 'package:flutter/material.dart';
import 'package:workify/utils/sizes.dart';

import 'basic_details.dart';
import 'position_details.dart';
import 'contact_details.dart';
import 'dependent_details.dart';
import 'education_details.dart';
import 'employment_details.dart';
import 'id_details.dart';
import 'bank_details.dart';

  bool basicButtonPressed = true;
  bool bankButtonPressed = false;
  bool contactButtonPressed = false;
  bool dependentButtonPressed = false;
  bool educationButtonPressed = false;
  bool employmentButtonPressed = false;
  bool idButtonPressed = false;
  bool positionButtonPressed = false;
  
  double screenWidth = 0, screenHeight = 0;

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ProfilePageState();
  }
}

class ProfilePageState extends State<ProfilePage> {
  Map<String, Widget> profileWidgets = {
    'Basic_Details': BasicDetails(),
    'Bank_Details': BankDetails(),
    'Contact_Details': ContactDetails(),
    'Dependent_Details': DependentDetails(),
    'Education_Details': EducationDetails(),
    'Employment_Details': EmploymentDetails(),
    'Id_Details': IdDetails(),
    'Position_Details': PositionDetails(),
  };

  String profileWidgetString = 'Basic_Details';

  void setProfileWidget(String profileDetails) {
    setState(() {
      profileWidgetString = profileDetails;
    });
  }

  @override
  Widget build(BuildContext context) {
    DeviceSize device = DeviceSize();
    device.size = MediaQuery.of(context).size;
    screenWidth = device.size.width;
    screenHeight = device.size.height;
    bool portrait = screenWidth < 1000;

    return Scaffold(
      appBar: AppBar(
        title: Text('ProfilePage'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.teal, Colors.grey],
            ),
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: device.size.width / 1.1,
          height: device.size.height / 1.1,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.transparent, Colors.teal],
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Flex(
            //Outer shell design
            direction: portrait == true ? Axis.horizontal : Axis.vertical,
            children: [
              Expanded(
                flex: portrait == true ? 2 : 1,
                child: Flex(
                  // details buttons design
                  direction: portrait == true ? Axis.vertical : Axis.horizontal,
                  children: [
                    Expanded(
                      flex: portrait == true ? 1 : 2,
                      child: BasicDetailsButton(
                        profileDetails: "Basic_Details",
                        profileWidgetHandler: setProfileWidget,
                      ),
                    ),
                    Expanded(
                      flex: portrait == true ? 1 : 2,
                      child: PositionDetailsButton(
                        profileDetails: "Position_Details",
                        profileWidgetHandler: setProfileWidget,
                      ),
                    ),
                    Expanded(
                      flex: portrait == true ? 1 : 2,
                      // child: ContactDetailsButton(),
                      child: ContactDetailsButton(
                        profileDetails: "Contact_Details",
                        profileWidgetHandler: setProfileWidget,
                      ),
                    ),
                    Expanded(
                      flex: portrait == true ? 1 : 2,
                      // child: DependentDetailsButton(),
                      child: DependentDetailsButton(
                        profileDetails: "Dependent_Details",
                        profileWidgetHandler: setProfileWidget,
                      ),
                    ),
                    Expanded(
                      flex: portrait == true ? 1 : 2,
                      // child: EmploymentDetailsButton(),
                      child: EmploymentDetailsButton(
                        profileDetails: "Employment_Details",
                        profileWidgetHandler: setProfileWidget,
                      ),
                    ),
                    Expanded(
                      flex: portrait == true ? 1 : 2,
                      // child: EducationDetailsButton(),
                      child: EducationDetailsButton(
                        profileDetails: "Education_Details",
                        profileWidgetHandler: setProfileWidget,
                      ),
                    ),
                    Expanded(
                      flex: portrait == true ? 1 : 2,
                      child: BankDetailsButton(
                        profileDetails: "Bank_Details",
                        profileWidgetHandler: setProfileWidget,
                      ),
                    ),
                    Expanded(
                      flex: portrait == true ? 1 : 2,
                      // child: IdDetailsButton(),
                      child: IdDetailsButton(
                        profileDetails: "Id_Details",
                        profileWidgetHandler: setProfileWidget,
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
                      gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [Colors.transparent, Colors.teal],
                      ),
                    ),
                    child: profileWidgets[profileWidgetString]!,
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

// class ProfilePageLandScapeView

class BasicDetailsButton extends StatelessWidget {
  final String profileDetails;
  final void Function(String) profileWidgetHandler;

  const BasicDetailsButton({
    Key? key,
    required this.profileDetails,
    required this.profileWidgetHandler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        profileWidgetHandler(profileDetails);

        bankButtonPressed = false;
        contactButtonPressed = false;
        dependentButtonPressed = false;
        educationButtonPressed = false;
        employmentButtonPressed = false;
        idButtonPressed = false;
        positionButtonPressed = false;

        basicButtonPressed = true;
      },
      style: ElevatedButton.styleFrom(
        primary:
            basicButtonPressed == true ? Colors.indigo : Colors.teal,
      ),
      child: Center(
        child: Text(
          'Basic Details',
          style: TextStyle(
            fontSize: screenWidth * 0.015,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class PositionDetailsButton extends StatelessWidget {
  final String profileDetails;
  final void Function(String) profileWidgetHandler;

  const PositionDetailsButton({
    Key? key,
    required this.profileDetails,
    required this.profileWidgetHandler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        profileWidgetHandler(profileDetails);

        bankButtonPressed = false;
        contactButtonPressed = false;
        dependentButtonPressed = false;
        educationButtonPressed = false;
        employmentButtonPressed = false;
        idButtonPressed = false;
        basicButtonPressed = false;

        positionButtonPressed = true;
      },
      style: ElevatedButton.styleFrom(
        primary: positionButtonPressed == true
            ? Colors.indigo 
            : Colors.teal,
      ),
      child: Center(
        child: Text(
          'Position Details',
          style: TextStyle(
            fontSize: screenWidth * 0.015,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class ContactDetailsButton extends StatelessWidget {
  final String profileDetails;
  final void Function(String) profileWidgetHandler;

  const ContactDetailsButton({
    Key? key,
    required this.profileDetails,
    required this.profileWidgetHandler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        profileWidgetHandler(profileDetails);

        bankButtonPressed = false;
        dependentButtonPressed = false;
        educationButtonPressed = false;
        employmentButtonPressed = false;
        idButtonPressed = false;
        basicButtonPressed = false;
        positionButtonPressed = false;

        contactButtonPressed = true;
      },
      style: ElevatedButton.styleFrom(
        primary: contactButtonPressed == true
            ? Colors.indigo 
            : Colors.teal,
      ),
      child: Center(
        child: Text(
          'Contact Details',
          style: TextStyle(
            fontSize: screenWidth * 0.015,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class DependentDetailsButton extends StatelessWidget {
  final String profileDetails;
  final void Function(String) profileWidgetHandler;

  const DependentDetailsButton(
      {Key? key,
      required this.profileDetails,
      required this.profileWidgetHandler})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        profileWidgetHandler(profileDetails);

        bankButtonPressed = false;
        contactButtonPressed = false;
        educationButtonPressed = false;
        employmentButtonPressed = false;
        idButtonPressed = false;
        basicButtonPressed = false;
        positionButtonPressed = false;

        dependentButtonPressed = true;
      },
      style: ElevatedButton.styleFrom(
        primary: dependentButtonPressed == true
            ? Colors.indigo 
            : Colors.teal,
      ),
      child: Center(
        child: Text(
          'Dependent Details',
          style: TextStyle(
            fontSize: screenWidth * 0.015,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class EmploymentDetailsButton extends StatelessWidget {
  final String profileDetails;
  final void Function(String) profileWidgetHandler;

  const EmploymentDetailsButton(
      {Key? key,
      required this.profileDetails,
      required this.profileWidgetHandler})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        profileWidgetHandler(profileDetails);

        bankButtonPressed = false;
        contactButtonPressed = false;
        dependentButtonPressed = false;
        educationButtonPressed = false;
        idButtonPressed = false;
        basicButtonPressed = false;
        positionButtonPressed = false;

        employmentButtonPressed = true;
      },
      style: ElevatedButton.styleFrom(
        primary: employmentButtonPressed == true
            ? Colors.indigo 
            : Colors.teal,
      ),
      child: Center(
        child: Text(
          'Employment Details',
          style: TextStyle(
            fontSize: screenWidth * 0.015,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class EducationDetailsButton extends StatelessWidget {
  final String profileDetails;
  final void Function(String) profileWidgetHandler;

  const EducationDetailsButton(
      {Key? key,
      required this.profileDetails,
      required this.profileWidgetHandler})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        profileWidgetHandler(profileDetails);

        bankButtonPressed = false;
        contactButtonPressed = false;
        dependentButtonPressed = false;
        idButtonPressed = false;
        basicButtonPressed = false;
        positionButtonPressed = false;
        employmentButtonPressed = false;

        educationButtonPressed = true;
      },
      style: ElevatedButton.styleFrom(
        primary: educationButtonPressed == true
            ? Colors.indigo 
            : Colors.teal,
      ),
      child: Center(
        child: Text(
          'Education Details',
          style: TextStyle(
            fontSize: screenWidth * 0.015,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class BankDetailsButton extends StatelessWidget {
  final String profileDetails;
  final void Function(String) profileWidgetHandler;

  const BankDetailsButton(
      {Key? key,
      required this.profileDetails,
      required this.profileWidgetHandler})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        profileWidgetHandler(profileDetails);

        contactButtonPressed = false;
        dependentButtonPressed = false;
        idButtonPressed = false;
        basicButtonPressed = false;
        positionButtonPressed = false;
        employmentButtonPressed = false;
        educationButtonPressed = false;
        
        bankButtonPressed = true;
      },
      style: ElevatedButton.styleFrom(
        primary:
          bankButtonPressed == true 
          ? Colors.indigo  
          : Colors.teal,
      ),
      child: Center(
        child: Text(
          'Bank Details',
          style: TextStyle(
            fontSize: screenWidth * 0.015,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class IdDetailsButton extends StatelessWidget {
  final String profileDetails;
  final void Function(String) profileWidgetHandler;

  const IdDetailsButton(
      {Key? key,
      required this.profileDetails,
      required this.profileWidgetHandler})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        profileWidgetHandler(profileDetails);

        contactButtonPressed = false;
        dependentButtonPressed = false;
        basicButtonPressed = false;
        positionButtonPressed = false;
        employmentButtonPressed = false;
        educationButtonPressed = false;
        bankButtonPressed = false;

        idButtonPressed = true;
      },
      style: ElevatedButton.styleFrom(
        primary:
            idButtonPressed == true 
            ? Colors.indigo 
            : Colors.teal,
      ),
      child: Center(
        child: Text(
          'ID Details',
          style: TextStyle(
            fontSize: screenWidth * 0.015,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
