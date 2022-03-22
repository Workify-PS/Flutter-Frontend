import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:get/get.dart';
import 'package:workify/components/button.dart';
import 'package:workify/controllers/profile_details_controller.dart';
import 'package:workify/screens/HomePage/HomePageController.dart';
import 'package:workify/utils/constants.dart';
// import 'package:workify/utils/extensions.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
// import 'package:workify/utils/constants.dart';
import 'package:workify/utils/sizes.dart';
// import 'package:workify/utils/extensions.dart';

double screenWidth = 0, screenHeight = 0;
bool portrait = false;

// ignore: must_be_immutable
class ProfileCompletionCard extends StatefulWidget {
  ProfileCompletionCard({Key? key}) : super(key: key);

  @override
  State<ProfileCompletionCard> createState() => _ProfileCompletionCardState();
}

class _ProfileCompletionCardState extends State<ProfileCompletionCard> {
  @override
  Widget build(BuildContext context) {
    final profileDetailsController = Get.find<ProfileDetailsController>();

    DeviceSize device = DeviceSize();
    device.size = MediaQuery.of(context).size;
    screenWidth = device.size.width;
    screenHeight = device.size.height;
    portrait = screenWidth < 1000;

    return Padding(
        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding * 1.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Neumorphic(
              style: NeumorphicStyle(
                  boxShape: NeumorphicBoxShape.circle(),
                  color: Theme.of(context).scaffoldBackgroundColor),
              child: Obx(() {
                if (profileDetailsController.isLoading.value) {
                  return Text('Loading');
                } else {
                  var profileIncompletePercentage =
                      profileDetailsController.profileIncompletePercentage;
                  // return Text(profileIncompletePercentage.toString());
                  return CircularPercentIndicator(
                    radius: 150,
                    lineWidth: 10,
                    percent: profileIncompletePercentage.value / 100,
                    animation: true,
                    reverse: true,
                    center: Avatar(),
                    progressColor: ((profileIncompletePercentage) >= 0 &&
                            (profileIncompletePercentage) <= 30)
                        ? Colors.red
                        : ((profileIncompletePercentage) > 30 &&
                                (profileIncompletePercentage ) <= 70)
                            ? Colors.yellow
                            : Colors.green,
                    backgroundColor: Colors.grey,
                  );
                }
              }),
            ),
            Padding(
              padding: const EdgeInsets.only(top: kDefaultPadding),
              child: Obx(() {
                if (profileDetailsController.isLoading.value) {
                  return Text('Loading');
                } else {
                  var profileIncompletePercentage =
                      profileDetailsController.profileIncompletePercentage;
                  return Text(
                    profileIncompletePercentage.toString() + ' % Complete',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  );
                }
              }),
            ),
            Spacer(),
            PrimaryButton(
              buttonTextWidget: Text("Complete Now"),
              onPressed: () {
                Get.find<HomePageController>().gotoPage("/profile", context);
              },
              primaryColor: kPrimaryColor,
              icon: Icon(CupertinoIcons.square_arrow_up),
            ),
          ],
        ));
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
