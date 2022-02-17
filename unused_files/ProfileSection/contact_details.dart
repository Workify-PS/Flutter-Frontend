import 'package:flutter/material.dart';

import 'package:workify/utils/sizes.dart';
//import './modify_history_buttons.dart';

double screenWidth = 0, screenHeight = 0;
bool portrait = false;

class ContactDetails extends StatelessWidget {
  const ContactDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DeviceSize device = DeviceSize();
    device.size = MediaQuery.of(context).size;
    screenWidth = device.size.width;
    screenHeight = device.size.height;
    portrait = screenWidth < 1000;
    // print('\n\n\n' + portrait.toString() + '\n\n');
    return portrait == false
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Residence',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      // direction: portrait == true ? Axis.vertical : Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ResidenceAddress(),
                        ResidenceCity(),
                        ResidenceState(),
                        ResidencePhone(),
                      ],
                    ),
                    Text(
                      'Permanent',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      // direction: portrait == true ? Axis.vertical : Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PermanentAddress(),
                        PermanentCity(),
                        PermanentState(),
                        PermanentPhone(),
                      ],
                    ),
                    Text(
                      'Correspondence',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      // direction: portrait == true ? Axis.vertical : Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CorrespondenceAddress(),
                        CorrespondenceCity(),
                        CorrespondenceState(),
                        CorrespondencePhone(),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Emergency Contact',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      // direction: portrait == true ? Axis.vertical : Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        EmergencyContactName(),
                        EmergencyContactRelationship(),
                        EmergencyContactMobile(),
                        EmergencyContactPhone(),
                        EmergencyContactEmail(),
                        EmergencyContactAddress(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //ModifyHistoryButton(),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
        : ContactDetailsPortraitView();
  }
}

class ContactDetailsPortraitView extends StatelessWidget {
  const ContactDetailsPortraitView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Text(
              'Residence ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.01,
              // child: Container(
              //   color: Colors.red,
              // ),
            ),
            ResidenceAddress(),
            ResidenceCity(),
            ResidenceState(),
            ResidencePhone(),
          ],
        ),
        Column(
          children: [
            Text(
              'Permanent',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.01,
              // child: Container(
              //   color: Colors.red,
              // ),
            ),
            PermanentAddress(),
            PermanentCity(),
            PermanentState(),
            PermanentPhone(),
          ],
        ),
        Column(
          children: [
            Text(
              'Correspondence',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.01,
              // child: Container(
              //   color: Colors.red,
              // ),
            ),
            CorrespondenceAddress(),
            CorrespondenceCity(),
            CorrespondenceState(),
            CorrespondencePhone(),
          ],
        ),
        Column(
          children: [
            Text(
              'Emergency',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.01,
              // child: Container(
              //   color: Colors.red,
              // ),
            ),
            EmergencyContactName(),
            EmergencyContactRelationship(),
            EmergencyContactMobile(),
            EmergencyContactPhone(),
            EmergencyContactEmail(),
            EmergencyContactAddress(),
          ],
        ),
      ],
    );
  }
}

class ResidenceAddress extends StatelessWidget {
  const ResidenceAddress({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Address',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          // color: Colors.red,
          width: screenHeight * 0.2,
          height: screenHeight * 0.025,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text('Happy ForeverHappy ForeverHappy ForeverHappy ForeverHappy Forever'),
          ),
        ),
      ],
    );
  }
}

class ResidenceCity extends StatelessWidget {
  const ResidenceCity({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'City',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          // color: Colors.red,
          width: screenHeight * 0.2,
          height: screenHeight * 0.025,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text('Happy ForeverHappy ForeverHappy ForeverHappy ForeverHappy Forever'),
          ),
        ),
      ],
    );
  }
}

class ResidenceState extends StatelessWidget {
  const ResidenceState({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'State',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          // color: Colors.red,
          width: screenHeight * 0.2,
          height: screenHeight * 0.025,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text('Happy ForeverHappy ForeverHappy ForeverHappy ForeverHappy Forever'),
          ),
        ),
      ],
    );
  }
}

class ResidencePhone extends StatelessWidget {
  const ResidencePhone({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Phone',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          // color: Colors.red,
          width: screenHeight * 0.2,
          height: screenHeight * 0.025,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text('Happy ForeverHappy ForeverHappy ForeverHappy ForeverHappy Forever'),
          ),
        ),
      ],
    );
  }
}

class PermanentAddress extends StatelessWidget {
  const PermanentAddress({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Address',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          // color: Colors.red,
          width: screenHeight * 0.2,
          height: screenHeight * 0.025,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text('Happy ForeverHappy ForeverHappy ForeverHappy ForeverHappy Forever'),
          ),
        ),
      ],
    );
  }
}

