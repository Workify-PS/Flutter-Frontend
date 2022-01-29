import 'package:flutter/material.dart';
import 'package:workify/screens/profilesection/BasicDetails.dart';
import 'package:workify/utils/sizes.dart';

import './Person.dart';
import './BasicDetails.dart';
import './PositionDetails.dart';
import './ContactDetails.dart';
import './DependentDetails.dart';
import './EducationDetails.dart';
import './EmploymentDetails.dart';
import './IdDetails.dart';
import './BankDetails.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ProfilePageState();
  }
}

var screenWidth, screenHeight;

class _ProfilePageState extends State<ProfilePage> {
  Widget build(BuildContext context) {
   
    DeviceSize device = DeviceSize();
    device.size = MediaQuery.of(context).size;
    screenWidth = device.size.width;
    screenHeight = device.size.height;
    bool portrait = screenWidth < 1000;

    Map<String, Widget> profileWidgets = {
      'Person': Person(),
      'BasicDetails': BasicDetails(),
      // 'BankDetails': BankDetails(),
      // 'ContactDetails': ContactDetails(),
      // 'DependentDetails': DependentDetails(),
      // 'EducationDetails': EducationDetails(),
      // 'EmploymentDetails': EmploymentDetails(),
      // 'IdDetails': IdDetails(),
      // 'PositionDetails': PositionDetails(),
    };
    List<String> names = ['a', 'b', 'c'];
    int idx = 0;

    String profileWidgetString = 'BasicDetails';

    void setProfileWidget() {
      // print("\n\n\nBasic Details clicked \n\n\n\n");
      setState(() {
        // profileWidgetString = 'Person';
        idx+=1;
      });
      // print(profileWidgetString);
      print(idx.toString()+ ' ' + names[idx]);
    }

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
                        child: BasicDetailsButton(setProfileWidget),
                      ),
                      Expanded(
                        flex: 1,
                        child: PositionDetailsButton(),
                      ),
                      Expanded(
                        flex: 1,
                        child: ContactDetailsButton(),
                      ),
                      Expanded(
                        flex: 1,
                        child: DependentDetailsButton(),
                      ),
                      Expanded(
                        flex: 1,
                        child: EmploymentDetailsButton(),
                      ),
                      Expanded(
                        flex: 1,
                        child: EducationDetailsButton(),
                      ),
                      Expanded(
                        flex: 1,
                        child: BankDetailsButton(),
                      ),
                      Expanded(
                        flex: 1,
                        child: IdDetailsButton(),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 9,
                // child: profileWidgets[profileWidgetString]!,
                child: Text(names[idx]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BasicDetailsButton extends StatelessWidget {
  final VoidCallback ProfileWidgetHandler;

  BasicDetailsButton(this.ProfileWidgetHandler);

  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ProfileWidgetHandler,
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
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
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
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
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
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
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
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
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
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
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
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
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
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
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
