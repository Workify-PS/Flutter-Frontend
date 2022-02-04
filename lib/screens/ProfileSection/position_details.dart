// import 'dart:math';

import 'package:flutter/material.dart';
import 'package:workify/utils/sizes.dart';
import './modify_history_buttons.dart';

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
                        // Employeecode,poscode,designation,grade,
                        EmployeeCode(),
                        PositionCode(),
                        Designation(),
                        Grade(),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // empCate,empstat,emptyp,dept
                        EmploymentCategory(),
                        EmploymentStatus(),
                        EmploymentType(),
                        Department(),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // workLoc,l1,l2,hr
                        WorkLocation(),
                        L1ManagerId(),
                        L2ManagerId(),
                        HRManagerId(),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // orgId,isAct,ofmail,doj,
                        OrgId(),
                        IsActive(),
                        OfficialEmail(),
                        DoJ(),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        JobRole(),
                        SizedBox(
                          height: screenHeight * 0.16,
                        ),
                        ModifyButton(),
                      ],
                    ),
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
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        PositionHistory(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        : PositionDetailsPortraitView();
  }
}

class PositionDetailsPortraitView extends StatelessWidget {
  const PositionDetailsPortraitView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              EmployeeCode(),
              PositionCode(),
              Designation(),
              Grade(),
              EmploymentCategory(),
              EmploymentStatus(),
              EmploymentType(),
              Department(),
              WorkLocation(),
              L1ManagerId(),
              L2ManagerId(),
              HRManagerId(),
              OrgId(),
              IsActive(),
              OfficialEmail(),
              DoJ(),
              JobRole(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ModifyButton(),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
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
                    ),
                  ),
                  SizedBox(
                          height: 10,
                  ),
                  PositionHistory(),
                ],
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
          style: TextStyle(fontWeight: FontWeight.bold),
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

class PositionCode extends StatelessWidget {
  const PositionCode({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Position Code',
          style: TextStyle(fontWeight: FontWeight.bold),
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
          style: TextStyle(fontWeight: FontWeight.bold),
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

class Grade extends StatelessWidget {
  const Grade({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Grade',
          style: TextStyle(fontWeight: FontWeight.bold),
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

class EmploymentCategory extends StatelessWidget {
  const EmploymentCategory({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Employment Category',
          style: TextStyle(fontWeight: FontWeight.bold),
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

class EmploymentStatus extends StatelessWidget {
  const EmploymentStatus({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Employment Status',
          style: TextStyle(fontWeight: FontWeight.bold),
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
          style: TextStyle(fontWeight: FontWeight.bold),
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

class Department extends StatelessWidget {
  const Department({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Department',
          style: TextStyle(fontWeight: FontWeight.bold),
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
          style: TextStyle(fontWeight: FontWeight.bold),
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

class L1ManagerId extends StatelessWidget {
  const L1ManagerId({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'L1Manager ID',
          style: TextStyle(fontWeight: FontWeight.bold),
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

class L2ManagerId extends StatelessWidget {
  const L2ManagerId({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'L2Manager ID',
          style: TextStyle(fontWeight: FontWeight.bold),
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

class HRManagerId extends StatelessWidget {
  const HRManagerId({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'HRManager ID',
          style: TextStyle(fontWeight: FontWeight.bold),
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

class OrgId extends StatelessWidget {
  const OrgId({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Organization ID',
          style: TextStyle(fontWeight: FontWeight.bold),
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

class IsActive extends StatelessWidget {
  const IsActive({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Is Active',
          style: TextStyle(fontWeight: FontWeight.bold),
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

class OfficialEmail extends StatelessWidget {
  const OfficialEmail({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Official Email',
          style: TextStyle(fontWeight: FontWeight.bold),
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

class DoJ extends StatelessWidget {
  const DoJ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Date of Joining',
          style: TextStyle(fontWeight: FontWeight.bold),
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

class JobRole extends StatelessWidget {
  const JobRole({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Job Role',
          style: TextStyle(fontWeight: FontWeight.bold),
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


class PositionHistory extends StatelessWidget {
  const PositionHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      children: [
        TableRow(
          children: [
            Text(
              'Heading 1',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Heading 2',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            Text('Cell 1'),
            Text('Cell 2'),
          ],
        ),
        TableRow(
          children: [
            Text('Cell 1'),
            Text('Cell 2'),
          ],
        ),
        TableRow(
          children: [
            Text('Cell 1'),
            Text('Cell 2'),
          ],
        ),
        TableRow(
          children: [
            Text('Cell 1'),
            Text('Cell 2'),
          ],
        ),
        TableRow(
          children: [
            Text('Cell 1'),
            Text('Cell 2'),
          ],
        ),
        TableRow(
          children: [
            Text('Cell 1'),
            Text('Cell 2'),
          ],
        ),
        TableRow(
          children: [
            Text('Cell 1'),
            Text('Cell 2'),
          ],
        ),
        TableRow(
          children: [
            Text('Cell 1'),
            Text('Cell 2'),
          ],
        ),
        TableRow(
          children: [
            Text('Cell 1'),
            Text('Cell 2'),
          ],
        ),
        TableRow(
          children: [
            Text('Cell 1'),
            Text('Cell 2'),
          ],
        ),
        TableRow(
          children: [
            Text('Cell 1'),
            Text('Cell 2'),
          ],
        ),
        TableRow(
          children: [
            Text('Cell 1'),
            Text('Cell 2'),
          ],
        ),
        TableRow(
          children: [
            Text('Cell 1'),
            Text('Cell 2'),
          ],
        ),
        TableRow(
          children: [
            Text('Cell 1'),
            Text('Cell 2'),
          ],
        ),
        TableRow(
          children: [
            Text('Cell 1'),
            Text('Cell 2'),
          ],
        ),
        TableRow(
          children: [
            Text('Cell 1'),
            Text('Cell 2'),
          ],
        ),
        TableRow(
          children: [
            Text('Cell 1'),
            Text('Cell 2'),
          ],
        ),
        TableRow(
          children: [
            Text('Cell 1'),
            Text('Cell 2'),
          ],
        ),
        TableRow(
          children: [
            Text('Cell 1'),
            Text('Cell 2'),
          ],
        ),
        TableRow(
          children: [
            Text('Cell 1'),
            Text('Cell 2'),
          ],
        ),
      ],
    );
  }
}