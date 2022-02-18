import 'package:get/get_connect.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:workify/exceptions/BadCredentials.dart';
import 'package:workify/exceptions/print_log.dart';
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
        PrintLog.printLog(
          fileName: 'auth_service',
          functionName: 'loginService',
          blockNumber: 1,
          printStatement: 'logged In Successfully :: with Token :\n' +
            response.body['token']
        );
      } else {
        PrintLog.printLog(
          fileName: 'auth_service',
          functionName: 'loginService',
          blockNumber: 2,
          printStatement: "ERROR : ${response.statusText}"
        );
        throw BadCredentials();
      }
    } catch (error) {
      PrintLog.printLog(
          fileName: 'auth_service',
          functionName: 'loginService',
          blockNumber: 3,
          printStatement: 'Error :: ' + error.toString()
        );
    }
    return response.body['token'];
  }

  Future<String?> registerService(UserModel model) async {
    var response;
    try {
      response = await post(registerUrl, model.toJson());

      if (response.statusCode == HttpStatus.ok) {
        PrintLog.printLog(
          fileName: 'auth_service',
          functionName: 'registerService',
          blockNumber: 1,
          printStatement: response.bodyString
        );
      } else {
        PrintLog.printLog(
          fileName: 'auth_service',
          functionName: 'registerService',
          blockNumber: 2,
          printStatement: "ERROR + ${response.statusText}"
        );
        return null;
      }
    } catch (error) {
      PrintLog.printLog(
          fileName: 'auth_service',
          functionName: 'registerService',
          blockNumber: 3,
          printStatement: 'Error :: ' + error.toString()
        );
    }
    return response.bodyString;
  }
}
