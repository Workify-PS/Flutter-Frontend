import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:workify/exceptions/print_log.dart';
import 'package:workify/screens/AuthPage/PasswordRelated/ForgotPasswordWidget.dart';
import 'package:workify/screens/AuthPage/PasswordRelated/VerifyOtpWidget.dart';
import 'package:workify/services/change_password_service.dart';
import 'package:workify/utils/constants.dart';

class ForgotPasswordService {
  static Future<void> callForgotPasswordApi({data}) async {
    String forgotPasswordUrl = 'http://$ip:$port/workify/v1/login/forgot';
    try {
      var headers = {'Content-Type': 'application/json'};

      final Dio dio = Dio();
      dio.options.headers = headers;

      data = json.encode(data);
      Get.defaultDialog(
          radius: 8,
          barrierDismissible: false,
          backgroundColor: Colors.grey.shade200,
          title: 'Sending OTP',
          content: CircularProgressIndicator(
            color: kPrimaryColor,
          ));
      var response = await dio.post(forgotPasswordUrl, data: data);
      Get.back();

      if (response.toString() == '-1') {
        Get.defaultDialog(
            radius: 8,
            backgroundColor: Colors.grey.shade200,
            title: 'Internet issue',
            middleText: 'Please check your net connectivity.');
      } else if (response.toString() == '0') {
        Get.defaultDialog(
            radius: 8,
            backgroundColor: Colors.grey.shade200,
            title: 'Email id not found',
            middleText: 'Given email id is not registered with us');
      } else if (response.toString() == '1') {
        // Get.defaultDialog(
        //     radius: 8,
        //     // navigatorKey: Get.nestedKey(1),

        //     barrierDismissible: false,
        //     backgroundColor: Colors.grey.shade200,
        //     title: 'Please enter OTP received on mail',
           //  content: VerifyOtpWidget());
         PrintLog.printLog(
            fileName: 'Forgot Password Service File',
            functionName: 'callForgotPasswordApi(){}',
            blockNumber: 1,
            printStatement: 'OTP sent Successfully !!\n\n');
        return;

       
      } else {
        PrintLog.printLog(
            fileName: 'Forgot Password Service File',
            functionName: 'callForgotPasswordApi(){}',
            blockNumber: 2,
            printStatement:
                'Response Status Code : ' + response.statusCode.toString());
      }
    } on DioError catch (error) {
      PrintLog.printLog(
          fileName: 'Forgot Password Service File',
          functionName: 'callForgotPasswordApi(){}',
          blockNumber: 3,
          printStatement: error.message);
    }
  }

  Future<void> callVerifyOtpApi({data}) async {
    String verifyOtpUrl = 'http://$ip:$port/workify/v1/login/verifyotp';
    try {
      var headers = {'Content-Type': 'application/json'};

      final Dio dio = Dio();
      dio.options.headers = headers;

      data = json.encode(data);

      var response = await dio.post(verifyOtpUrl, data: data);

      if (response.statusCode == 200) {
        if (response.toString() == 'true') {
          Get.back();
          Get.defaultDialog(
            radius: 8,
            barrierDismissible: false,
            backgroundColor: Colors.grey.shade200,
            title: 'Please change your password',
            content: ForgotPasswordWidget(),
          );
        } else {
          Get.defaultDialog(
              radius: 8,
              backgroundColor: Colors.grey.shade200,
              title: 'Wrong OTP!',
              middleText: 'Please check for latest OTP');
        }
      } else {
        PrintLog.printLog(
            fileName: 'Forgot Password Service File',
            functionName: 'callVerifyOtpApi(){}',
            blockNumber: 2,
            printStatement:
                'Response Status Code :\n' + response.statusCode.toString());
      }
    } on DioError catch (error) {
      PrintLog.printLog(
          fileName: 'Forgot Password Service File',
          functionName: 'callVerifyOtpApi(){}',
          blockNumber: 3,
          printStatement: error.message);
    }
  }
}
