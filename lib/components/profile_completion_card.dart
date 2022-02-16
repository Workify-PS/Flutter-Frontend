import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:get/get.dart';
import 'package:workify/components/button.dart';

// import 'package:workify/utils/constants.dart';
import 'package:workify/utils/sizes.dart';
// import 'package:workify/utils/extensions.dart';
import 'package:workify/screens/ProfileSection/change_profile_page.dart';

double screenWidth = 0, screenHeight = 0;
bool portrait = false;

// ignore: must_be_immutable
class ProfileCompletionCard extends StatelessWidget {
  ProfileCompletionCard({Key? key}) : super(key: key);
  double percent = 0.12;

  @override
  Widget build(BuildContext context) {
    DeviceSize device = DeviceSize();
    device.size = MediaQuery.of(context).size;
    screenWidth = device.size.width;
    screenHeight = device.size.height;
    portrait = screenWidth < 1000;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircularPercentIndicator(
          radius: 150,
          lineWidth: 10,
          percent: percent,
          animation: true,
          reverse: true,
          center: Avatar(),
          // header: Text(
          //   'Profile',
          //   style: TextStyle(
          //     fontSize: 24,
          //     fontWeight: FontWeight.w500,
          //     //color: kTextColor,
          //   ),
          // ),
          progressColor: ((percent * 100) >= 0 && (percent * 100) <= 30)
              ? Colors.red
              : ((percent * 100) > 30 && (percent * 100) <= 70)
                  ? Colors.yellow
                  : Colors.green,
          backgroundColor: Colors.grey,
        ),
        Text(
          (percent * 100).toString() + ' % Complete',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        Spacer(),
        Button(buttonTextWidget: Text("Complete Now".toUpperCase())),
        // InkWell(
        //   onTap: () {
        //     Get.to(ChangeProfilePage());
        //   },
        //   child: Text(
        //     'Complete Now',
        //     style: TextStyle(
        //       fontSize: 24,
        //       //color: Colors.grey,
        //     ),
        //   ),
        // )
      ],
    );
  }
}

class Avatar extends StatelessWidget {
  const Avatar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
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
          width: portrait == true ? screenWidth * 0.2 : screenWidth * 0.15,
          height: portrait == true ? screenHeight * 0.2 : screenHeight * 0.15,
        ),
      ),
    );
  }
}
