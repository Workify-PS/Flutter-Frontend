import 'package:get/get_connect.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:workify/exceptions/BadCredentials.dart';
import 'package:workify/models/UserModel.dart';

class AuthService extends GetConnect {
  final String authUrl = "http://localhost:8080/workify/v1/login/authenticate";
  final String registerUrl = "http://localhost:8080/wokify/v1/login/register";
  Future<String?> loginService({required String username,required String password}) async {
    final response =
        await post(authUrl, {"username": username, "password": password});

    if (response.statusCode == HttpStatus.ok) {
      return response.body['token'];
    } else if (response.statusCode == HttpStatus.unauthorized) {
      throw BadCredentials();
    } else {
      print("ERROR + ${response.statusText}");
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
