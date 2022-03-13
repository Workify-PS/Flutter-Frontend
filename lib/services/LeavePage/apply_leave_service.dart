import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:workify/screens/AuthPage/AuthController.dart';
import 'package:workify/exceptions/print_log.dart';
import 'package:workify/utils/constants.dart';

class ApplyLeaveService {
  static Future<void> callApplyLeaveApi(
      Map<String, dynamic> editUserJson) async {
    String leaveUrl = 'http://$ip:$port/workify/v1/leave/apply';
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
              middleText: "Please check your date of birth once!");
        } else if (response.toString() == '-2') {
          Get.defaultDialog(
              title: "B'day leave for 1 day only",
              middleText: "Please have 1 day off only !");
        } else if (response.toString() == '-3') {
          Get.defaultDialog(
              title: "Anniversary leave for 1 day only",
              middleText: "Please have 1 day off only !");
        } else if (response.toString() == '-4') {
          Get.defaultDialog(
              title: "Today is not your anniversary",
              middleText:
                  "Please remember it precisely, your spouse gonna be very upset!");
        } else if (response.toString() == '-5') {
          Get.defaultDialog(
              title: "Leave quota exhausted",
              middleText: "Can't take leave(s) any more");
        } else if (response.toString() == '-6') {
          Get.defaultDialog(
              title: "Not eligible for anniversary leave!",
              middleText: "Need to get married first :)");
        } else if (response.toString() == '-7') {
          Get.defaultDialog(
              title: "Leave already taken :(",
              middleText: "Birthday leave already taken");
        } else if (response.toString() == '-8') {
          Get.defaultDialog(
              title: "Leave pending!",
              middleText: 'Birthday leave already in queue');
        } else if (response.toString() == '-9') {
          Get.defaultDialog(
              title: "Leave already taken :(",
              middleText: "Anniversary leave already taken");
        } else if (response.toString() == '-10') {
          Get.defaultDialog(
              title: "Leave pending!",
              middleText: 'Anniversary leave already in queue');
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
