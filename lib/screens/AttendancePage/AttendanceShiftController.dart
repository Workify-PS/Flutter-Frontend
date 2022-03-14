import 'package:get/get.dart';
import 'package:workify/models/AttendanceShiftModel.dart';
import 'package:workify/services/attendance_list_service.dart';

class AttendanceShiftController extends GetxController {
  RxList<AttendanceShiftModel> attendanceshiftList =
      <AttendanceShiftModel>[].obs;

  @override
  void onInit() async {
    print("Initialized for Attendance Shift Controller");
    getAllShifts();

    super.onInit();
  }

  Future<void> getAllShifts() async {
    final attShiftGetService = AttendanceShiftGetService();
    final attendanceshifts = await attShiftGetService.getAttendanceShiftList();
    if (attendanceshifts != null) {
      attendanceshiftList.addAll(attendanceshifts);
    }
  }
}
