import 'package:workify/exceptions/print_log.dart';
import 'package:workify/mixins/cache.dart';
import 'package:get/get.dart';
import 'package:workify/models/EmployeeDetailsModel.dart';
import 'package:workify/models/EmployeeInfoModel.dart';
import 'package:workify/services/profile_service.dart';

class ProfileDetailsController extends GetxController with CacheManager {
  var isLoading = true.obs;
  EmployeeInfoModel? employeeInfoModelDetails;
  EmployeeDetailsModel? employeeDetailsModelDetails;
  @override
  void onInit() {
    super.onInit();
    // foundToken();
    callFetchProfileEmployeeDetails();
  }

  // Future<void> foundToken() async {
  //   final token = getToken();
  //   if (token != null) {
  //     callFetchProfileEmployeeDetails();
  //   } else {
  //     Get.offAllNamed('/auth');
  //   }
  // }

  void callFetchProfileEmployeeDetails() async {
    try {
      isLoading(true);
      try {
        employeeInfoModelDetails = await ProfileService.fetchProfileDetails();
      } catch (error) {
        PrintLog.printLog(
          fileName: 'Profile Details Controller file',
          functionName: 'callFetchProfileEmployeeDetails(){}',
          blockNumber: 1,
          printStatement: 'Error :: ' + error.toString(),
        );
      }
      if (employeeInfoModelDetails != null) {
        PrintLog.printLog(
          fileName: 'Profile Details Controller file',
          functionName: 'callFetchProfileEmployeeDetails(){}',
          blockNumber: 2,
          printStatement:
              'DataType received from profile_service.dart :: fetchProfileDetails -> ' +
                  employeeInfoModelDetails.runtimeType.toString() +
                  '\nProfile Details received Successfully !! \n',
        );
      }
      try {
        employeeDetailsModelDetails =
            await ProfileService.fetchEmployeeDetails();
      } catch (error) {
        PrintLog.printLog(
          fileName: 'Profile Details Controller file',
          functionName: 'callFetchProfileEmployeeDetails(){}',
          blockNumber: 3,
          printStatement: 'Error :: ' + error.toString(),
        );
      }
      if (employeeDetailsModelDetails != null) {
        PrintLog.printLog(
          fileName: 'Profile Details Controller file',
          functionName: 'callFetchProfileEmployeeDetails(){}',
          blockNumber: 4,
          printStatement:
              'DataType received from profile_service.dart :: fetchEmployeeDetails -> ' +
                  employeeDetailsModelDetails.runtimeType.toString() +
                  '\nEmployee Details received Successfully !! \n',
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
