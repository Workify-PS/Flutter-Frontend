import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:workify/screens/AuthPage/AuthController.dart';
import 'package:workify/exceptions/print_log.dart';
import 'package:workify/utils/constants.dart';

class LeavePageService {
  static Future<dynamic> callAttendanceListApi() async {
    String attendanceListUrl =
        'http://$ip:$port/workify/v1/attendance/attendancelist';
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
        attendanceListUrl,
      );
      if (response.statusCode == 200) {
        responseData = response.data;
        PrintLog.printLog(
            fileName: 'Leave Page SeviceFile',
            functionName: 'callAttendanceListApi(){}',
            blockNumber: 1,
            printStatement: 'Everything OK !!\n' +
                response.data.toString() +
                '\nDataType :: \n' +
                response.data.runtimeType.toString());
      } else {
        PrintLog.printLog(
          fileName: 'Leave Page SeviceFile',
          functionName: 'callAttendanceListApi(){}',
          blockNumber: 2,
          printStatement: 'Status Code :: ' + response.statusCode.toString(),
        );
      }
    } on DioError catch (error) {
      PrintLog.printLog(
        fileName: 'Leave Page SeviceFile',
        functionName: 'callAttendanceListApi(){}',
        blockNumber: 3,
        printStatement: 'Error :: ' + error.message.toString(),
      );
    }
    return responseData;
  }

}
