import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:workify/mixins/cache.dart';
import 'package:workify/models/attendanceShiftModel.dart';

class AttendanceShiftGetService extends GetConnect with CacheManager {
  final String attlistURL =
      "http://localhost:8080/workify/attendance/attendancelist";

  Future<List<AttendanceShiftModel>?> getAttendanceShiftList() async {
    final token = getToken();
    var headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    final response = await get(attlistURL, headers: headers);
    if (response.statusCode == HttpStatus.ok) {
      List<dynamic> attlist = response.body;
      //return ann.map((e) => WishModel.fromJson(e)).toList();
    } else {
      return null;
    }
  }
}
