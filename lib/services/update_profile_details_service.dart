import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:workify/controllers/AuthController.dart';
import 'package:workify/exceptions/print_log.dart';

class UpdateProfileDetailsService {
  Future<void> callEditUserApi(Map<String, dynamic> editUserJson) async {
    String editUserUrl = 'localhost:8080/workify/v1/edituser';
    print('Json being Sent :: \n' + editUserJson.toString());
    print('\nSent Json datatype :: ' + editUserJson.runtimeType.toString());
    try {
      final _authController = Get.find<AuthController>();
      final token = _authController.getToken();

      var headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      };
      final Dio dio = Dio();
      dio.options.headers = headers;
      var response = await dio.post(
        editUserUrl, 
        data: json.encode(editUserJson)
      );

      if (response.statusCode == 200) {
        PrintLog.printLog(
            fileName: 'Update Profile Details Service File',
            functionName: 'callEditUserApi(){}',
            blockNumber: 1,
            printStatement: 'Everything OK !!\n');
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
          printStatement: error.message
          );
    }
  }
}
