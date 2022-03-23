// import 'dart:convert';

import 'package:get/get.dart';
// import 'package:intl/intl.dart';
import 'package:workify/controllers/fetch_all_employees_controller.dart';
import 'package:workify/controllers/profile_details_controller.dart';

import 'package:workify/exceptions/print_log.dart';
import 'package:workify/models/EmployeeInfoCombined.dart';
import 'package:workify/services/modify_employee_profile_details_service.dart';

final fetchAllEmployeesController = Get.find<FetchAllEmployeesController>();

class ModifyEmployeeProfileDetailsController extends GetxController {
  static void onSubmitBasicDetails(
      {mobile, marriageStatus, city, state, country}) async {
    try {
      var sendData = EmployeeInfoCombined().toJson(
        employeeInfoCombined:
            ProfileDetailsController.employeeInfoCombinedEveryWhere,
      );
      sendData['mobile'] = mobile;

      // var date = dob.toString().substring(6)
      //   +'-'+dob.toString().substring(3,5)
      //   +'-'+dob.toString().substring(0,2);

      // print('\n\n#Dob\n\n' + date);
      // sendData['dob'] = date;

      sendData['marriageStatus'] = marriageStatus;
      sendData['city'] = city;
      sendData['state'] = state;
      sendData['country'] = country;

      await ModifyEmployeeProfileDetailsService.callEditUserApi(sendData);
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
              fetchAllEmployeesController.allEmployeeList.elementAt(index));
      // sendData['userId'] = userId;
      sendData['designation'] = designation;
      sendData['grade'] = grade;
      sendData['jobPosition'] = jobPosition;

      await ModifyEmployeeProfileDetailsService.callEditUserApi(sendData);
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
      {index,
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
              fetchAllEmployeesController.allEmployeeList.elementAt(index));
      sendData['workLocation'] = workLocation;
      sendData['employementCategory'] = employementCategory;
      sendData['employementStatus'] = employementStatus;
      sendData['employementType'] = employementType;
      sendData['l1ManagerId'] = l1ManagerId;
      sendData['l2ManagerId'] = l2ManagerId;
      sendData['hrManagerId'] = hrManagerId;

      await ModifyEmployeeProfileDetailsService.callEditUserApi(sendData);
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
