import 'package:get/get.dart';
import 'package:workify/exceptions/print_log.dart';
import 'package:workify/models/LeavePage/LeaveStatusModel.dart';
import 'package:workify/services/LeavePage/your_leave_status_service.dart';

class LeaveStatusController extends GetxController {
  var isLoading = true.obs;
  static List<LeaveStatusModel> leaveBalanceList = [];

  @override
  void onInit() {
    super.onInit();
    leaveBalanceList.clear();
    fetchLeaveStatus();
  }

  void fetchLeaveStatus() async {
    try {
      isLoading(true);
      try {
        var data = await YourLeaveStatusService.fetchLeaveStatus();
        if (data != null) {
          for (var datum in data) {
            datum = LeaveStatusModel.fromJson(datum);
            leaveBalanceList.add(datum);
          }

          PrintLog.printLog(
              fileName: 'Leave Status Controller File',
              functionName: 'fetchLeaveStatus',
              blockNumber: 1,
              printStatement: 'Data Received Successfully ! : Length :: ' +
                  leaveBalanceList.length.toString());
        }
      } catch (error) {
        PrintLog.printLog(
          fileName: 'Leave Status Controller File',
          functionName: 'fetchLeaveStatus',
          blockNumber: 2,
          printStatement: 'Error : ' + error.toString());
      }
    } finally {
      isLoading(false);
    }
  }
}
