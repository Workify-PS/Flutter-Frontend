import 'dart:convert';

import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:workify/exceptions/print_log.dart';
import 'package:workify/screens/AuthPage/AuthController.dart';
// import 'package:workify/routes/router.dart';
import 'package:workify/screens/AuthPage/AuthPageController.dart';
import 'package:workify/utils/constants.dart';
// import 'package:workify/screens/HomePage/HomePageController.dart';

class ChangePasswordService {
  static Future<void> callChangePasswordApi(
      Map<String, dynamic> changePasswordJson, dynamic context) async {
    String changePasswordUrl =
        'http://$ip:$port/workify/v1/login/changepassword';
    try {
      final _authController = Get.find<AuthController>();
      final token = _authController.getToken();

      var sendData = jsonEncode(changePasswordJson);

      // print('Data being Sent \n' + sendData);
      // print('\nSent data type :: ' + sendData.runtimeType.toString());

      var headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      };

      final Dio dio = Dio();
      dio.options.headers = headers;

      var response = await dio.post(changePasswordUrl, data: sendData);

      if (response.statusCode == 200) {
        if (response.toString() == '1') {
          Get.back();
          Get.find<AuthController>().logOut();
          Get.toNamed('/auth');

          PrintLog.printLog(
              fileName: 'Change Password Service File',
              functionName: 'callChangePasswordApi(){}',
              blockNumber: 1,
              printStatement: 'Password Changed Successfully !!\n\n');
        } else {
          Get.defaultDialog(
            title: 'Issue with current password',
            middleText: 'Please check current password once!',
          );
        }
      } else {
        PrintLog.printLog(
            fileName: 'Change Password Service File',
            functionName: 'callChangePasswordApi(){}',
            blockNumber: 2,
            printStatement:
                'Response Status Code :\n' + response.statusCode.toString());
      }
    } on DioError catch (error) {
      PrintLog.printLog(
          fileName: 'Change Password Service File',
          functionName: 'callChangePasswordApi(){}',
          blockNumber: 3,
          printStatement: error.message);
    }
  }

  static Future<void> callOverridePasswordApi(
      Map<String, dynamic> changePasswordJson, dynamic context) async {
    String overridePasswordUrl =
        'http://$ip:$port/workify/v1/login/overridepassword';
    try {
      var sendData = jsonEncode(changePasswordJson);

      // print('Data being Sent \n' + sendData);
      // print('\nSent data type :: ' + sendData.runtimeType.toString());

      var headers = {'Content-Type': 'application/json'};

      final Dio dio = Dio();
      dio.options.headers = headers;

      var response = await dio.post(overridePasswordUrl, data: sendData);

      if (response.statusCode == 200) {
        Get.back();
        Get.put(AuthPageController()).backToLogin();
        PrintLog.printLog(
            fileName: 'Change Password Service File',
            functionName: 'callOverridePasswordApi(){}',
            blockNumber: 1,
            printStatement: 'Password Changed Successfully !!\n\n');
      } else {
        PrintLog.printLog(
            fileName: 'Change Password Service File',
            functionName: 'callOverridePasswordApi(){}',
            blockNumber: 2,
            printStatement:
                'Response Status Code :\n' + response.statusCode.toString());
      }
    } on DioError catch (error) {
      PrintLog.printLog(
          fileName: 'Change Password Service File',
          functionName: 'callOverridePasswordApi(){}',
          blockNumber: 3,
          printStatement: error.message);
    }
  }
}
