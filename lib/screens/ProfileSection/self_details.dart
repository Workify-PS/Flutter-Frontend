import 'package:flutter/material.dart';
import 'package:workify/utils/sizes.dart';


class Person extends StatelessWidget {
  const Person({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DeviceSize device = DeviceSize();
    device.size = MediaQuery.of(context).size;
    final double screenWidth = device.size.width;
    final double screenHeight = device.size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: screenWidth ,
        height: screenHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          // color: Colors.black,
        ),
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Material(
              shape: CircleBorder(),
              clipBehavior: Clip.hardEdge,
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  // print('\n\n\n Will change avatar Later \n\n\n');
                },
                child: Ink.image(
                  image: AssetImage('images/avatar.png'),
                  fit: BoxFit.contain,
                  width: screenWidth * 0.15,
                  height: screenHeight * 0.15,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name',
                  style: TextStyle(
                    fontSize: screenWidth * 0.017,
                  ),
                ),
                Text(
                  'Email Id',
                  style: TextStyle(
                    fontSize: screenWidth * 0.013,
                  ),
                ),
                Text(
                  'Mobile No',
                  style: TextStyle(
                    fontSize: screenWidth * 0.013,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
