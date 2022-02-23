import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:workify/controllers/AuthController.dart';
import 'package:workify/exceptions/print_log.dart';
import 'dart:convert';


class FetchAllEmployeeService {
  static Future<dynamic> callAllEmployeesApi() async {
    String profileUrl = 'http://localhost:8080/workify/v1/allemployees';
    // ignore: prefer_typing_uninitialized_variables
    var responseData;

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
        profileUrl,
      );
      if (response.statusCode == 200) {
        responseData = response.data;
        PrintLog.printLog(
            fileName: 'Fetch All Employee Service File',
            functionName: 'callAllEmployeesApi(){}',
            blockNumber: 1,
            printStatement: 'Everything OK !!\n' +
                response.data.toString() +
                '\nDataType :: ' +
                response.data.runtimeType.toString());
      } else {
        PrintLog.printLog(
          fileName: 'Fetch All Employee Service File',
          functionName: 'callAllEmployeesApi(){}',
          blockNumber: 2,
          printStatement: 'Status Code :: ' + response.statusCode.toString(),
        );
      }
    } on DioError catch (error) {
      PrintLog.printLog(
        fileName: 'Fetch All Employee Service File',
        functionName: 'callAllEmployeesApi(){}',
        blockNumber: 3,
        printStatement: 'Error :: ' + error.message.toString(),
      );
    }
    return responseData;
  }

  static Future<List> fetchAllEmployeesDetails() async {
    var data = await callAllEmployeesApi();
    PrintLog.printLog(
        fileName: 'Fetch All Employee Service File',
        functionName: 'fetchAllEmployeesDetails(){}',
        blockNumber: 1,
        printStatement:
            'AllEmployees Api Response : ' + data.runtimeType.toString());
    return data;
  }
}