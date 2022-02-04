import 'package:flutter/material.dart';

import 'package:workify/utils/sizes.dart';
import 'package:workify/utils/constants.dart';
// import './modify_history_buttons.dart';

double screenWidth = 0, screenHeight = 0;
bool portrait = false;
bool fresher = false;

class WrapEmploymentDetails extends StatefulWidget {
  const WrapEmploymentDetails({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return WrapEmploymentDetailsState();
  }
}

class WrapEmploymentDetailsState extends State<WrapEmploymentDetails> {
  @override
  Widget build(BuildContext context) {
    return EmploymentDetails();
  }
}

class EmploymentDetails extends StatelessWidget {
  const EmploymentDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DeviceSize device = DeviceSize();
    device.size = MediaQuery.of(context).size;
    screenWidth = device.size.width;
    screenHeight = device.size.height;
    portrait = screenWidth < 1000;
    // print('\n\n\n' + portrait.toString() + '\n\n');
    // Condition to get Portrait or LandScape View
    return portrait == false
        ? Column(
            children: [
              Expanded(
                flex: 7,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // compName,EmpCode,Designation
                        CompanyName(),
                        EmployeeCode(),
                        Designation(),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // StartDate,EndDate,ProjectName

                        StartDate(),
                        EndDate(),
                        ProjectName(),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ,Role,WorkLoc,salary
                        Role(),
                        WorkLocation(),
                        EmploymentType(),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // EmpType,PfAcc,Exp
                        EmploymentType(),
                        PfAccount(),
                        Experience(),
                      ],
                    ),
                    // Column(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     SizedBox(
                    //       height: screenHeight * 0.16,
                    //     ),
                    //     HistoryButton(),
                    //   ],
                    // ),
                  ],
                ),
              ),
              // Landscape Footer
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Text(
                          'History',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: kSecondaryColor,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        EmploymentHistory(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        : EmploymentDetailsPortraitView();
  }
}

class EmploymentDetailsPortraitView extends StatelessWidget {
  const EmploymentDetailsPortraitView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth,
      height: screenHeight,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical:5,
        ),
        child: Column(
          children: [
            Expanded(
              flex: 6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CompanyName(),
                  EmployeeCode(),
                  Designation(),
                  StartDate(),
                  EndDate(),
                  ProjectName(),
                  Role(),
                  WorkLocation(),
                  EmploymentType(),
                  PfAccount(),
                  Row(
                    mainAxisAlignment:MainAxisAlignment.start,
                    children: [
                      Experience(),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        'History',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: kSecondaryColor,
                        ),
                      ),
                      SizedBox(
                              height: 10,
                      ),
                      EmploymentHistory(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CompanyName extends StatelessWidget {
  const CompanyName({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Company Name',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: kSecondaryColor,
          ),
        ),
        SizedBox(
          // color: Colors.red,
          width: screenHeight * 0.2,
          height: screenHeight * 0.025,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
                'Happy ForeverHappy ForeverHappy ForeverHappy ForeverHappy Forever',
                style: TextStyle(
                  color: kSecondaryColor,
                ),
            ),
          ),
        ),
      ],
    );
  }
}

class EmployeeCode extends StatelessWidget {
  const EmployeeCode({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Employee Code',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: kSecondaryColor,
          ),
        ),
        SizedBox(
          // color: Colors.red,
          width: screenHeight * 0.2,
          height: screenHeight * 0.025,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
                'Happy ForeverHappy ForeverHappy ForeverHappy ForeverHappy Forever',
                style: TextStyle(
                  color: kSecondaryColor,
                ),
            ),
          ),
        ),
      ],
    );
  }
}

class Designation extends StatelessWidget {
  const Designation({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Designation',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: kSecondaryColor,
          ),
        ),
        SizedBox(
          // color: Colors.red,
          width: screenHeight * 0.2,
          height: screenHeight * 0.025,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
                'Happy ForeverHappy ForeverHappy ForeverHappy ForeverHappy Forever',
                style: TextStyle(
                  color: kSecondaryColor,
                ),
            ),
          ),
        ),
      ],
    );
  }
}

class StartDate extends StatelessWidget {
  const StartDate({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Start Date',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: kSecondaryColor,
          ),
        ),
        SizedBox(
          // color: Colors.red,
          width: screenHeight * 0.2,
          height: screenHeight * 0.025,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
                'Happy ForeverHappy ForeverHappy ForeverHappy ForeverHappy Forever',
                style: TextStyle(
                  color: kSecondaryColor,
                ),
            ),
          ),
        ),
      ],
    );
  }
}

