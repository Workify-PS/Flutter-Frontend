import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:workify/routes/router.dart';
import 'package:workify/screens/AuthPage/AuthController.dart';
import 'package:workify/controllers/profile_details_controller.dart';
import 'package:workify/exceptions/print_log.dart';
import 'package:workify/screens/HomePage/HomePageController.dart';
import 'package:workify/utils/constants.dart';

class AllEmployeLeavesApproveRejectService {
  static Future<void> callApproveApi(
      dynamic leaveInfoIdJson, dynamic context) async {
    String approveLeaveUrl = 'http://$ip:$port/workify/v1/leave/approveleave';
    try {
      final _authController = Get.find<AuthController>();
      final token = _authController.getToken();

      var sendData = jsonEncode(leaveInfoIdJson);

      // print('Data being Sent \n' + sendData);
      // print('\nSent data type :: ' + sendData.runtimeType.toString());

      var headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      };

      final Dio dio = Dio();
      dio.options.headers = headers;

      var response = await dio.post(approveLeaveUrl, data: sendData);

      if (response.statusCode == 200) {
        Get.offAndToNamed(Routes.home);
        PrintLog.printLog(
            fileName: 'All Employee Leaves Approve Reject Service  File',
            functionName: 'callApproveApi(){}',
            blockNumber: 1,
            printStatement: 'Leave Approved !!\n\n');
      } else {
        PrintLog.printLog(
            fileName: 'All Employee Leaves Approve Reject Service  File',
            functionName: 'callApproveApi(){}',
            blockNumber: 2,
            printStatement:
                'Response Status Code :\n' + response.statusCode.toString());
      }
    } on DioError catch (error) {
      PrintLog.printLog(
          fileName: 'All Employee Leaves Approve Reject Service  File',
          functionName: 'callApproveApi(){}',
          blockNumber: 3,
          printStatement: 'Error : ' + error.message.toString());
    }
  }

  static Future<void> callRejectApi(
      dynamic leaveInfoIdJson, dynamic context) async {
    String rejectLeaveUrl = 'http://$ip:$port/workify/v1/leave/rejectleave';
    try {
      final _authController = Get.find<AuthController>();
      final token = _authController.getToken();

      var sendData = jsonEncode(leaveInfoIdJson);

      // print('Data being Sent \n' + sendData);
      // print('\nSent data type :: ' + sendData.runtimeType.toString());

      var headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      };

      final Dio dio = Dio();
      dio.options.headers = headers;

      var response = await dio.post(rejectLeaveUrl, data: sendData);

      if (response.statusCode == 200) {
        Get.offAndToNamed(Routes.home);
        PrintLog.printLog(
            fileName: 'All Employee Leaves Approve Reject Service  File',
            functionName: 'callRejectApi(){}',
            blockNumber: 1,
            printStatement: 'User Details Updated !!\n\n');
      } else {
        PrintLog.printLog(
            fileName: 'All Employee Leaves Approve Reject Service  File',
            functionName: 'callRejectApi(){}',
            blockNumber: 2,
            printStatement:
                'Response Status Code :\n' + response.statusCode.toString());
      }
    } on DioError catch (error) {
      PrintLog.printLog(
          fileName: 'All Employee Leaves Approve Reject Service  File',
          functionName: 'callRejectApi(){}',
          blockNumber: 3,
          printStatement: error.message);
    }
  }
}
