import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:workify/screens/AuthPage/AuthController.dart';
import 'package:workify/controllers/profile_details_controller.dart';
import 'package:workify/exceptions/print_log.dart';
import 'package:workify/utils/constants.dart';

class ModifyEmployeeProfileDetailsService {
  static Future<void> callEditUserApi(Map<String, dynamic> editUserJson) async {
    String editUserUrl = 'http://$ip:$port/workify/v1/edituser';
    try {
      final _authController = Get.find<AuthController>();
      final token = _authController.getToken();
      final profileDetailsController = Get.find<ProfileDetailsController>();

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
            printStatement:
                'Response Status Code :\n' + response.statusCode.toString());
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
