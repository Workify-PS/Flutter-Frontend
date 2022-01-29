import 'package:flutter/material.dart';
import 'package:workify/utils/sizes.dart';

var screenWidth, screenHeight;

class Person extends StatelessWidget {
  const Person({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DeviceSize device = DeviceSize();
    device.size = MediaQuery.of(context).size;
    screenWidth = device.size.width;
    screenHeight = device.size.height;

    return Container(
      width: screenWidth * 0.8,
      height: screenWidth * 0.5,
      color: Colors.black,

    );
    // return Column(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   crossAxisAlignment: CrossAxisAlignment.center,
    //   children: [
    //     Material(
    //       shape: CircleBorder(),
    //       clipBehavior: Clip.hardEdge,
    //       color: Colors.transparent,
    //       child: Ink.image(
    //         image: AssetImage('images/avatar.png'),
    //         fit: BoxFit.contain,
    //         width: screenWidth * 0.3,
    //         height: screenHeight * 0.3,
    //       ),
    //     ),
    //     Text(
    //       'Name of Employee',
    //       style: TextStyle(
    //         fontSize: screenWidth * 0.013,
    //       ),
    //     ),
    //     Text(
    //       'Email Id of Employee',
    //       style: TextStyle(
    //         fontSize: screenWidth * 0.013,
    //       ),
    //     ),
    //   ],
    // );
  }
}
