import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:workify/screens/AuthPage/AuthController.dart';
import 'package:workify/exceptions/print_log.dart';
import 'package:workify/models/EmployeeInfoCombined.dart';
import 'package:workify/utils/constants.dart';

class ProfileService {
  static Future<dynamic> callProfileApi() async {
    String profileUrl = 'http://$ip:$port/workify/v1/profile';
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
        PrintLog.printLog(
            fileName: 'Profile Service File',
            functionName: 'callProfileApi(){}',
            blockNumber: 1,
            printStatement: 'Everything OK !!\n' +
                response.data.toString() +
                '\nDataType :: \n' +
                response.data.runtimeType.toString());
      } else {
        PrintLog.printLog(
          fileName: 'Profile Service File',
          functionName: 'callProfileApi(){}',
          blockNumber: 2,
          printStatement: 'Status Code :: ' + response.statusCode.toString(),
        );
      }
    } on DioError catch (error) {
      PrintLog.printLog(
        fileName: 'Profile Service File',
        functionName: 'callProfileApi(){}',
        blockNumber: 3,
        printStatement: 'Error :: ' + error.message.toString(),
      );
    }
    return responseData;
  }

  static Future<dynamic> fetchProfileDetails() async {
    var profileApiResponse = await callProfileApi();
    var data = EmployeeInfoCombined.fromJson(profileApiResponse);
    PrintLog.printLog(
        fileName: 'Profile Service File',
        functionName: 'fetchProfileDetails(){}',
        blockNumber: 1,
        printStatement: 'Profile Api Response :\n' +
            profileApiResponse.runtimeType.toString());
    return data;
  }
}
