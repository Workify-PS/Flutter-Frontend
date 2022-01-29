import 'package:flutter/material.dart';
import 'package:workify/utils/sizes.dart';

var screenWidth, screenHeight;

class PositionDetails extends StatelessWidget {
  const PositionDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DeviceSize device = DeviceSize();
    device.size = MediaQuery.of(context).size;
    screenWidth = device.size.width;
    screenHeight = device.size.height;

    return Container(
      width: screenWidth * 0.8,
      height: screenWidth * 0.5,
      color: Colors.orange,
    );
  }
}
