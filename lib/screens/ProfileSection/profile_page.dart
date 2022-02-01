import 'package:flutter/material.dart';
import 'package:workify/utils/sizes.dart';

// import 'self_details.dart';
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

double screenWidth = 0, screenHeight = 0;

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
    // 'Self_Details': Person(),
  };

  String profileWidgetString = 'Position_Details';
  // String updateString = 'View';

  void setProfileWidget(String profileDetails) {
    setState(() {
      profileWidgetString = profileDetails;
    });
  }

  // void updateProfileWidget(String updateString) {
  //   setState(() {
  //     updateString = updateString;
  //   });
  //   // print('\n\n\n' + updateString + '\n\n\n');
  // }

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
          child: Flex( //Outer shell design
            direction: portrait == true ? Axis.horizontal : Axis.vertical,
            children: [
              Expanded(
                flex: portrait == true ? 2 : 1,
                child: Flex(  // details buttons design
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
              // Expanded(
              //   flex: 1,
              //   child: Flex(
              //     direction: portrait == true ? Axis.vertical : Axis.horizontal,
              //     children: [
              //       Expanded(
              //         flex: 5,
              //         child: ModifyButton(
              //           updateDetailsString: 'Modify',
              //           updateWidgetHandler: updateProfileWidget,
              //         ),
              //       ),
              //       Expanded(
              //         flex: 5,
              //         child: HistoryButton(
              //           updateDetailsString: 'History',
              //           updateWidgetHandler: updateProfileWidget,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              Expanded(
                flex: 10,
                child :  Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: Container(
                            width: screenWidth,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                colors: [Colors.transparent,Colors.teal],
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

// class MeButton extends StatelessWidget {
//   final String profileDetails;
//   final void Function(String) profileWidgetHandler;

//   const MeButton(
//       {Key? key,
//       required this.profileDetails,
//       required this.profileWidgetHandler})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () {
//         profileWidgetHandler(profileDetails);
//       },
//       child: Center(
//         child: Text(
//           'Me',
//           style: TextStyle(
//             fontSize: screenWidth * 0.015,
//           ),
//         ),
//       ),
//     );
//   }
// }

class BasicDetailsButton extends StatelessWidget {
  final String profileDetails;
  final void Function(String) profileWidgetHandler;

  const BasicDetailsButton(
      {Key? key,
      required this.profileDetails,
      required this.profileWidgetHandler})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        profileWidgetHandler(profileDetails);
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
  final void Function(String) profileWidgetHandler;

  const PositionDetailsButton(
      {Key? key,
      required this.profileDetails,
      required this.profileWidgetHandler})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        profileWidgetHandler(profileDetails);
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
  final void Function(String) profileWidgetHandler;

  const ContactDetailsButton(
      {Key? key,
      required this.profileDetails,
      required this.profileWidgetHandler})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        profileWidgetHandler(profileDetails);
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
