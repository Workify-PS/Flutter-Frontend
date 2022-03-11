import 'package:get/get.dart';

import 'package:get/get_connect.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:workify/models/UserModel.dart';
import 'package:workify/utils/constants.dart';

class UserGetService extends GetConnect {
  final String userGetURL = "http://$ip:$port/workify/v1/hellouser";
  Future<UserModel?> userGetService(String token) async {
    var headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    final response = await post(userGetURL, {}, headers: headers);

    if (response.statusCode == HttpStatus.ok) {
      return UserModel.fromJson(response.body);
    } else {
      return null;
    }
  }
}
