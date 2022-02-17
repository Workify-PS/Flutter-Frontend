// import 'dart:convert';
// import 'dart:io';

// import 'package:flutter/services.dart';
// import 'package:get/get.dart';

// import 'package:get/get_connect.dart';
// import 'package:get/get_connect/http/src/status/http_status.dart';
// import 'package:workify/models/HolidayModel.dart';

// class HolidayGetService {
//   Future<List<HolidayModel>> getHolidays() async {
//     final List<HolidayModel> holidays = [];
//     final String response =
//         await rootBundle.loadString('assets/dummy_data/holiday.json');
//     final Map<String, dynamic> data = await jsonDecode(response);
//     print(data);
//     data.forEach((key, value) {
//       final holidaymodel = HolidayModel(
//           date: value["date"], holidayName: key, imagePath: value["image"]);
//       holidays.add(holidaymodel);
//     });
//     return holidays;
//   }
// }
