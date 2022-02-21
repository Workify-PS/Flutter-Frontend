import 'package:dio/dio.dart';
import 'package:workify/exceptions/print_log.dart';

class UpdateProfileDetailsService {
  void callEditUserApi() {
    String editUserUrl = 'localhost:8080/workify/v1/edituser';
    try {
      final dio = Dio();
      var response = dio.post(
        editUserUrl,
      );
    } on DioError catch (error) {
      PrintLog.printLog(
          fileName: 'update_profile_details_service',
          functionName: 'callEditUserApi',
          blockNumber: 3,
          printStatement: error.toString());
    }
  }
}
