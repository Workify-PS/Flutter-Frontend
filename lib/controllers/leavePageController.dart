// ignore_for_file: unused_local_variable

import 'package:get/get.dart';
import 'package:workify/exceptions/print_log.dart';
import 'package:workify/models/LeavePageAttendanceListModel.dart';
import 'package:workify/services/leave_page_service.dart';

class LeavePageController extends GetxController {
  var isLoading = true.obs;
  var date;
  var absent = false.obs;
  var index = '-1'.obs;
  List<LeavePageAttendaceListModel> attendanceList = [];

  @override
  void onInit() {
    super.onInit();
    attendanceList.clear();
    callLeavePageServiceAttendanceListApi();
  }

  void callLeavePageServiceAttendanceListApi() async {
    try {
      try {
        var data = await LeavePageService.callAttendanceListApi();
        if (data != null) {
          for (var datum in data) {
            // print('\nDatum : \n' + datum.toString());
            datum = LeavePageAttendaceListModel.fromJson(datum);
            attendanceList.add(datum);
          }
          findDateSpecificAttendanceList();
          PrintLog.printLog(
            fileName: 'leavePageController',
            functionName: 'callLeavePageServiceAttendanceListApi',
            blockNumber: 1,
            printStatement: 'Attendace List Received :\n' +
                data.toString() +
                'Date type : \n' +
                data.runtimeType.toString(),
          );
        }
      } catch (error) {
        PrintLog.printLog(
            fileName: 'leavePageController',
            functionName: 'callLeavePageServiceAttendanceListApi',
            blockNumber: 2,
            printStatement: 'Error : ' + error.toString());
      }
    } finally {
      isLoading(false);
    }
  }

  void findDateSpecificAttendanceList() {
    int found = 0;
    if (date != null) {
      for (int i = 0; i < attendanceList.length; i++) {
        if (attendanceList[i].date.toString() == date) {
          index(i.toString());
          absent(false);
          found = 1;
          break;
        }
      }
      if (found == 0) {
        index('-1');
        absent(true);
        PrintLog.printLog(
            fileName: 'leavePageController',
            functionName: 'callLeavePageServiceAttendanceListApi',
            blockNumber: 1,
            printStatement: '#Not Found in Database');
      }
    }
  }
}
