// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:workify/utils/sizes.dart';

import './self_details.dart';
import './modify_history_buttons.dart';

double screenWidth = 0, screenHeight = 0;
bool portrait = false;

class BasicDetails extends StatelessWidget {
  const BasicDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DeviceSize device = DeviceSize();
    device.size = MediaQuery.of(context).size;
    screenWidth = device.size.width;
    screenHeight = device.size.height;
    
    portrait = screenWidth < 1000;

    return portrait == false
        ? Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.transparent,
              ),
              child: Row(
                // direction: portrait == true ? Axis.vertical : Axis.horizontal,
                children: [
                  Expanded(
                    flex: 3,
                    child: Person(),
                  ),
                  Expanded(
                    flex: 7,
                    // child: Container(
                    // color: Colors.blue,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Email(),
                                  MobileNumber(),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  FatherName(),
                                  BloodGroup(),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  DoB(),
                                  CoB(),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Gender(),
                                  Marital(),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Ethnic(),
                                  Health(),
                                ],
                              ),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.center,
                              //   children: [
                              //     ModifyHistoryButton(),
                              //   ],
                              // ),
                            ],
                          ),
                        ),
                        // Landscape Footer
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        : BasicDetailsPortraitView();
  }
}

class BasicDetailsPortraitView extends StatelessWidget {
  const BasicDetailsPortraitView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Person(),
        ),
        Expanded(
          flex: 6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Email(),
              MobileNumber(),
              FatherName(),
              BloodGroup(),
              DoB(),
              CoB(),
              Gender(),
              Marital(),
              Ethnic(),
              Health(),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     ModifyHistoryButton(),
              //   ],
              // ),
            ],
          ),
        ),
      ],
    );
  }
}

class Email extends StatelessWidget {
  const Email({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
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
            child: Text(
                'Happy ForeverHappy ForeverHappy ForeverHappy ForeverHappy Forever'),
          ),
        ),
      ],
    );
  }
}

class MobileNumber extends StatelessWidget {
  const MobileNumber({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
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
            child: Text(
                'Happy ForeverHappy ForeverHappy ForeverHappy ForeverHappy Forever'),
          ),
        ),
      ],
    );
  }
}

class BloodGroup extends StatelessWidget {
  const BloodGroup({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Blood Group',
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
            child: Text(
                'Happy ForeverHappy ForeverHappy ForeverHappy ForeverHappy Forever'),
          ),
        ),
      ],
    );
  }
}

class FatherName extends StatelessWidget {
  const FatherName({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Father Name',
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
            child: Text(
                'Happy ForeverHappy ForeverHappy ForeverHappy ForeverHappy Forever'),
          ),
        ),
      ],
    );
  }
}

class DoB extends StatelessWidget {
  const DoB({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Date of Birth',
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
            child: Text(
                'Happy ForeverHappy ForeverHappy ForeverHappy ForeverHappy Forever'),
          ),
        ),
      ],
    );
  }
}

class CoB extends StatelessWidget {
  const CoB({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Country of Birth',
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
            child: Text(
                'Happy ForeverHappy ForeverHappy ForeverHappy ForeverHappy Forever'),
          ),
        ),
      ],
    );
  }
}

class Gender extends StatelessWidget {
  const Gender({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Gender',
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
            child: Text(
                'Happy ForeverHappy ForeverHappy ForeverHappy ForeverHappy Forever'),
          ),
        ),
      ],
    );
  }
}

class Marital extends StatelessWidget {
  const Marital({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Marital',
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
            child: Text(
                'Happy ForeverHappy ForeverHappy ForeverHappy ForeverHappy Forever'),
          ),
        ),
      ],
    );
  }
}

class Ethnic extends StatelessWidget {
  const Ethnic({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Natinoality',
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
            child: Text(
                'Happy ForeverHappy ForeverHappy ForeverHappy ForeverHappy Forever'),
          ),
        ),
      ],
    );
  }
}

class Health extends StatelessWidget {
  const Health({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Health',
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
            child: Text(
                'Happy ForeverHappy ForeverHappy ForeverHappy ForeverHappy Forever'),
          ),
        ),
      ],
    );
  }
}



// ... Landscape Footer
// Expanded(
  //   flex: 2,
  //   child: Column(
  //     // mainAxisAlignment: MainAxisAlignment.center,
  //     crossAxisAlignment: CrossAxisAlignment.stretch,
  //     children:[
  //       Text(
  //         'History',
  //         style: TextStyle(
  //           fontWeight: FontWeight.bold,
  //         ),
  //       ),
  //       Padding(
  //         padding: const EdgeInsets.all(32.0),
  //         child: SingleChildScrollView(
  //           scrollDirection: Axis.vertical,
  //           child: Table(
  //             border: TableBorder.all(),
  //             children: [
  //               TableRow(
  //                 children: [
  //                   Text(
  //                     'Heading 1',
  //                     style: TextStyle(
  //                       fontWeight:FontWeight.bold,
  //                     ),
  //                   ),
  //                   Text(
  //                     'Heading 2',
  //                     style: TextStyle(
  //                       fontWeight:FontWeight.bold,
  //                     ),
  //                   ),
  //                   Text(
  //                     'Heading 3',
  //                     style: TextStyle(
  //                       fontWeight:FontWeight.bold,
  //                     ),
  //                   ),
  //                   Text(
  //                     'Heading 4',
  //                     style: TextStyle(
  //                       fontWeight:FontWeight.bold,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               TableRow(
  //                 children: [
  //                   Text('Cell 1'),
  //                   Text('Cell 2'),
  //                   Text('Cell 3'),
  //                   Text('Cell 4'),
  //                 ],
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ],
  //   ),
  // ),