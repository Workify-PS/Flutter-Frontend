import 'package:intl/intl.dart';
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
    // removeToken();
    foundToken();
  }

  Future<void> foundToken() async {
    final token = getToken();
    if (token != null) {
      callFetchProfileDetails();
    } else {
      tempLogin();
    }
  }

  Future<void> tempLogin() async {
    try {
      await _authController.loginUser(
          username: "kingOfMirzapur", password: '#1234');
    } catch (error) {
      print(
          '\n-- In Profile Details Controller file :: tempLogin(){} : Block 1\n');
      print('Login Error :: ' + error.toString());
      print('-------------- End Block 1 ---------------');
    } finally {
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

  bool checkValidDate(dynamic inputDate) {
    if (inputDate.runtimeType == String || inputDate.runtimeType == DateTime) {
      final date = inputDate.runtimeType == String
          ? DateTime.parse(inputDate.toString())
          : inputDate;
      final y = date.year.toString().padLeft(4, '0');
      final m = date.month.toString().padLeft(2, '0');
      final d = date.day.toString().padLeft(2, '0');

      final inputY = inputDate.substring(0, 4);
      final inputM = inputDate.substring(5, 7);
      final inputD = inputDate.substring(8, 10);
      final inputDateCorrect = '$y$m$d';
      final inputDateCheck = '$inputY$inputM$inputD';

      // print(
      //     '\n-- In Profile Details Controller file :: checkValidDate(){} : Block 1\n');
      // // print('Input DateTime format  :: ' + inputDateCorrect);
      // // print('InputDate :: ' + inputDateCheck);
      // // print('InputDate again ::' + inputDate);
      // print('Date Validated Correctly !!');
      // print('-------------- End Block 1 ---------------');
      return inputDateCorrect == inputDateCheck;
    } else {
      return false;
    }
  }
}
