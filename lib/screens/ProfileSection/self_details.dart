import 'package:flutter/material.dart';
import 'package:workify/utils/sizes.dart';

bool portrait = false;

class Person extends StatelessWidget {
  const Person({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DeviceSize device = DeviceSize();
    device.size = MediaQuery.of(context).size;
    final double screenWidth = device.size.width;
    final double screenHeight = device.size.height;
    portrait = screenWidth < 1000;

    return portrait == false
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: screenWidth,
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
                        width: screenWidth * 0.25,
                        height: screenHeight * 0.25,
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
                          // fontSize: screenWidth * 0.017,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        : Text('Portrait View');
  }
}
