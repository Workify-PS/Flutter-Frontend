import 'package:date_time_format/src/date_time_extension_methods.dart';
import 'package:get/get.dart';
import 'package:workify/models/DailyAttendanceModel.dart';
import 'package:workify/services/attendance_punch_service.dart';

class AttendanceCardController extends GetxController {
  RxBool isPunchedIn = false.obs;
  RxBool isPunchedOut = false.obs;
  final daily = DailyAttendanceModel().obs;
  final attendanceService = AttendancePunchService();
  void punchIn() {
    isPunchedIn.value = true;
    isPunchedOut.value = false;
    daily.value.inTime = DateTime.now().format('H:i');
    attendanceService.punchInService().catchError((error) {
      print("PUNCH IN ERROR: $error");
      isPunchedIn.value = false;
      daily.value.inTime = "--:--";
    }).whenComplete(() => print("PUNCH IN SUCCESSFULL"));
  }

  void punchOut() {
    isPunchedIn.value = true;
    isPunchedOut.value = true;
    daily.value.outTime.add(DateTime.now().format('H:i'));
    attendanceService.punchOutService().catchError((error) {
      print("PUNCH OUT ERROR: $error");
      daily.value.outTime.removeLast();
    }).whenComplete(() => print("PUNCH OUT SUCCESSFULL"));
  }
}
