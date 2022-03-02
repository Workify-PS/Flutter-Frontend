import 'package:workify/controllers/UserController.dart';
import 'package:workify/controllers/profile_details_controller.dart';
import 'package:workify/exceptions/print_log.dart';

import 'package:get/get.dart';
import 'package:workify/mixins/cache.dart';
import 'package:workify/models/EmployeeInfoCombined.dart';
import 'package:workify/services/fetch_all_employee_service.dart';

class FetchAllEmployeesController extends GetxController with CacheManager {
  var isLoading = true.obs;
  var user;
  static List<EmployeeInfoCombined> allEmployeeList = [];

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
        user = getUser();
        var listOfEmployee =
            await FetchAllEmployeeService.fetchAllEmployeesDetails();
        if (listOfEmployee != null) {
          PrintLog.printLog(
              fileName: 'fetch_all_employees_controller',
              functionName: 'callFetchAllEmployeesDetails(){}',
              blockNumber: 1,
              printStatement: 'List of Employees Received\n' +
                  'Data type : ' +
                  listOfEmployee.runtimeType.toString());

          for (var employee in listOfEmployee) {
            var data = EmployeeInfoCombined.fromJson(employee);

            // Insert logged in user at 0 index in list
            if (user != null && user.empCode == data.empCode) {
              allEmployeeList.insert(0, data);
            } else {
              allEmployeeList.add(data);
            }
            print(employee.toString() + '\n');
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
