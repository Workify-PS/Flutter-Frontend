import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:workify/screens/AuthPage/AuthController.dart';
import 'package:workify/exceptions/print_log.dart';
import 'package:workify/utils/constants.dart';

class YourLeaveBalanceService {
  static Future<dynamic> callYourBalanceLeavesApi() async {
    String yourBalanceLeavesUrl =
        'http://$ip:$port/workify/v1/leave/yourbalanceleaves';
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
        yourBalanceLeavesUrl,
      );
      if (response.statusCode == 200) {
        responseData = response.data;
        PrintLog.printLog(
            fileName: 'your_leave_balance_service File',
            functionName: 'callYourBalanceLeavesApi(){}',
            blockNumber: 1,
            printStatement: 'Everything OK !!\n' +
                response.data.toString() +
                '\nDataType :: \n' +
                response.data.runtimeType.toString());
      } else {
        PrintLog.printLog(
          fileName: 'your_leave_balance_service File',
          functionName: 'callYourBalanceLeavesApi(){}',
          blockNumber: 2,
          printStatement: 'Status Code :: ' + response.statusCode.toString(),
        );
      }
    } on DioError catch (error) {
      PrintLog.printLog(
        fileName: 'your_leave_balance_service File',
        functionName: 'callYourBalanceLeavesApi(){}',
        blockNumber: 3,
        printStatement: 'Error :: ' + error.message.toString(),
      );
    }
    return responseData;
  }

  static Future<dynamic> fetchLeaveBalance() async {
    var yourBalanceLeavesApiResponse = await callYourBalanceLeavesApi();
    PrintLog.printLog(
        fileName: 'your_leave_balance_service File',
        functionName: 'callYourBalanceLeavesApi(){}',
        blockNumber: 1,
        printStatement: 'yourLeaves Api Response :\n' +
            yourBalanceLeavesApiResponse.runtimeType.toString());
    return yourBalanceLeavesApiResponse;
  }
}
