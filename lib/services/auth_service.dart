
import 'package:get/get_connect.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:workify/models/UserModel.dart';

class AuthService extends GetConnect {
  final String o = "http://localhost:8080/authenticate";
  final String authUrl = "http://localhost:8080/workify/v1/login/authenticate";
  final String registerUrl = "http://localhost:8080/workify/v1/login/register";
  Future<String?> loginService(String username, String pass) async {
    final response = await post(o, {"username": username, "password": pass});
    print("AUTHo " + response.statusText!);
    if (response.statusCode == HttpStatus.ok) {
      return response.body['token'];
    } else {
      return null;
    }
  }

  Future<String?> registerService(UserModel model) async {
    final response = await post(registerUrl, model.toJson());

    if (response.statusCode == HttpStatus.ok) {
      return response.bodyString;
    } else {
      return null;
    }
  }

 
}
