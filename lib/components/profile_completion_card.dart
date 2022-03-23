import 'package:flutter/cupertino.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
// import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:get/get.dart';
import 'package:workify/components/button.dart';
import 'package:workify/controllers/UserController.dart';
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
  final profileDetailsController = Get.find<ProfileDetailsController>();
  final user = Get.find<UserController>();
  @override
  Widget build(BuildContext context) {
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
            Obx(() {
              if (profileDetailsController.isLoading.value) {
                return Text('Loading');
              } else {
                var profileIncompletePercentage =
                    profileDetailsController.profileIncompletePercentage;
                // return Text(profileIncompletePercentage.toString());
                return CircularPercentIndicator(
                  radius: 150,
                  lineWidth: 36,
                  percent: profileIncompletePercentage.value / 100,
                  animation: true,
                  reverse: true,
                  center: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Avatar(
                        name: user.currentUser?.value.firstName ?? "Buddy"),
                  ),
                  progressColor: ((profileIncompletePercentage) >= 0 &&
                          (profileIncompletePercentage) <= 30)
                      ? Colors.red
                      : ((profileIncompletePercentage) > 30 &&
                              (profileIncompletePercentage) <= 70)
                          ? Colors.yellow
                          : Colors.green,
                  backgroundColor: Colors.grey,
                );
              }
            }),
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
            Obx((() => PrimaryButton(
              buttonTextWidget:
                  profileDetailsController.profileIncompletePercentage.value ==
                          100
                      ? Text(translator.translate("My Profile"))
                      : Text(translator.translate("Complete Now")),
              onPressed: () {
                Get.find<HomePageController>().gotoPage("/profile", context);
              },
              primaryColor: kPrimaryColor,
              icon: Icon(CupertinoIcons.square_arrow_up),
            )))
          ],
        ));
  }
}

class Avatar extends StatelessWidget {
  const Avatar({Key? key, required this.name}) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
    final path = "assets/avatars/avatar${(name.hashCode) % 15}.png";
    return Material(
      shape: CircleBorder(),
      clipBehavior: Clip.hardEdge,
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          // print('\n\n\n Will change avatar Later \n\n\n');
        },
        child: Ink.image(
          image: AssetImage(path),
          fit: BoxFit.contain,
          width: 220,
          height: 220,
        ),
      ),
    );
  }
}
