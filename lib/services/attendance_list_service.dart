import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:workify/mixins/cache.dart';
import 'package:workify/models/AttendanceShiftModel.dart';
import 'package:http/http.dart' as http;
import 'package:workify/utils/constants.dart';

class AttendanceShiftGetService extends GetConnect with CacheManager {
  final String attlistURL =
      "http://$ip:8080/$port/attendance/attendancelist";

  Future<List<AttendanceShiftModel>?> getAttendanceShiftList() async {
    final token = getToken();
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.Request(
        'POST',
        Uri.parse(
            'http://$ip:$port/workify/v1/attendance/attendancelist'));
    request.body = '''''';
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      List<dynamic> attlist = jsonDecode(await response.stream.bytesToString());
      //print(attlist);
      return attlist.map((e) => AttendanceShiftModel.fromJson(e)).toList();
    } else {
      //print(response.reasonPhrase);
      return null;
    }
  }
}
