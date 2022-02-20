import 'package:get/get_connect.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:workify/exceptions/BadCredentials.dart';
import 'package:workify/models/UserModel.dart';

class AuthService extends GetConnect {
  final String authUrl = "http://localhost:8080/workify/v1/login/authenticate";
  final String registerUrl = "http://localhost:8080/wokify/v1/login/register";
  Future<String?> loginService(
      {required String username, required String password}) async {
    var response;
    try {
      response =
          await post(authUrl, {"username": username, "password": password});

      if (response.statusCode == HttpStatus.ok) {
        print('\n-- In auth_service file :: loginService(){} : Block 1\n');
        print('logged In Successfully :: with Token :\n'+response.body['token']);
        print('-------------- End Block 1 ---------------');
      } else {
        print('\n-- In auth_service file :: loginService(){} : Block 2\n');
        print("ERROR + ${response.statusText}");
        print('-------------- End Block 2 ---------------');
        throw BadCredentials();
      }
    } catch (error) {
      print('\n-- In auth_service file :: loginService(){} : Block 3\n');
      print('Error :: ' + error.toString());
      print('-------------- End Block 3 ---------------');
    }
    return response.body['token'];
  }

  Future<String?> registerService(UserModel model) async {
    var response;
    try {
      response = await post(registerUrl, model.toJson());

      if (response.statusCode == HttpStatus.ok) {
        print('\n-- In auth_service file :: loginService(){} : Block 1\n');
        print(response.bodyString);
        print('-------------- End Block 1 ---------------');
      } else {
        print('\n-- In auth_service file :: loginService(){} : Block 2\n');
        print("ERROR + ${response.statusText}");
        print('-------------- End Block 2 ---------------');
        return null;
      }
    } catch (error) {
      print('\n-- In auth_service file :: loginService(){} : Block 3\n');
      print('Error :: ' + error.toString());
      print('-------------- End Block 3 ---------------');
    }
    return response.bodyString;
  }
}
