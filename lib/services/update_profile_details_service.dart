import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:workify/controllers/AuthController.dart';
import 'package:workify/exceptions/print_log.dart';
import 'package:workify/screens/ProfileSection/basic_details.dart';

class UpdateProfileDetailsService {
  static Future<void> callEditUserApi(Map<String, dynamic> editUserJson) async {
    String editUserUrl = 'http://localhost:8080/workify/v1/edituser';
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

      var response = await dio.post(editUserUrl, data: sendData);

      if (response.statusCode == 200) {
        profileDetailsController.onInit();
        Get.offAllNamed('/home');
        PrintLog.printLog(
            fileName: 'Update Profile Details Service File',
            functionName: 'callEditUserApi(){}',
            blockNumber: 1,
            printStatement: 'User Details Updated !!\n\n');
      } else {
        PrintLog.printLog(
            fileName: 'Update Profile Details Service File',
            functionName: 'callEditUserApi(){}',
            blockNumber: 2,
            printStatement: 'Everything OK !!\n');
      }
    } on DioError catch (error) {
      PrintLog.printLog(
          fileName: 'update_profile_details_service',
          functionName: 'callEditUserApi',
          blockNumber: 3,
          printStatement: error.message);
    }
  }
}
