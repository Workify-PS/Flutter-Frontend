import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:workify/controllers/UserController.dart';
import 'package:workify/mixins/cache.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:workify/utils/constants.dart';

class AttendancePunchService extends GetConnect with CacheManager {

  Future<void> punchInService() async {
    var headers = {
      'Authorization': 'Bearer ${getToken()}',
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST',
        Uri.parse('http://$ip:$port/workify/v1/attendance/punchin'));
    final user = Get.find<UserController>().currentUser!.value;
    final time = DateFormat("HH:mm:ss").format(DateTime.now());
    request.body = json.encode({
      "userId": user.userID,
      "empcode": user.empCode,
      "location Info": "Abcd",
      "actualIn": time,
      "creationDate": "2022-02-21",
      "modifiedDate": "",
      "createdBy": 123,
      "modifiedBy": 345
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
    var request = http.Request('POST',
        Uri.parse('http://$ip:$port/workify/v1/attendance/punchout'));
    final user = Get.find<UserController>().currentUser!.value;
    final time = DateFormat("HH:mm:ss").format(DateTime.now());
    request.body = json.encode({
      "userId": user.userID,
      "empcode": user.empCode,
      "location Info": "Abcd",
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
