import 'package:get/get_connect.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:workify/models/UserModel.dart';

class LoginService extends GetConnect {
  final String authUrl = "http://localhost:8081/authenticate";
  final String registerUrl = "http://localhost:8081/register";

  Future<String?> fetchLogin(String username, String pass) async {
    final response =
        await post(authUrl, {"username": username, "password": pass});

    if (response.statusCode == HttpStatus.ok) {
      return response.body['token'];
    } else {
      return null;
    }
  }

  Future<String?> fetchRegister(UserModel model) async {
    final response = await post(registerUrl, model.toJson());

    if (response.statusCode == HttpStatus.ok) {
      return response.bodyString;
      ;
    } else {
      return null;
    }
  }
}
