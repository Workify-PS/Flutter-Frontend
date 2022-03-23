import 'package:workify/controllers/UserController.dart';
import 'package:workify/controllers/profile_details_controller.dart';
import 'package:workify/exceptions/print_log.dart';

import 'package:get/get.dart';
import 'package:workify/mixins/cache.dart';
import 'package:workify/models/EmployeeInfoCombined.dart';
import 'package:workify/services/fetch_all_employee_service.dart';

class FetchAllEmployeesController extends GetxController with CacheManager {
  var isLoading = true.obs;

   RxList<EmployeeInfoCombined> allEmployeeList = <EmployeeInfoCombined>[].obs;

  @override
  void onInit() {
    super.onInit();
    callFetchAllEmployeesDetails();
  }

  @override
  void onClose() {
    super.onClose();
    allEmployeeList.clear();
  }

  void callFetchAllEmployeesDetails() async {
    try {
      isLoading(true);
      try {
        final user = Get.find<UserController>().currentUser!.value;
        print("NAME IS ${user.firstName}");
        var listOfEmployee =
            await FetchAllEmployeeService.fetchAllEmployeesDetails();
        if (listOfEmployee != null) {
          for (var employee in listOfEmployee) {
            var data = EmployeeInfoCombined.fromJson(employee);
            
            if (data.grade == '-1') {
              data.grade = 'Need to update.';
            }
            if (data.designation == '-1') {
              data.designation = 'Need to update.';
            }
            if (data.jobPosition == '-1') {
              data.jobPosition = 'Need to update.';
            }
            if (data.workLocation == '-1') {
              data.workLocation = 'Need to update.';
            }
            if (data.employementCategory == '-1') {
              data.employementCategory = 'Need to update.';
            }
            if (data.employementStatus == '-1') {
              data.employementStatus= 'Need to update.';
            }
            if (data.employementType == '-1') {
              data.employementType = 'Need to update.';
            }

            // Insert logged in user at 0 index in list
            if (user.empCode == data.empCode) {
              allEmployeeList.insert(0, data);
            } else {
              allEmployeeList.add(data);
            }
            // allEmployeeList.forEach((element) {
            //   print(element.firstName);
            // });
            // print(employee.toString() + '\n');

            PrintLog.printLog(
                fileName: 'fetch_all_employees_controller',
                functionName: 'callFetchAllEmployeesDetails(){}',
                blockNumber: 1,
                printStatement: 'List of Employees Received\n' +
                    'Data type : ' +
                    listOfEmployee.runtimeType.toString());
          }
        }
      } catch (error) {
        PrintLog.printLog(
          fileName: 'Fetch All Employees Controller file',
          functionName: 'callFetchAllEmployeesDetails(){}',
          blockNumber: 2,
          printStatement: 'Error :: ' + error.toString(),
        );
      }
    } finally {
      isLoading(false);
    }
  }
}
