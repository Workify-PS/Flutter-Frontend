// import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:workify/models/ProfileModel.dart';

class ProfileApiService {
  static void callAuthenticateApi() async {
    String authenticateUrl = 'http://localhost:8080/authenticate';
    final Dio dio = Dio();
    try {
      var headers = {'Content-Type': 'application/json'};
      dio.options.headers = headers;
      var userCredentials = {'username': 'kingOfMirzapur', 'password': '#1234'};
      var response = await dio.post(authenticateUrl, data: userCredentials);

      if (response.statusCode == 200) {
        print(response.data);
      } else {
        print(
            '\n--In Profile Api Service File :: callAuthenticateApi(){} : Block 1\n');
        print('Status Code :\n' + response.statusCode.toString());
        print('------------- End Block 1 ----------------');
      }
    } on DioError catch (error) {
      print(
          '\n-- In Profile Api Service File :: callAuthenticateApi(){} : Block 2\n');
      print(error.message);
      print('------------- End Block 2 ----------------\n');
    }
  }

  static Future<Map<String, dynamic>> callProfileApi() async {
    String profileUrl = 'http://localhost:8080/profile';
    // ignore: prefer_typing_uninitialized_variables
    var responseData;
    try {
      var headers = {
        'Authorization':
            'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJraW5nT2ZNaXJ6YXB1ciIsImlzQWRtaW4iOnRydWUsImV4cCI6MTY0NDY4NzgwMSwiaWF0IjoxNjQ0NjY5ODAxfQ.BRltAyc2Sdq8b_ugGPeiqLrbk6nwAjaWCml_QOYvEWMyCd65S15pr4Y0NA1PY4lSwpKecYQWPEAx1WbKvY3dEQ',
        'Content-Type': 'application/json'
      };
      final Dio dio = Dio();
      dio.options.headers = headers;
      var response = await dio.post(
        profileUrl,
      );
      if (response.statusCode == 200) {
        responseData = response.data;
      } else {
        print(
            '\n--In Profile Api Service File :: callProfileApi(){} : Block 1\n');
        print('Status Code :\n' + response.statusCode.toString());
        print('------------- End Block 1 ----------------');
      }
    } on DioError catch (error) {
      print(
          '\n-- In Profile Api Service File :: callProfileApi(){} : Block 2\n');
      print(error.message);
      print('------------- End Block 2 ----------------\n');
    }
    return responseData;
  }

  static Future<ProfileModel> fetchProfileDetails() async {
    // callAuthenticateApi(); //token Generated at 16:34 till 21:34
    Map<String, dynamic> profileApiResponse = await callProfileApi();
    var data = ProfileModel.fromJson(profileApiResponse);
    
    print(
        '\n-- In Profile Api Service File :: fetchProfileDetails(){} : Block 1\n');
    print('Profile Api Response :\n'+profileApiResponse.toString());
    print('------------- End Block 1 ----------------\n');
    return data;
  }
}
