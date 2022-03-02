import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:workify/controllers/AuthController.dart';
import 'package:workify/exceptions/print_log.dart';

class ApplyLeaveService {
  static Future<void> callApplyLeaveApi(
      Map<String, dynamic> editUserJson) async {
    String leaveUrl = 'http://localhost:8080/workify/v1/leave/apply';
    try {
      final _authController = Get.find<AuthController>();
      final token = _authController.getToken();

      var sendData = jsonEncode(editUserJson);

      // print('Data being Sent \n' + sendData);
      // print('\nSent data type :: ' + sendData.runtimeType.toString());

      var headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      };

      final Dio dio = Dio();
      dio.options.headers = headers;

      var response = await dio.post(leaveUrl, data: sendData);

      if (response.statusCode == 200) {
        if (response.toString() == '1') {
          Get.offAllNamed('/home');
          PrintLog.printLog(
              fileName: 'Apply Leave Service File',
              functionName: 'callApplyLeaveApi(){}',
              blockNumber: 1,
              printStatement: 'Leave Applied Successfully !!\n\n');
        } else if (response.toString() == '-1') {
          Get.defaultDialog(
            title: "Today is not your B'day",
            middleText: "Please check your date of birth once!"
          );
        } else if (response.toString() == '-2') {
          Get.defaultDialog(
            title: "B'day leave for 1 day only",
            middleText: "Please have 1 day off only !"
          );
        } else if (response.toString() == '-3') {
          Get.defaultDialog(
            title: "Anniversary leave for 1 day only",
            middleText: "Please have 1 day off only !"
          );
        } else if (response.toString() == '-4') {
          Get.defaultDialog(
            title: "Today is not your anniversary",
            middleText: "Please remember it precisely, your spouse gonna be very upset!"
          );
        } else if (response.toString() == '-5') {
          Get.defaultDialog(
            title: "Leave Quota Exhausted",
            middleText: "Can't take leave(s) any more"
          );
        } else if (response.toString() == '-6') {
          Get.defaultDialog(
            title: "Anniversary Leave!",
            middleText: "Either already taken or Unmarried :("
          );
        }

      } else {
        PrintLog.printLog(
            fileName: 'Apply Leave Service File',
            functionName: 'callApplyLeaveApi(){}',
            blockNumber: 2,
            printStatement:
                '##Response Status Code :\n' + response.statusCode.toString());
      }
    } on DioError catch (error) {
      PrintLog.printLog(
          fileName: 'Apply Leave Service File',
          functionName: 'callApplyLeaveApi(){}',
          blockNumber: 3,
          printStatement: '##Error' + error.message);
    }
  }
}
