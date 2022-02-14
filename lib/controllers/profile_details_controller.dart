import 'package:workify/controllers/AuthController.dart';
import 'package:workify/mixins/cache.dart';
import 'package:get/get.dart';
import 'package:workify/models/ProfileModel.dart';
import 'package:workify/services/profile_service.dart';

class ProfileDetailsController extends GetxController with CacheManager {
  var isLoading = true.obs;
  ProfileModel? profileModelDetails;
  final AuthController _authController = AuthController();
  @override
  void onInit() {
    super.onInit();
    callCheckAuthentication();
  }

  Future<void> callCheckAuthentication() async {
    final token = getToken();
    if (token == null) {
      try{
      await _authController.loginUser(
          username: "kingOfMirzapur", password: '#1234');
      }catch(error){
        print(
            '\n-- In Profile Details Controller file :: callCheckAuthentication(){} : Block 1\n');
        print('Login Error :: '+error.toString());
        print('-------------- End Block 1 ---------------');
      }
    }else {
        callFetchProfileDetails();
      }
  }

  void callFetchProfileDetails() async {
    try {
      isLoading(true);
      try {
        profileModelDetails = await ProfileService.fetchProfileDetails();
      } catch (error) {
        print(
            '\n-- In Profile Details Controller file :: callFetchProfileDetails(){} : Block 1\n');
        print('Error :: ' + error.toString());
        print('-------------- End Block 1 ---------------');
      }
      if (profileModelDetails != null) {
        print(
            '\n-- In Profile Details Controller file :: callFetchProfileDetails(){} : Block 2\n');
        print(
            'DataType received from profile_service.dart :: callProfileApi -> ' +
                profileModelDetails.runtimeType.toString());
        print('\nProfile Details received Successfully !! \n');
        print('-------------- End Block 2 ---------------');
      }
    } finally {
      isLoading(false);
    }
  }
}
