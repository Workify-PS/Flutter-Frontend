import 'package:flutter/material.dart';
import 'package:workify/utils/sizes.dart';

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
                        SalaryPerAnnum(),
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
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  width: screenWidth,
                  height: screenHeight,
                  color: Colors.amber,
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      // compName,EmpCode,Designation,StartDate,EndDate,ProjectName,Role,WorkLoc,
      // salary,EmpType,PfAcc,Exp
      children: [
        CompanyName(),
        EmployeeCode(),
        Designation(),
        StartDate(),
        EndDate(),
        ProjectName(),
        Role(),
        WorkLocation(),
        SalaryPerAnnum(),
        EmploymentType(),
        PfAccount(),
        Experience(),
      ],
      // To Build footer in Portrait View;
    );
  }
}

class CompanyName extends StatelessWidget {
  const CompanyName({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Company Name',
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
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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

class Designation extends StatelessWidget {
  const Designation({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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

class StartDate extends StatelessWidget {
  const StartDate({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Start Date',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          'Happy Forever',
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
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'End Date',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          'Happy Forever',
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
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Project Name',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          'Happy Forever',
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
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Role',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          'Happy Forever',
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
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Work Location',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          'Happy Forever',
        ),
      ],
    );
  }
}

class SalaryPerAnnum extends StatelessWidget {
  const SalaryPerAnnum({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Salary Per Annum',
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
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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

class PfAccount extends StatelessWidget {
  const PfAccount({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'PF Account',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          'Happy Forever',
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
