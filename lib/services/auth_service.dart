import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_connect.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:workify/exceptions/BadCredentials.dart';
import 'package:workify/exceptions/print_log.dart';
import 'package:workify/models/UserModel.dart';
import 'package:workify/utils/constants.dart';

class AuthService extends GetConnect {
  final String authUrl = "http://$ip:$port/workify/v1/login/authenticate";
  final String registerUrl = "http://$ip:$port/wokify/v1/login/register";
  final String googleSignInUrl =
      "http://$ip:$port/workify/v1/login/authenticate-with-email";
  Future<String?> loginService(
      {String? username, String? password, String? email}) async {
    late Response response;
    if (email == null) {
      response =
          await post(authUrl, {"username": username, "password": password});
    } else {
      response = await post(googleSignInUrl, {"email": email});
    }

    if (response.statusCode == HttpStatus.ok) {
      return response.body['token'];
    } else {
      print(response.statusCode.toString() + " : " + response.statusText.toString());
      return null;
    }
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
            printStatement: response.bodyString);
      } else {
        PrintLog.printLog(
            fileName: 'auth_service',
            functionName: 'registerService',
            blockNumber: 2,
            printStatement: "ERROR + ${response.statusText}");
        return null;
      }
    } catch (error) {
      PrintLog.printLog(
          fileName: 'auth_service',
          functionName: 'registerService',
          blockNumber: 3,
          printStatement: 'Error :: ' + error.toString());
    }
    return response.bodyString;
  }
}
