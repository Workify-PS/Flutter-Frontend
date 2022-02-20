import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:workify/controllers/AuthController.dart';
import 'package:workify/exceptions/print_log.dart';
import 'package:workify/models/EmployeeDetailsModel.dart';
import 'package:workify/models/EmployeeInfoModel.dart';

class ProfileService {
  static Future<Map<String, dynamic>> callProfileApi() async {
    String profileUrl = 'http://localhost:8080/workify/v1/profile';
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
            fileName: 'Profile Api Service File',
            functionName: 'callProfileApi(){}',
            blockNumber: 1,
            printStatement: 'Everything OK !!');
      } else {
        PrintLog.printLog(
          fileName: 'Profile Api Service File',
          functionName: 'callProfileApi(){}',
          blockNumber: 2,
          printStatement: 'Status Code :: ' + response.statusCode.toString(),
        );
      }
    } on DioError catch (error) {
      PrintLog.printLog(
          fileName: 'Profile Api Service File',
          functionName: 'callProfileApi(){}',
          blockNumber: 3,
          printStatement: 'Error :: ' + error.message.toString(),
      );
    }
    return responseData;
  }

  static Future<Map<String, dynamic>> callEmpDetailsApi() async {
    String profileUrl = 'http://localhost:8080/workify/v1/empdetails';
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
          fileName: 'Profile Api Service File',
          functionName: 'callEmpDetails(){}',
          blockNumber: 1,
          printStatement: 'Everything OK !!',
        );
      } else {
        PrintLog.printLog(
          fileName: 'Profile Api Service File',
          functionName: 'callEmpDetails(){}',
          blockNumber: 2,
          printStatement: 'Status Code :\n' + response.statusCode.toString(),
        );
      }
    } on DioError catch (error) {
      PrintLog.printLog(
          fileName: 'Profile Api Service File',
          functionName: 'callEmpDetails(){}',
          blockNumber: 3,
          printStatement: 'Error :: '+error.message.toString(),
      );
    }
    return responseData;
  }

  static Future<EmployeeInfoModel> fetchProfileDetails() async {
    Map<String, dynamic> profileApiResponse = await callProfileApi();
    var data = EmployeeInfoModel.fromJson(profileApiResponse);
    PrintLog.printLog(
          fileName: 'Profile Api Service File',
          functionName: 'fetchProfileDetails(){}',
          blockNumber: 1,
          printStatement: 'Profile Api Response :\n' + profileApiResponse.toString(),
    );
    return data;
  }

  static Future<EmployeeDetailsModel> fetchEmployeeDetails() async {
    Map<String, dynamic> empDetailsApiResponse = await callEmpDetailsApi();
    var data = EmployeeDetailsModel.fromJson(empDetailsApiResponse);
    PrintLog.printLog(
          fileName: 'Profile Api Service File',
          functionName: 'fetchEmployeeDetails(){}',
          blockNumber: 1,
          printStatement: 'EmployeeDetails Api Response :\n' + empDetailsApiResponse.toString(),
    );
    return data;
  }
}
