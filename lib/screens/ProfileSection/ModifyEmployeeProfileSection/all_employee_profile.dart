import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workify/components/button.dart';
import 'package:workify/controllers/fetch_all_employees_controller.dart';
import 'package:workify/utils/sizes.dart';

double screenWidth = 0, screenHeight = 0;
// var fetchAllEmployeesController;

class AllEmployeeProfile extends StatelessWidget {
  AllEmployeeProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DeviceSize device = DeviceSize();
    device.size = MediaQuery.of(context).size;
    screenWidth = device.size.width;
    screenHeight = device.size.height;

    // fetchAllEmployeesController = Get.find<FetchAllEmployeesController>();
    final fetchAllEmployeesController = Get.put(FetchAllEmployeesController());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All Employee',
        ),
      ),
      body: Center(
        child: Container(
          width: device.size.width / 1.1,
          height: device.size.height / 1.1,
          decoration: BoxDecoration(
            color: Colors.transparent,
            // color: Colors.red,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Material(
            elevation: 20,
            color: Colors.transparent,
            child: SizedBox(
              width: screenWidth,
              child: Obx(() {
                if (fetchAllEmployeesController.isLoading.value) {
                  return Text('Still Loading Data');
                } else {
                  return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                          FetchAllEmployeesController.allEmployeeList.length,
                          (index) => EmployeeProfile(index: index)));
                }
              }),
            ),
          ),
        ),
      ),
    );
  }
}

class EmployeeProfile extends StatelessWidget {
  final int index;
  EmployeeProfile({
    Key? key,
    required this.index,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // fetchAllEmployeesController = Get.find<FetchAllEmployeesController>();
    final fetchAllEmployeesController = Get.put(FetchAllEmployeesController());

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Obx(() {
          if (fetchAllEmployeesController.isLoading.value) {
            return Text('Still Loading Data in Employee Profile');
          } else {
            return Text('Employee Name : ' +
                FetchAllEmployeesController.allEmployeeList
                    .elementAt(index)
                    .fullName
                    .toString());
          }
        }),
        Obx(() {
          if (fetchAllEmployeesController.isLoading.value) {
            return Text('Still Loading Data in Employee Profile');
          } else {
            return Text('Employee Code : ' +
                FetchAllEmployeesController.allEmployeeList
                    .elementAt(index)
                    .empCode
                    .toString());
          }
        }),
        Obx(() {
          if (fetchAllEmployeesController.isLoading.value) {
            return Text('Still Loading Data in Employee Profile');
          } else {
            return Button(
              buttonTextWidget: Text('Modify Details'),
              onPressed: () {
                Get.toNamed(
                  "/modify-employee-profile",
                  arguments: 
                  [index]  
                );
              },
            );
          }
        }),
      ],
    );
  }
}
