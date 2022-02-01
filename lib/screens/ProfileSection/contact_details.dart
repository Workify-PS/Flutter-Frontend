import 'package:flutter/material.dart';
import 'package:workify/utils/sizes.dart';

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
    return Column(
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
              Flex(
                direction: portrait == true ? Axis.vertical : Axis.horizontal,
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
              Flex(
                direction: portrait == true ? Axis.vertical : Axis.horizontal,
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
              Flex(
                direction: portrait == true ? Axis.vertical : Axis.horizontal,
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
              Flex(
                direction: portrait == true ? Axis.vertical : Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  EmergencyContactName(),
                  EmergencyContactRelationship(),
                  EmergencyContactMobile(),
                  EmergencyContactPhone(),
                  EmergencyContactEmail(),
                  EmergencyContactAddress(),
                ],
              ),
            ],
          ),
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
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Address',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Happy Forever !'
        )
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
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'City',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Happy Forever !',
        )
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
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'State',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Happy Forever !'
        )
      ],
    );
  }
}

class ResidencePhone extends StatelessWidget {
  const ResidencePhone ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Phone',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Happy Forever !'
        )
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
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Address',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Happy Forever !'
        )
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
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'City',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Happy Forever !'
        )
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
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'State',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Happy Forever !'
        )
      ],
    );
  }
}

class PermanentPhone extends StatelessWidget {
  const PermanentPhone ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Phone',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Happy Forever !'
        )
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
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Address',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Happy Forever !'
        )
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
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'City',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Happy Forever !'
        )
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
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'State',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Happy Forever !'
        )
      ],
    );
  }
}

class CorrespondencePhone extends StatelessWidget {
  const CorrespondencePhone ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Phone',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Happy Forever !'
        )
      ],
    );
  }
}


class EmergencyContactName extends StatelessWidget {
  const EmergencyContactName  ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Name',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Happy Forever !'
        )
      ],
    );
  }
}

class EmergencyContactRelationship extends StatelessWidget {
  const EmergencyContactRelationship ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Relationship',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Happy Forever !'
        )
      ],
    );
  }
}


class EmergencyContactMobile extends StatelessWidget {
  const EmergencyContactMobile ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Mobile Number',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Happy Forever !'
        )
      ],
    );
  }
}


class EmergencyContactPhone extends StatelessWidget {
  const EmergencyContactPhone ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Home Number',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Happy Forever !'
        )
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
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Email ID',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Happy Forever !'
        )
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
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Address',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Happy Forever !'
        )
      ],
    );
  }
}


