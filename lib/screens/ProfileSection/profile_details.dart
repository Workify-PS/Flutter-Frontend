import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workify/models/profileModel.dart';
import 'package:workify/screens/ProfileSection/ProfileSectionControllers/ProfileDetailsController.dart';

class ProfileDetails extends StatelessWidget {
  ProfileDetails({Key? key}) : super(key: key);
  final ProfileDetailsController profileDetailsController =
      Get.put(ProfileDetailsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (profileDetailsController.isLoading.value) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  color: Colors.red,
                ),
                Text('Loading')
              ],
            ),
          );
        } else {
          return Text(
              profileDetailsController.profileModelDetails!.fullName);
        }
      }),
    );
  }
}
