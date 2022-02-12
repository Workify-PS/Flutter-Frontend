// import 'dart:convert';

import 'package:workify/apimodule/profile_api_service.dart';
import 'package:get/get.dart';
import 'package:workify/models/ProfileModel.dart';
// import 'package:workify/models/profileModel.dart';

class ProfileDetailsController extends GetxController {
  var isLoading = true.obs;
  var _data;
  // var profileModelDetails = ProfileModel().obs;
  ProfileModel? profileModelDetails;
  // Map<String, dynamic> profileModelDetailsJson =
  //     {'name': 'My name is Amar'}.obs;
  @override
  void onInit() {
    super.onInit();
    callfetchProfileDetails();
  }

  void callfetchProfileDetails() async {
    try {
      isLoading(true);
      // await ProfileApiService.fetchProfileDetails();
      try {
        profileModelDetails = await ProfileApiService.fetchProfileDetails();
      } catch (error) {
        print(
            '\n-- In Profile Details Controller file :: callfetchProfileDetails(){} : Block 1\n');
        print('Error :: ' + error.toString());
        print('-------------- End Block 1 ---------------');
      }
      if (profileModelDetails != null) {
        print(
            '\n-- In Profile Details Controller file :: callfetchProfileDetails(){} : Block 2\n');
        print('DataType received from callProfileApi -> ' +
            profileModelDetails.runtimeType.toString());
        print('\nProfile Details received Successfully\n');
        print('-------------- End Block 2 ---------------');
      }
    } finally {
      isLoading(false);
    }
  }
}