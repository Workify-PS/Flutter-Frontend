import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:workify/controllers/AuthController.dart';
import 'package:workify/models/ProfileModel.dart';

class ProfileApiService {
  // static String? authenticateToken;

  static void callAuthenticateApi() async {
    String authenticateUrl = 'http://localhost:8080/authenticate';
    final Dio dio = Dio();
    try {
      var headers = {'Content-Type': 'application/json'};
      dio.options.headers = headers;
      var userCredentials = {"username": "kingOfMirzapur", "password": "#1234"};
      var response = await dio.post(authenticateUrl, data: userCredentials);

      if (response.statusCode == 200) {
        print(
            '\n--In Profile Api Service File :: callAuthenticateApi(){} : Block 1\n');
        print('Everything OK :' + response.statusCode.toString());
        print('Auth Token : \n' + response.data['token']);
        print('------------- End Block 1 ----------------');
      } else {
        print(
            '\n--In Profile Api Service File :: callAuthenticateApi(){} : Block 2\n');
        print('Status Code :\n' + response.statusCode.toString());
        print('------------- End Block 2 ----------------');
      }
    } on DioError catch (error) {
      print(
          '\n-- In Profile Api Service File :: callAuthenticateApi(){} : Block 3\n');
      print(error.message);
      print('------------- End Block 3 ----------------\n');
    }
  }

  static Future<Map<String, dynamic>> callProfileApi() async {
    String profileUrl = 'http://localhost:8080/profile';
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
        print('Everything OK !! \n' + response.data.toString());
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

  static Future<ProfileModel> fetchProfileDetails() async {
    // callAuthenticateApi(); //token Generated at 16:34 till 2:15
    Map<String, dynamic> profileApiResponse = await callProfileApi();
    var data = ProfileModel.fromJson(profileApiResponse);

    print(
        '\n-- In Profile Api Service File :: fetchProfileDetails(){} : Block 1\n');
    print('Profile Api Response :\n' + profileApiResponse.toString());
    print('------------- End Block 1 ----------------\n');
    return data;
  }
}
