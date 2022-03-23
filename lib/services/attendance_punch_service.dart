import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:workify/controllers/UserController.dart';
import 'package:workify/mixins/cache.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:workify/models/DailyAttendanceModel.dart';
import 'package:workify/utils/constants.dart';

class AttendancePunchService extends GetConnect with CacheManager {
  Future<DailyAttendanceModel?> getPunchInfo() async {
    try {
      var headers = {
        'Authorization': 'Bearer ${getToken()}',
        'Content-Type': 'application/json'
      };
      var request = http.Request(
          'GET', Uri.parse('http://$ip:$port/workify/v1/attendance/getpunch'));
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var res = jsonDecode(await response.stream.bytesToString());
        var daily = DailyAttendanceModel();
        String iN = res[0]['PunchIn'].toString();
        String out = res[0]['PunchOut'].toString();
        if (iN == "null" && out == "null") {
          return null;
        } else if (iN != "null" && out == "null") {
          daily.inTime = iN.substring(0, 5);
          
          return daily;
        } else if (iN != "null" && out != "null") {
          daily.inTime = iN.substring(0, 5);
          daily.outTime.add(out.substring(0, 5));
          return daily;
        }
      } else {
        print(response.reasonPhrase);
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> punchInService() async {
    var headers = {
      'Authorization': 'Bearer ${getToken()}',
      'Content-Type': 'application/json'
    };
    var request = http.Request(
        'POST', Uri.parse('http://$ip:$port/workify/v1/attendance/punchin'));
    final user = Get.find<UserController>().currentUser!.value;
    final time = DateFormat("HH:mm:ss").format(DateTime.now());
    request.body = json.encode({
      "userId": user.userID,
      "empcode": user.empCode,
      "location Info": "Abcd",
      "actualIn": time,
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
      throw Exception(response.reasonPhrase);
    }
  }

  Future<void> punchOutService() async {
    var headers = {
      'Authorization': 'Bearer ${getToken()}',
      'Content-Type': 'application/json'
    };
    var request = http.Request(
        'POST', Uri.parse('http://$ip:$port/workify/v1/attendance/punchout'));
    final user = Get.find<UserController>().currentUser!.value;
    final time = DateFormat("HH:mm:ss").format(DateTime.now());
    request.body = json.encode({
      "userId": user.userID,
      "empcode": user.empCode,
      "actualOut": time,
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
      throw Exception(response.reasonPhrase);
    }
  }
}
