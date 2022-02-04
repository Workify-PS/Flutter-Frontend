import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:get/get.dart';

import 'package:workify/utils/constants.dart';
import 'package:workify/utils/sizes.dart';
import 'package:workify/utils/extensions.dart';
import 'package:workify/screens/ProfileSection/change_profile_page.dart';

double screenWidth = 0, screenHeight = 0;
bool portrait = false;

class ProfileCompletionCard extends StatelessWidget {
  ProfileCompletionCard({Key? key}) : super(key: key);
  double percent = 0.98;

  @override
  Widget build(BuildContext context) {
    DeviceSize device = DeviceSize();
    device.size = MediaQuery.of(context).size;
    screenWidth = device.size.width;
    screenHeight = device.size.height;
    portrait = screenWidth < 1000;
    String greeting() {
      var hour = DateTime.now().hour;
      if (hour < 12) return 'Good Morning';
      if (hour < 17) return 'Good Afternoon';
      return 'Good Evening';
    }

    return portrait == false
        ? Padding(
            padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding,
              vertical: kDefaultPadding / 2,
            ),
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  CircularPercentIndicator(
                    radius: 150,
                    lineWidth: 10,
                    percent: percent,
                    animation: true,
                    reverse: true,
                    header: Text(
                      greeting(),
                      style: TextStyle(
                        fontSize: screenWidth * 0.02,
                      ),
                    ),
                    center: Avatar(),
                    progressColor: ((percent * 100)>=0 && (percent * 100) <= 30) ? Colors.red :
                                   ((percent * 100)>30 && (percent * 100) <= 70) ? Colors.yellow :
                                   Colors.green ,
                    backgroundColor: Colors.grey,
                  ),
                  Text(
                    (percent * 100).toString() + ' % Complete',
                    style: TextStyle(
                      fontSize: screenWidth * 0.02,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(ChangeProfilePage());
                    },
                    child: Text(
                      'Complete Now',
                      style: TextStyle(
                        fontSize: screenWidth * 0.021,
                      ),
                    ),
                  )
                ],
              ),
            ).makeRounded(
                blurRadius: 15,
                borderRadius: 15,
                offset: Offset(5, 5),
                topShadowColor: Colors.white60,
                bottomShadowColor: Color(0xFF234395).withOpacity(0.15)),
          )
        : Text('Portrait');
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
