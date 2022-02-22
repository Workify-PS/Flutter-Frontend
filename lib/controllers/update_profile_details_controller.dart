import 'dart:convert';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:workify/controllers/profile_details_controller.dart';

import 'package:workify/exceptions/print_log.dart';
import 'package:workify/models/EmployeeInfoCombined.dart';

import 'package:workify/services/update_profile_details_service.dart';

class UpdateProfileDetailsController extends GetxController {
  static void onSubmitBasicDetails(
      {mobile, dob, marriageStatus, city, state, country}) async {
    try {
      var sendData = EmployeeInfoCombined().toJson(
        employeeInfoCombined:
            ProfileDetailsController.employeeInfoCombinedEveryWhere,
      );
      sendData['mobile'] = mobile;
      // var date = DateFormat('yyyy-MM-dd').format(DateTime.parse('2002-02-02'));
      // print('\n\nDob\n\n' + date);
      // sendData['dob'] = dob;
      sendData['marriageStatus'] = marriageStatus;
      sendData['city'] = city;
      sendData['state'] = state;
      sendData['country'] = country;

      // PrintLog.printLog(
      //   fileName: 'UpdateProfileDetailsController',
      //   functionName: 'onSubmitBasicDetails',
      //   blockNumber: 1,
      //   printStatement: 'Mobile : ' +
      //       mobileNumber +
      //       '\nDoB : ' +
      //       dateOfBirth +
      //       '\nMarriage Status : ' +
      //       marriageStatus +
      //       '\ncity : ' +
      //       city +
      //       '\nstate : ' +
      //       state +
      //       '\ncountry : ' +
      //       country +
      //       '\nSend Data Type :: '+
      //       sendData.runtimeType.toString()+
      //       '\nJson Encode Send Data Type :: '+
      //       jsonEncode(sendData).runtimeType.toString()
      // );
      await UpdateProfileDetailsService.callEditUserApi(sendData);
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
