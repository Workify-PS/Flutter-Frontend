import 'package:get/get.dart';
import 'package:workify/controllers/profile_details_controller.dart';

import 'package:workify/exceptions/print_log.dart';
import 'package:workify/models/EmployeeInfoCombined.dart';

import 'package:workify/services/update_profile_details_service.dart';

class UpdateProfileDetailsController extends GetxController {
  static void onSubmitBasicDetails(
      {mobileNumber, dateOfBirth, marriageStatus, city, state, country}) async {
    try {
      PrintLog.printLog(
        fileName: 'UpdateProfileDetailsController',
        functionName: 'onSubmitBasicDetails',
        blockNumber: 1,
        printStatement: 'Mobile : ' +
            mobileNumber +
            '\nDoB : ' +
            dateOfBirth +
            '\nMarriage Status : ' +
            marriageStatus +
            '\ncity : ' +
            city +
            '\nstate : ' +
            state +
            '\ncountry : ' +
            country,
      );

      var sendData = EmployeeInfoCombined().toJson(
        employeeInfoCombined:
            ProfileDetailsController.employeeInfoCombinedEveryWhere,
      );
      sendData['mobile'] = mobileNumber;
      await UpdateProfileDetailsService().callEditUserApi(sendData);
    } catch (error) {
      PrintLog.printLog(
        fileName: 'update_profile_details_controller',
        functionName: 'onSubmitBasicDetails',
        blockNumber: 2,
        printStatement: error,
      );
    }
  }

  static void onSubmitPositionDetails() {
    PrintLog.printLog(
      fileName: 'update_profile_details_controller',
      functionName: 'Submit : onPressed',
      blockNumber: 1,
      printStatement: 'Position Submit Clicked',
    );
  }

  static void onSubmitEmploymentDetails() {
    PrintLog.printLog(
      fileName: 'update_profile_details_controller',
      functionName: 'Submit : onPressed',
      blockNumber: 1,
      printStatement: 'Employment Submit Clicked',
    );
  }
}
