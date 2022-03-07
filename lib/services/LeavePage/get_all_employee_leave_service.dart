import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:workify/screens/AuthPage/AuthController.dart';
import 'package:workify/exceptions/print_log.dart';
import 'package:workify/utils/constants.dart';

class FetchLeaveService {
  static Future<dynamic> callgetLeavesApi() async {
    String leaveUrl = 'http://$ip:$port/workify/v1/leave/getleaves';
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
        leaveUrl,
      );
      if (response.statusCode == 200) {
        responseData = response.data;
        PrintLog.printLog(
            fileName: 'Fetch Leave  Service File',
            functionName: 'callgetLeavesApi(){}',
            blockNumber: 1,
            printStatement: 'Everything OK !!\n' +
                response.data.toString() +
                '\nDataType :: ' +
                response.data.runtimeType.toString());
      } else {
        PrintLog.printLog(
          fileName: 'Fetch Leave  Service File',
          functionName: 'callgetLeavesApi(){}',
          blockNumber: 2,
          printStatement: 'Status Code :: ' + response.statusCode.toString(),
        );
      }
    } on DioError catch (error) {
      PrintLog.printLog(
        fileName: 'Fetch Leave  Service File',
        functionName: 'callgetLeavesApi(){}',
        blockNumber: 3,
        printStatement: 'Error :: ' + error.message.toString(),
      );
    }
    return responseData;
  }

  static Future<dynamic> fetchAllLeaves() async {
    var data = await callgetLeavesApi();
    PrintLog.printLog(
        fileName: 'Get Leave File',
        functionName: 'fetchAllLeaves(){}',
        blockNumber: 1,
        printStatement: 'GetLeaves Api Response : ' +
            data.runtimeType.toString() +
            '\nData :\n' +
            data.toString());
    return data;
  }
}
