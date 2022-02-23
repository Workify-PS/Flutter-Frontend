import 'package:workify/exceptions/print_log.dart';
import 'package:workify/mixins/cache.dart';

import 'package:get/get.dart';
import 'package:workify/models/EmployeeInfoCombined.dart';
import 'package:workify/services/fetch_all_employee_service.dart';

class FetchAllEmployeesController extends GetxController with CacheManager {
  var isLoading = true.obs;
  // List<FetchAllEmployees>? allEmployeeList = [];
  static List<EmployeeInfoCombined> allEmployeeList = [];

  @override
  void onInit() {
    super.onInit();
    callFetchAllEmployeesDetails();
  }

  void callFetchAllEmployeesDetails() async {
    try {
      isLoading(true);
      try {
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
            allEmployeeList.add(data);
            print('Designation in controller : '+data.designation.toString());
            print('\n');
            print(employee.toString() + '\n');
          }
        }
      } catch (error) {
        PrintLog.printLog(
          fileName: 'Fetch All Employees Controller file',
          functionName: 'callFetchAllEmployeesDetails(){}',
          blockNumber: 1,
          printStatement: 'Error :: ' + error.toString(),
        );
      }
    } finally {
      isLoading(false);
    }
  }
}
