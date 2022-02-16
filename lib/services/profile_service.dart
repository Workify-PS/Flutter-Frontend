import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:workify/controllers/AuthController.dart';
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
        print(
            '\n--In Profile Api Service File :: callProfileApi(){} : Block 1\n');
        print('Everything OK !!');
        print('------------- End Block 1 ----------------');
      } else {
        print(
            '\n--In Profile Api Service File :: callProfileApi(){} : Block 2\n');
        print('Status Code :\n' + response.statusCode.toString());
        print('------------- End Block 2 ----------------');
      }
    } on DioError catch (error) {
      print(
          '\n-- In Profile Api Service File :: callProfileApi(){} : Block 3\n');
      print(error.message);
      print('------------- End Block 3 ----------------\n');
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
        print(
            '\n--In Profile Api Service File :: callEmpDetails(){} : Block 1\n');
        print('Everything OK !!');
        print('------------- End Block 1 ----------------');
      } else {
        print(
            '\n--In Profile Api Service File :: callEmpDetails(){} : Block 2\n');
        print('Status Code :\n' + response.statusCode.toString());
        print('------------- End Block 2 ----------------');
      }
    } on DioError catch (error) {
      print(
          '\n-- In Profile Api Service File :: callEmpDetails(){} : Block 3\n');
      print(error.message);
      print('------------- End Block 3 ----------------\n');
    }
    return responseData;
  }

  static Future<EmployeeInfoModel> fetchProfileDetails() async {
    Map<String, dynamic> profileApiResponse = await callProfileApi();
    var data = EmployeeInfoModel.fromJson(profileApiResponse);

    print(
        '\n-- In Profile Api Service File :: fetchProfileDetails(){} : Block 1\n');
    print('Profile Api Response :\n' + profileApiResponse.toString());
    print('------------- End Block 1 ----------------\n');
    return data;
  }


  static Future<EmployeeDetailsModel> fetchEmployeeDetails() async {
    Map<String, dynamic> empDetailsApiResponse = await callEmpDetailsApi();
    var data = EmployeeDetailsModel.fromJson(empDetailsApiResponse);

    print(
        '\n-- In Profile Api Service File :: fetchProfileDetails(){} : Block 1\n');
    print('Profile Api Response :\n' + empDetailsApiResponse.toString());
    print('------------- End Block 1 ----------------\n');
    return data;

  }
}
