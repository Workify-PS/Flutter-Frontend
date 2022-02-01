// import 'dart:math';

import 'package:flutter/material.dart';
// import 'package:workify/main.dart';
import 'package:workify/utils/sizes.dart';

double screenWidth = 0, screenHeight = 0;
bool portrait = false;

class WrapPositionDetails extends StatefulWidget {
  const WrapPositionDetails({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return WrapPositionDetailsState();
  }
}

class WrapPositionDetailsState extends State<WrapPositionDetails> {
  @override
  Widget build(BuildContext context) {
    return PositionDetails();
  }
}

class PositionDetails extends StatelessWidget {
  const PositionDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DeviceSize device = DeviceSize();
    device.size = MediaQuery.of(context).size;
    screenWidth = device.size.width;
    screenHeight = device.size.height;
    portrait = screenWidth < 1000;
    // print('\n\n\n' + portrait.toString() + '\n\n');

    return Container(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 8,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flex(
                    direction: portrait == true ? Axis.vertical : Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: DoJ(),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: EmployeeCode(),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: OfficialEmail(),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Grade(),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Designation(),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: SkipManager(),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: FunctionalManager(),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: L1Manager(),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: FunctionHead(),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Flex(
                    direction: portrait == true ? Axis.vertical : Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: HRManager(),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: PracticeHead(),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: EmploymentType(),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: EmploymentStatus(),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: NoticePeriod(),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: ConfirmationDueDate(),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: ConfirmationStatus(),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: WorkCenter(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Work Information',
                    style: TextStyle(
                      // fontSize: screenWidth * 0.02,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    'Org Unit',
                    style: TextStyle(
                      // fontSize: screenWidth * 0.02,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'PeopleStrong SaaS>PG1>Tech Dev>WFM>Development>WFM'
                  ),
                  Text(
                    'Worksite',
                    style: TextStyle(
                      // fontSize: screenWidth * 0.02,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'India>North Region>Haryana>Gurgaon>Gurgaon Infocity',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DoJ extends StatelessWidget {
  const DoJ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Date of Joining',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          'Happy Forever',
        ),
      ],
    );
  }
}

class EmployeeCode extends StatelessWidget {
  const EmployeeCode({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Employee Code',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          'Happy Forever',
        ),
      ],
    );
  }
}

class OfficialEmail extends StatelessWidget {
  const OfficialEmail({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Official Email',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          'Happy Forever',
        ),
      ],
    );
  }
}

class Grade extends StatelessWidget {
  const Grade({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Grade',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          'Happy Forever',
        ),
      ],
    );
  }
}

class Designation extends StatelessWidget {
  const Designation({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Designation',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          'Happy Forever',
        ),
      ],
    );
  }
}

class SkipManager extends StatelessWidget {
  const SkipManager({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Skip Manager',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          'Happy Forever',
        ),
      ],
    );
  }
}

class FunctionalManager extends StatelessWidget {
  const FunctionalManager({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Functional Manager',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          'Happy Forever',
        ),
      ],
    );
  }
}

class L1Manager extends StatelessWidget {
  const L1Manager({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'L1 Manager',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          'Happy Forever',
        ),
      ],
    );
  }
}

class FunctionHead extends StatelessWidget {
  const FunctionHead({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Function Head',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          'Happy Forever',
        ),
      ],
    );
  }
}

class HRManager extends StatelessWidget {
  const HRManager({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'HR Manager',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          'Happy Forever',
        ),
      ],
    );
  }
}

class PracticeHead extends StatelessWidget {
  const PracticeHead({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Practice Head',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          'Happy Forever',
        ),
      ],
    );
  }
}

class EmploymentType extends StatelessWidget {
  const EmploymentType({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Employment Type',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          'Happy Forever',
        ),
      ],
    );
  }
}

class EmploymentStatus extends StatelessWidget {
  const EmploymentStatus({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Employment Status',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          'Happy Forever',
        ),
      ],
    );
  }
}

class NoticePeriod extends StatelessWidget {
  const NoticePeriod({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Notice Period (Days)',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          'Happy Forever',
        ),
      ],
    );
  }
}

class ConfirmationDueDate extends StatelessWidget {
  const ConfirmationDueDate({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Confirmation Due Date',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          'Happy Forever',
        ),
      ],
    );
  }
}

class ConfirmationStatus extends StatelessWidget {
  const ConfirmationStatus({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Confirmation Status',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          'Happy Forever',
        ),
      ],
    );
  }
}

class WorkCenter extends StatelessWidget {
  const WorkCenter({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Work Center',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          'Happy Forever',
        ),
      ],
    );
  }
}

//Buttons

class ModifyButton extends StatelessWidget {
  const ModifyButton(
      {Key? key,
      required this.updateDetailsString,
      required this.updateWidgetHandler})
      : super(key: key);

  final String updateDetailsString;
  final void Function(String) updateWidgetHandler;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        updateWidgetHandler(updateDetailsString);
      },
      child: Center(
        child: Text(
          'Modify',
          style: TextStyle(
            fontSize: screenWidth * 0.01,
          ),
        ),
      ),
    );
  }
}

class HistoryButton extends StatelessWidget {
  const HistoryButton(
      {Key? key,
      required this.updateDetailsString,
      required this.updateWidgetHandler})
      : super(key: key);

  final String updateDetailsString;
  final void Function(String) updateWidgetHandler;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        updateWidgetHandler(updateDetailsString);
      },
      child: Center(
        child: Text(
          'History',
          style: TextStyle(
            fontSize: screenWidth * 0.01,
          ),
        ),
      ),
    );
  }
}
