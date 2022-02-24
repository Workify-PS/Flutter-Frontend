import 'dart:convert';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:workify/controllers/fetch_all_employees_controller.dart';
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

  static void onSubmitPositionDetails(
      {index, userId, designation, grade, jobPosition}) async {
    try {
      var sendData = EmployeeInfoCombined().toJson(
        employeeInfoCombined:
            FetchAllEmployeesController.allEmployeeList.elementAt(index)
      );
      // sendData['userId'] = userId;
      sendData['designation'] = designation;
      sendData['grade'] = grade;
      sendData['jobPosition'] = jobPosition;

      
      await UpdateProfileDetailsService.callEditUserApi(sendData);
    } catch (error) {
      PrintLog.printLog(
        fileName: 'update_profile_details_controller',
        functionName: 'onSubmitPositionDetails',
        blockNumber: 2,
        printStatement: error,
      );
    }
  }

  static void onSubmitEmploymentDetails(
      {
      index,
      workLocation,
      employementCategory,
      employementStatus,
      employementType,
      l1ManagerId,
      l2ManagerId,
      hrManagerId}) async {
    try {
      var sendData = EmployeeInfoCombined().toJson(
        employeeInfoCombined:
            FetchAllEmployeesController.allEmployeeList.elementAt(index)
      );
      sendData['workLocation'] = workLocation;
      sendData['employementCategory'] = employementCategory;
      sendData['employementStatus'] = employementStatus;
      sendData['employementType'] = employementType;
      sendData['l1ManagerId'] = l1ManagerId;
      sendData['l2ManagerId'] = l2ManagerId;
      sendData['hrManagerId'] = hrManagerId;

      await UpdateProfileDetailsService.callEditUserApi(sendData);
    } catch (error) {
      PrintLog.printLog(
        fileName: 'update_profile_details_controller',
        functionName: 'onSubmitEmployementDetails',
        blockNumber: 2,
        printStatement: error,
      );
    }
  }
}
