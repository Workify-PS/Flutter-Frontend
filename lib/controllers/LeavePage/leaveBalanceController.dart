import 'package:get/get.dart';
import 'package:workify/exceptions/print_log.dart';
import 'package:workify/models/LeavePage/LeaveBalanceModel.dart';
import 'package:workify/services/LeavePage/your_leave_balance_service.dart';

class LeaveBalanceController extends GetxController {
  var isLoading = true.obs;
  static List<LeaveBalanceModel> leaveBalanceList = [];

  @override
  void onInit() {
    super.onInit();
    leaveBalanceList.clear();
    fetchLeaveBalance();
  }

  void fetchLeaveBalance() async {
    try {
      isLoading(true);
      try {
        var data = await YourLeaveBalanceService.callYourLeavesApi();
        if (data != null) {
          for (var datum in data) {
            datum = LeaveBalanceModel.fromJson(datum);
            leaveBalanceList.add(datum);
          }

          PrintLog.printLog(
              fileName: 'Leave Balance Controller File',
              functionName: 'fetchLeaveBalance',
              blockNumber: 1,
              printStatement: 'Data Received Successfully ! : Length :: ' +
                  leaveBalanceList.length.toString());
        }
      } catch (error) {
        PrintLog.printLog(
            fileName: 'Leave Balance Controller File',
            functionName: 'fetchLeaveBalance',
            blockNumber: 2,
            printStatement: 'Error : ' + error.toString());
      }
    } finally {
      isLoading(false);
    }
  }
}
