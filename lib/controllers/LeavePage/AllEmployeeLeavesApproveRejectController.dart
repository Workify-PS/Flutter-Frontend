import 'package:get/get.dart';
import 'package:workify/exceptions/print_log.dart';
import 'package:workify/services/LeavePage/all_employee_leaves_approveReject_service.dart';

class AllEmployeeLeavesApproveRejcectController extends GetxController {
  void callCallApproveApi({leaveInfoId,context}) async {
    try {
      var data = {'leaveId' : leaveInfoId};
      await AllEmployeLeavesApproveRejectService.callApproveApi(data,context);
    } catch (error) {
      PrintLog.printLog(
          fileName: 'All Employee Leaves Approve Reject COntroller',
          functionName: 'call Call Approve Api',
          blockNumber: 1,
          printStatement: 'Error : ' + error.toString());
    }
  }

  void callCallRejectApi({leaveInfoId,context}) async{
    try {
      var data = {'leaveId' : leaveInfoId};
      await AllEmployeLeavesApproveRejectService.callRejectApi(data,context);
    } catch (error) {
      PrintLog.printLog(
          fileName: 'All Employee Leaves Approve Reject COntroller',
          functionName: 'call Call Approve Api',
          blockNumber: 1,
          printStatement: 'Error : ' + error.toString());
    }
  }
}
