import 'package:get/get.dart';
import 'package:workify/exceptions/print_log.dart';
import 'package:workify/models/LeavePage/LeaveRequestModel.dart';
import 'package:workify/services/LeavePage/apply_leave_service.dart';

class ApplyLeaveController extends GetxController {
  void onClickApplyLeaveButton(
      {userId,
      empCode,
      orgId,
      startDate,
      endDate,
      leaveType,
      leaveReason}) async {
    try {
      if (userId != null &&
          empCode != null &&
          orgId != null &&
          startDate != null &&
          endDate != null &&
          leaveType != null &&
          leaveReason != null) {
        var data = LeaveRequestModel().toJson(
            userId: userId,
            empCode: empCode,
            orgId: orgId,
            startDate: startDate,
            endDate: endDate,
            leaveType: leaveType,
            leaveReason: leaveReason);
        PrintLog.printLog(
            fileName: 'applyLeaveController',
            functionName: 'onClickLeaveButton',
            blockNumber: 1,
            printStatement: data);
        await ApplyLeaveService.callApplyLeaveApi(data);
      } else {
        Get.defaultDialog(
          title: 'All fields are required!',
          middleText: 'Please choose dates and leave type, leave reason (Optional)'
        );
        PrintLog.printLog(
          fileName: 'applyLeaveController',
          functionName: 'onClickApplyLeaveButton',
          blockNumber: 2,
          printStatement: 'Found some data to be null',
        );
      }
    } catch (error) {
      PrintLog.printLog(
        fileName: 'applyLeaveController',
        functionName: 'onClickApplyLeaveButton',
        blockNumber: 3,
        printStatement: error,
      );
    }
  }
}
