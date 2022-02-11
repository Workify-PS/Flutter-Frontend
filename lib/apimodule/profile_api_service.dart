import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:workify/models/ProfileModel.dart';

class ProfileApiService {
  static Future<ProfileModel> profileDetails() async {
    String url = 'http://localhost:8080/profile';
    var headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJBamF5IiwiaXNBZG1pbiI6dHJ1ZSwiZXhwIjoxNjQ0NTk4NTEwLCJpYXQiOjE2NDQ1ODA1MTB9.zZgG0oiz12TI4KPxDPsv42IvMK7uQwG-TCjz5LXlsCNuybmAvuQhXyQfQa2VQFangkHp9StUuGdtu141W-M8XA',
      'Content-Type': 'application/json'
    };
    late ProfileModel profileData;
    final Dio dio = Dio();
    try {
      dio.options.headers = headers;

      var response = await dio.post(url);

      var data = userProfileDataFromJson(response.data);
      // profileData = response.data;
      // print('\nStatus Code : ' + response.statusCode.toString());
      profileData = data;
      print('\n\n In Profile Api Service File :: Block 1 ');
      print('-----------------------------');
      print(data.runtimeType);
      print(profileData.runtimeType);
      print('\n\nProfile Details ->\n' + profileData.username);
      print(profileData.city);
      print(profileData.state);
      print(profileData.country);
      // print('\nProfile Details ::\n' + profileData['username']);
      // print(profileData['city']);
      // print(profileData['state']);
      // print(profileData['country']);
      print('-----------------------------');
      print('\n');

      if (response.statusCode == 200) {
        print('In Profile Api Service File :: Block 2 : Status Code 200 Message');
        print('-----------------------------');
        print('Everything OK !!');
        print('-----------------------------');
      } else {
        print(response.statusCode);
      }
    } on DioError catch (error) {
      print("\n In Profile Api Service File :: Block 3 : DioError Catch Block");
      print('-----------------------------');
      print(error.message);
      print('-----------------------------');
      print('\n');
    }

    return profileData;
  }
}
