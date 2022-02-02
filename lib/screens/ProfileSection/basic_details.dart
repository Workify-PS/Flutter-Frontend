// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:workify/utils/sizes.dart';

import './self_details.dart';
import './modify_history_buttons.dart';


class BasicDetails extends StatelessWidget {
  const BasicDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DeviceSize device = DeviceSize();
    device.size = MediaQuery.of(context).size;
    final double screenWidth = device.size.width;
    // final double screenHeight = device.size.height;
    bool portrait = screenWidth < 1000;

    return Padding(
      padding: const EdgeInsets.all(8),
      child: DefaultTextStyle(
        style: TextStyle(
          // fontSize: screenWidth * 0.01,
          fontWeight: FontWeight.bold,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.transparent,
          ),
          child: Flex(
            direction: portrait == true ? Axis.vertical : Axis.horizontal,
            children: [
              Expanded(
                flex: 5,
                child: Person(),
              ),
              Expanded(
                flex: 9,
                // child: Container(
                  // color: Colors.blue,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FatherNameBgroup(),
                      DobCob(),
                      GenderMarital(),
                      EthnicHealth(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ModifyHistoryButton(),
                        ],
                      ),
                    ],
                  ),
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class FatherNameBgroup extends StatelessWidget{
  const FatherNameBgroup({Key ? key}): super(key:key);
  @override 
  Widget build(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Father Name'),
            Text(
              'Happy Forever',
              style: TextStyle(
                // fontSize: screenWidth * widthScaleFactor,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Blood Group'),
            Text(
              'Happy Forever',
              style: TextStyle(
                // fontSize: screenWidth * 0.001,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ],
    );
                    
  }
}

// class Names extends StatelessWidget {
//   const Names({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         // Column(
//         //   // mainAxisAlignment: MainAxisAlignment.spaceAround,
//         //   crossAxisAlignment: CrossAxisAlignment.start,
//         //   children: [
//         //     Text('Name'),
//         //     Text(
//         //       'Happy Forever',
//         //       style: TextStyle(
//         //         fontSize: screenWidth * widthScaleFactor,
//         //         fontWeight: FontWeight.normal,
//         //       ),
//         //     ),
//         //   ],
//         // ),
//         Column(
//           // mainAxisAlignment: MainAxisAlignment.spaceAround,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Father Name'),
//             Text(
//               'Happy Forever',
//               style: TextStyle(
//                 fontSize: screenWidth * widthScaleFactor,
//                 fontWeight: FontWeight.normal,
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

class DobCob extends StatelessWidget {
  const DobCob({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Date of Birth'),
            Text(
              'Happy Forever',
              style: TextStyle(
                // fontSize: screenWidth * widthScaleFactor,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Country of Birth'),
            Text(
              'Happy Forever',
              style: TextStyle(
                // fontSize: screenWidth * widthScaleFactor,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class GenderMarital extends StatelessWidget {
  const GenderMarital({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Gender'),
            Text(
              'Happy Forever',
              style: TextStyle(
                // fontSize: screenWidth * widthScaleFactor,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Marital Status'),
            Text(
              'Happy Forever',
              style: TextStyle(
                // fontSize: screenWidth * widthScaleFactor,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class EthnicHealth extends StatelessWidget {
  const EthnicHealth({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nationality'),
            Text(
              'Happy Forever',
              style: TextStyle(
                // fontSize: screenWidth * widthScaleFactor,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Is Disabled ?'),
            Text(
              'Happy Forever',
              style: TextStyle(
                // fontSize: screenWidth * widthScaleFactor,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