class PermanentCity extends StatelessWidget {
  const PermanentCity({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'City',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          // color: Colors.red,
          width: screenHeight * 0.2,
          height: screenHeight * 0.025,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text('Happy ForeverHappy ForeverHappy ForeverHappy ForeverHappy Forever'),
          ),
        ),
      ],
    );
  }
}

class PermanentState extends StatelessWidget {
  const PermanentState({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'State',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          // color: Colors.red,
          width: screenHeight * 0.2,
          height: screenHeight * 0.025,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text('Happy ForeverHappy ForeverHappy ForeverHappy ForeverHappy Forever'),
          ),
        ),
      ],
    );
  }
}

class PermanentPhone extends StatelessWidget {
  const PermanentPhone({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Phone',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          // color: Colors.red,
          width: screenHeight * 0.2,
          height: screenHeight * 0.025,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text('Happy ForeverHappy ForeverHappy ForeverHappy ForeverHappy Forever'),
          ),
        ),
      ],
    );
  }
}

class CorrespondenceAddress extends StatelessWidget {
  const CorrespondenceAddress({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Address',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          // color: Colors.red,
          width: screenHeight * 0.2,
          height: screenHeight * 0.025,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text('Happy ForeverHappy ForeverHappy ForeverHappy ForeverHappy Forever'),
          ),
        ),
      ],
    );
  }
}

class CorrespondenceCity extends StatelessWidget {
  const CorrespondenceCity({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'City',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          // color: Colors.red,
          width: screenHeight * 0.2,
          height: screenHeight * 0.025,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text('Happy ForeverHappy ForeverHappy ForeverHappy ForeverHappy Forever'),
          ),
        ),
      ],
    );
  }
}

class CorrespondenceState extends StatelessWidget {
  const CorrespondenceState({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'State',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          // color: Colors.red,
          width: screenHeight * 0.2,
          height: screenHeight * 0.025,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text('Happy ForeverHappy ForeverHappy ForeverHappy ForeverHappy Forever'),
          ),
        ),
      ],
    );
  }
}

class CorrespondencePhone extends StatelessWidget {
  const CorrespondencePhone({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Phone',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          // color: Colors.red,
          width: screenHeight * 0.2,
          height: screenHeight * 0.025,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text('Happy ForeverHappy ForeverHappy ForeverHappy ForeverHappy Forever'),
          ),
        ),
      ],
    );
  }
}

class EmergencyContactName extends StatelessWidget {
  const EmergencyContactName({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Name',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          // color: Colors.red,
          width: screenHeight * 0.2,
          height: screenHeight * 0.025,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text('Happy ForeverHappy ForeverHappy ForeverHappy ForeverHappy Forever'),
          ),
        ),
      ],
    );
  }
}

class EmergencyContactRelationship extends StatelessWidget {
  const EmergencyContactRelationship({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Relationship',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          // color: Colors.red,
          width: screenHeight * 0.2,
          height: screenHeight * 0.025,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text('Happy ForeverHappy ForeverHappy ForeverHappy ForeverHappy Forever'),
          ),
        ),
      ],
    );
  }
}

class EmergencyContactMobile extends StatelessWidget {
  const EmergencyContactMobile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Mobile Number',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          // color: Colors.red,
          width: screenHeight * 0.2,
          height: screenHeight * 0.025,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text('Happy ForeverHappy ForeverHappy ForeverHappy ForeverHappy Forever'),
          ),
        ),
      ],
    );
  }
}

class EmergencyContactPhone extends StatelessWidget {
  const EmergencyContactPhone({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Home Number',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          // color: Colors.red,
          width: screenHeight * 0.2,
          height: screenHeight * 0.025,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text('Happy ForeverHappy ForeverHappy ForeverHappy ForeverHappy Forever'),
          ),
        ),
      ],
    );
  }
}

class EmergencyContactEmail extends StatelessWidget {
  const EmergencyContactEmail({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Email ID',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          // color: Colors.red,
          width: screenHeight * 0.2,
          height: screenHeight * 0.025,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text('Happy ForeverHappy ForeverHappy ForeverHappy ForeverHappy Forever'),
          ),
        ),
      ],
    );
  }
}

class EmergencyContactAddress extends StatelessWidget {
  const EmergencyContactAddress({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Address',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          // color: Colors.red,
          width: screenHeight * 0.2,
          height: screenHeight * 0.025,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text('Happy ForeverHappy ForeverHappy ForeverHappy ForeverHappy Forever'),
          ),
        ),
      ],
    );
  }
}
