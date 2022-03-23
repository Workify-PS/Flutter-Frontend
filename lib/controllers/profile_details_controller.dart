import 'package:workify/exceptions/print_log.dart';
import 'package:workify/mixins/cache.dart';
import 'package:get/get.dart';
import 'package:workify/models/EmployeeInfoCombined.dart';
import 'package:workify/services/profile_service.dart';

class ProfileDetailsController extends GetxController with CacheManager {
  var isLoading = true.obs;
  RxDouble profileIncompletePercentage = 0.0.obs;
  static EmployeeInfoCombined? employeeInfoCombinedEveryWhere;
  EmployeeInfoCombined? employeeInfoModelDetails; //Change it to infoCombined

  @override
  void onInit() {
    super.onInit();
    // foundToken();
    callFetchProfileDetails();
  }

  // Future<void> foundToken() async {
  //   final token = getToken();
  //   if (token != null) {
  //     callFetchProfileEmployeeDetails();
  //   } else {
  //     Get.offAllNamed('/auth');
  //   }
  // }

  void callFetchProfileDetails() async {
    try {
      isLoading(true);
      try {
        employeeInfoModelDetails = await ProfileService.fetchProfileDetails();
        employeeInfoCombinedEveryWhere = employeeInfoModelDetails;
      } catch (error) {
        PrintLog.printLog(
          fileName: 'Profile Details Controller file',
          functionName: 'callFetchProfileDetails(){}',
          blockNumber: 1,
          printStatement: 'Error :: ' + error.toString(),
        );
      }
      if (employeeInfoModelDetails != null) {
        var data = employeeInfoModelDetails;
        var profileFieldsIncompleteCount = 0;

        if (data?.mobile == '-1') {
          employeeInfoModelDetails?.mobile = 'Need to update.';
          profileFieldsIncompleteCount++;
        }
        if (data?.city == '-1') {
          employeeInfoModelDetails?.city = 'Need to update.';
          profileFieldsIncompleteCount++;
        }
        if (data?.state == '-1') {
          employeeInfoModelDetails?.state = 'Need to update.';
          profileFieldsIncompleteCount++;
        }
        if (data?.country == '-1') {
          employeeInfoModelDetails?.country = 'Need to update.';
          profileFieldsIncompleteCount++;
        }
        if (data?.grade == '-1') {
          employeeInfoModelDetails?.grade = 'Need to update.';
          profileFieldsIncompleteCount++;
        }
        if (data?.designation == '-1') {
          employeeInfoModelDetails?.designation = 'Need to update.';
          profileFieldsIncompleteCount++;
        }
        if (data?.jobPosition == '-1') {
          employeeInfoModelDetails?.jobPosition = 'Need to update.';
          profileFieldsIncompleteCount++;
        }
        if (data?.workLocation == '-1') {
          employeeInfoModelDetails?.workLocation = 'Need to update.';
          profileFieldsIncompleteCount++;
        }
        if (data?.employementCategory == '-1') {
          employeeInfoModelDetails?.employementCategory = 'Need to update.';
          profileFieldsIncompleteCount++;
        }
        if (data?.employementStatus == '-1') {
          employeeInfoModelDetails?.employementStatus= 'Need to update.';
          profileFieldsIncompleteCount++;
        }
        if (data?.employementType == '-1') {
          employeeInfoModelDetails?.employementType = 'Need to update.';
          profileFieldsIncompleteCount++;
        }

        double tempPercent = (10 - profileFieldsIncompleteCount) / 10;
        profileIncompletePercentage.value = tempPercent * 100;
        // print('tempPercent : ' + tempPercent.toString() + ' > ' + profileIncompletePercentage.toString());
        // print('count ' + profileFieldsIncompleteCount.toString());

        PrintLog.printLog(
          fileName: 'Profile Details Controller file',
          functionName: 'callFetchProfileDetails(){}',
          blockNumber: 2,
          printStatement:
              'DataType received from profile_service.dart :: fetchProfileDetails -> ' +
                  employeeInfoModelDetails.runtimeType.toString() +
                  '\nProfile Details received Successfully !! \n',
        );
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
