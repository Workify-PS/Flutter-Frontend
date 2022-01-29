
import 'package:flutter/material.dart';
import 'package:workify/utils/sizes.dart';

import 'employee_details.dart';
import 'basic_details.dart';
import 'position_details.dart';
import 'contact_details.dart';
import 'dependent_details.dart';
import 'education_details.dart';
import 'employment_details.dart';
import 'id_details.dart';
import 'bank_details.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ProfilePageState();
  }
}

var screenWidth, screenHeight;

class ProfilePageState extends State<ProfilePage> {
  Map<String, Widget> profileWidgets = {
    'Person': Person(),
    'Basic_Details': BasicDetails(),
    'Bank_Details': BankDetails(),
    'Contact_Details': ContactDetails(),
    'Dependent_Details': DependentDetails(),
    'Education_Details': EducationDetails(),
    'Employment_Details': EmploymentDetails(),
    'Id_Details': IdDetails(),
    'Position_Details': PositionDetails(),
  };

  String profileWidgetString = 'Person';

  void setProfileWidget(String profileDetails) {
    setState(() {
      profileWidgetString = profileDetails;
    });
  }

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
              colors: [Colors.indigo, Colors.teal],
            ),
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: device.size.width / 1.1,
          height: device.size.height / 1.1,
          color: Colors.teal,
          child: Flex(
            direction: portrait == true ? Axis.horizontal : Axis.vertical,
            children: [
              Expanded(
                flex: portrait == true ? 2 : 1,
                child: Container(
                  child: Flex(
                    direction:
                        portrait == true ? Axis.vertical : Axis.horizontal,
                    children: [
                      Expanded(
                        flex: 1,
                        child: BasicDetailsButton(
                          profileDetails: "Basic_Details",
                          ProfileWidgetHandler: setProfileWidget,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: PositionDetailsButton(
                          profileDetails: "Position_Details",
                          ProfileWidgetHandler: setProfileWidget,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        // child: ContactDetailsButton(),
                        child: ContactDetailsButton(
                          profileDetails: "Contact_Details",
                          ProfileWidgetHandler: setProfileWidget,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        // child: DependentDetailsButton(),
                        child: DependentDetailsButton(
                          profileDetails: "Dependent_Details",
                          ProfileWidgetHandler: setProfileWidget,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        // child: EmploymentDetailsButton(),
                        child: EmploymentDetailsButton(
                          profileDetails: "Employment_Details",
                          ProfileWidgetHandler: setProfileWidget,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        // child: EducationDetailsButton(),
                        child: EducationDetailsButton(
                          profileDetails: "Education_Details",
                          ProfileWidgetHandler: setProfileWidget,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: BankDetailsButton(
                          profileDetails: "Bank_Details",
                          ProfileWidgetHandler: setProfileWidget,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        // child: IdDetailsButton(),
                        child: IdDetailsButton(
                          profileDetails: "Id_Details",
                          ProfileWidgetHandler: setProfileWidget,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 9,
                child: profileWidgets[profileWidgetString]!,
                // child: Text("testing"),
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
  final void Function(String) ProfileWidgetHandler;

  const BasicDetailsButton(
      {Key? key,
      required this.profileDetails,
      required this.ProfileWidgetHandler})
      : super(key: key);

  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
                ProfileWidgetHandler(profileDetails);
        },
      child: Center(
        child: Text(
          'Basic Details',
          style: TextStyle(
            fontSize: screenWidth * 0.015,
          ),
        ),
      ),
    );
  }
}

class PositionDetailsButton extends StatelessWidget {
  final String profileDetails;
  final void Function(String) ProfileWidgetHandler;

  const PositionDetailsButton(
      {Key? key,
      required this.profileDetails,
      required this.ProfileWidgetHandler})
      : super(key: key);

  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
                ProfileWidgetHandler(profileDetails);
        },
      child: Center(
        child: Text(
          'Position Details',
          style: TextStyle(
            fontSize: screenWidth * 0.015,
          ),
        ),
      ),
    );
  }
}



class ContactDetailsButton extends StatelessWidget {
  final String profileDetails;
  final void Function(String) ProfileWidgetHandler;

  const ContactDetailsButton(
      {Key? key,
      required this.profileDetails,
      required this.ProfileWidgetHandler})
      : super(key: key);

  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
                ProfileWidgetHandler(profileDetails);
        },
      child: Center(
        child: Text(
          'Contact Details',
          style: TextStyle(
            fontSize: screenWidth * 0.015,
          ),
        ),
      ),
    );
  }
}



class DependentDetailsButton extends StatelessWidget {
  final String profileDetails;
  final void Function(String) ProfileWidgetHandler;

  const DependentDetailsButton(
      {Key? key,
      required this.profileDetails,
      required this.ProfileWidgetHandler})
      : super(key: key);

  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
                ProfileWidgetHandler(profileDetails);
        },
      child: Center(
        child: Text(
          'Dependent Details',
          style: TextStyle(
            fontSize: screenWidth * 0.015,
          ),
        ),
      ),
    );
  }
}


class EmploymentDetailsButton extends StatelessWidget {
  final String profileDetails;
  final void Function(String) ProfileWidgetHandler;

  const EmploymentDetailsButton(
      {Key? key,
      required this.profileDetails,
      required this.ProfileWidgetHandler})
      : super(key: key);

  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
                ProfileWidgetHandler(profileDetails);
        },
      child: Center(
        child: Text(
          'Employment Details',
          style: TextStyle(
            fontSize: screenWidth * 0.015,
          ),
        ),
      ),
    );
  }
}


class EducationDetailsButton extends StatelessWidget {
  final String profileDetails;
  final void Function(String) ProfileWidgetHandler;

  const EducationDetailsButton(
      {Key? key,
      required this.profileDetails,
      required this.ProfileWidgetHandler})
      : super(key: key);

  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
                ProfileWidgetHandler(profileDetails);
        },
      child: Center(
        child: Text(
          'Education Details',
          style: TextStyle(
            fontSize: screenWidth * 0.015,
          ),
        ),
      ),
    );
  }
}



class BankDetailsButton  extends StatelessWidget {
  final String profileDetails;
  final void Function(String) ProfileWidgetHandler;

  const BankDetailsButton (
      {Key? key,
      required this.profileDetails,
      required this.ProfileWidgetHandler})
      : super(key: key);

  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
                ProfileWidgetHandler(profileDetails);
        },
      child: Center(
        child: Text(
          'Bank Details',
          style: TextStyle(
            fontSize: screenWidth * 0.015,
          ),
        ),
      ),
    );
  }
}


class IdDetailsButton  extends StatelessWidget {
  final String profileDetails;
  final void Function(String) ProfileWidgetHandler;

  const IdDetailsButton (
      {Key? key,
      required this.profileDetails,
      required this.ProfileWidgetHandler})
      : super(key: key);

  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
                ProfileWidgetHandler(profileDetails);
        },
      child: Center(
        child: Text(
          'ID Details',
          style: TextStyle(
            fontSize: screenWidth * 0.015,
          ),
        ),
      ),
    );
  }
}

