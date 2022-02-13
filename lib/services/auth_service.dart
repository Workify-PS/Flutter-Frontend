
import 'package:get/get_connect.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:workify/models/UserModel.dart';

class AuthService extends GetConnect {
  
  final String authUrl = "http://localhost:8080/authenticate";
  final String registerUrl = "http://localhost:8080/register";
  Future<String?> loginService(String username, String pass) async {
    final response = await post(authUrl, {"username": username, "password": pass});
    
    if (response.statusCode == HttpStatus.ok) {
      
      return response.body['token'];
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
