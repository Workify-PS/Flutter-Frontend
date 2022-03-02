import 'package:get/get.dart';
import 'package:workify/exceptions/print_log.dart';
import 'package:workify/models/LeavePage/YourBalanceLeaves.dart';
import 'package:workify/services/LeavePage/your_leave_balance_service.dart';

class YourBalanceLeavesController extends GetxController {
  var isLoading = true.obs;
  static YourBalanceLeaves? yourBalanceLeavesData;

  @override
  void onInit() {
    super.onInit();
    callFetchLeaveBalance();
  }

  void callFetchLeaveBalance() async {
    try {
      isLoading(true);
      try {
        var data = await YourLeaveBalanceService.fetchLeaveBalance();
        if (data != null) {
          yourBalanceLeavesData = YourBalanceLeaves.fromJson(data);
          PrintLog.printLog(
              fileName: 'Your Balance Leaves Controller',
              functionName: 'call Fetch Leave Balance',
              blockNumber: 1,
              printStatement: 'Data Received Successfully !!' 
                + yourBalanceLeavesData.toString());
        }
      } catch (error) {
        PrintLog.printLog(
            fileName: 'Your Balance Leaves Controller',
            functionName: 'call Fetch Leave Balance',
            blockNumber: 1,
            printStatement: 'Error : ' + error.toString());
      }
    } finally {
      isLoading(false);
    }
  }
}