class EndDate extends StatelessWidget {
  const EndDate({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'End Date',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: kSecondaryColor,
          ),
        ),
        SizedBox(
          // color: Colors.red,
          width: screenHeight * 0.2,
          height: screenHeight * 0.025,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
                'Happy ForeverHappy ForeverHappy ForeverHappy ForeverHappy Forever',
                style: TextStyle(
                  color: kSecondaryColor,
                ),
            ),
          ),
        ),
      ],
    );
  }
}

class ProjectName extends StatelessWidget {
  const ProjectName({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Project Name',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: kSecondaryColor,
          ),
        ),
        SizedBox(
          // color: Colors.red,
          width: screenHeight * 0.2,
          height: screenHeight * 0.025,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
                'Happy ForeverHappy ForeverHappy ForeverHappy ForeverHappy Forever',
                style: TextStyle(
                  color: kSecondaryColor,
                ),
            ),
          ),
        ),
      ],
    );
  }
}

class Role extends StatelessWidget {
  const Role({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Role',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: kSecondaryColor,
          ),
        ),
        SizedBox(
          // color: Colors.red,
          width: screenHeight * 0.2,
          height: screenHeight * 0.025,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
                'Happy ForeverHappy ForeverHappy ForeverHappy ForeverHappy Forever',
                style: TextStyle(
                  color: kSecondaryColor,
                ),
            ),
          ),
        ),
      ],
    );
  }
}

class WorkLocation extends StatelessWidget {
  const WorkLocation({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Work Location',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: kSecondaryColor,
          ),
        ),
        SizedBox(
          // color: Colors.red,
          width: screenHeight * 0.2,
          height: screenHeight * 0.025,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
                'Happy ForeverHappy ForeverHappy ForeverHappy ForeverHappy Forever',
                style: TextStyle(
                  color: kSecondaryColor,
                ),
            ),
          ),
        ),
      ],
    );
  }
}



class EmploymentType extends StatelessWidget {
  const EmploymentType({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Employment Type',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: kSecondaryColor,
          ),
        ),
        SizedBox(
          // color: Colors.red,
          width: screenHeight * 0.2,
          height: screenHeight * 0.025,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
                'Happy ForeverHappy ForeverHappy ForeverHappy ForeverHappy Forever',
                style: TextStyle(
                  color: kSecondaryColor,
                ),
            ),
          ),
        ),
      ],
    );
  }
}

class PfAccount extends StatelessWidget {
  const PfAccount({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'PF Account',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: kSecondaryColor,
          ),
        ),
        SizedBox(
          // color: Colors.red,
          width: screenHeight * 0.2,
          height: screenHeight * 0.025,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
                'Happy ForeverHappy ForeverHappy ForeverHappy ForeverHappy Forever',
                style: TextStyle(
                  color: kSecondaryColor,
                ),
            ),
          ),
        ),
      ],
    );
  }
}

class Experience extends StatelessWidget {
  const Experience({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       Text(
          'Total Experience including current organization',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: kSecondaryColor,
          ),
        ),
        SizedBox(
          // color: Colors.red,
          width: screenHeight * 0.2,
          height: screenHeight * 0.025,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
                'Happy ForeverHappy ForeverHappy ForeverHappy ForeverHappy Forever',
                style: TextStyle(
                  color: kSecondaryColor,
                ),
            ),
          ),
        ),
      ],
    );
  }
}

class EmploymentHistory extends StatelessWidget {
  const EmploymentHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(
        color: kSecondaryColor,
      ),
      children: [
        TableRow(
          children: [
            Text(
              'Heading 1',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: kSecondaryColor,
              ),
            ),
            Text(
              'Heading 2',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: kSecondaryColor,
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            Text(
              'Cell 1',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
            Text(
              'Cell 2',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            Text(
              'Cell 1',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
            Text(
              'Cell 2',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
          ],
        ),TableRow(
          children: [
            Text(
              'Cell 1',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
            Text(
              'Cell 2',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
          ],
        ),TableRow(
          children: [
            Text(
              'Cell 1',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
            Text(
              'Cell 2',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
          ],
        ),TableRow(
          children: [
            Text(
              'Cell 1',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
            Text(
              'Cell 2',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
          ],
        ),TableRow(
          children: [
            Text(
              'Cell 1',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
            Text(
              'Cell 2',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
          ],
        ),TableRow(
          children: [
            Text(
              'Cell 1',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
            Text(
              'Cell 2',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
          ],
        ),TableRow(
          children: [
            Text(
              'Cell 1',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
            Text(
              'Cell 2',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
          ],
        ),TableRow(
          children: [
            Text(
              'Cell 1',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
            Text(
              'Cell 2',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

