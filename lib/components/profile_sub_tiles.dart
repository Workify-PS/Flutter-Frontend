import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workify/screens/AuthPage/AuthController.dart';
import 'package:workify/controllers/UserController.dart';
import 'package:workify/screens/HomePage/HomePageController.dart';
import 'package:workify/utils/constants.dart';
// import 'package:workify/exceptions/print_log.dart';

class ProfileSubTiles extends StatelessWidget {
  const ProfileSubTiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();

    return Container(
        padding: const EdgeInsets.only(top: kDefaultPadding / 1.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileSubTile(profileOptions: 'My Profile'),
            if(userController.currentUser?.value.jobRole == 'ROLE_ADMIN')
              ProfileSubTile(profileOptions: 'All Employee Profile'),
          ],
        ));
  }
}

// ignore: must_be_immutable
class ProfileSubTile extends GetView<HomePageController> {
  final authController = Get.find<AuthController>();

  String profileOptions;
  ProfileSubTile({Key? key, required this.profileOptions}) : super(key: key);
  RxBool isSelected = false.obs;
  @override
  Widget build(BuildContext context) {
    return Obx(() => InkWell(
          onTap: () {
            profileOptions == 'My Profile'
                ? {controller.gotoPage('/profile', context)}
                : {
                    controller.gotoPage('/all-employee-profile',context),
                  };
          },
          onHover: (value) => isSelected.value = value,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding * 1.5,
              vertical: kDefaultPadding / 1.4,
            ),
            child: Text(
              profileOptions,
              style: Theme.of(context).textTheme.button!.copyWith(
                  color: isSelected.value ? kPrimaryColor : kGrayColor,
                  fontSize: 13),
            ),
          ),
        ));
  }
}
