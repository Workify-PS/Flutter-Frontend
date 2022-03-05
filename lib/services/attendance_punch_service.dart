import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:workify/mixins/cache.dart';

class AttendancePunchService extends GetConnect with CacheManager {
  final String punchInUrl = "http://localhost:8080/workify/v1/wish/birthday";
  final String punchOutUrl =
      "http://localhost:8080/workify/v1/wish/anniversary";

  Future<void> punchInService() async {
    final token = getToken();
    var headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    final response = await get(punchInUrl, headers: headers);
    if (response.statusCode == HttpStatus.ok) {
      return;
    } else {
      throw Error();
    }
  }

  Future<void> punchOutService() async {
    final token = getToken();
    var headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    final response = await get(punchOutUrl, headers: headers);
    if (response.statusCode == HttpStatus.ok) {
      return  ;
    } else {
      throw Error();
    }
  }
}
