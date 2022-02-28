import 'package:get/get.dart';
import 'package:workify/exceptions/print_log.dart';
import 'package:workify/models/LeavePage/AllEmployeeLeavesModel.dart';
import 'package:workify/services/LeavePage/get_leave_service.dart';

class AllEmployeeLeavesController extends GetxController {
  var isLoading = true.obs;
  static List<AllEmployeeLeavesModel> leaveList = [];
  @override
  void onInit() {
    super.onInit();
    leaveList.clear();
    callFetchAllLeaves();
  }

  void callFetchAllLeaves() async {
    try {
      isLoading(true);
      try {
        var data = await FetchLeaveService.fetchAllLeaves();
        if (data != null) {
          for (var datum in data) {
            datum = AllEmployeeLeavesModel.fromJson(datum);
            leaveList.add(datum);
          }
          PrintLog.printLog(
              fileName: 'AllEmployeeLeavesController',
              functionName: 'callFetchAllLeaves',
              blockNumber: 1,
              printStatement: 'Data Received Successfully !');
        }
      } catch (error) {
        PrintLog.printLog(
            fileName: 'AllEmployeeLeavesController',
            functionName: 'callFetchAllLeaves',
            blockNumber: 2,
            printStatement: 'Error : ' + error.toString());
      }
    } finally {
      isLoading(false);
    }
  }
}
