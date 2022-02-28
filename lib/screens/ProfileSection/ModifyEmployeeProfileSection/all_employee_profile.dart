import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workify/components/button.dart';
import 'package:workify/controllers/fetch_all_employees_controller.dart';
import 'package:workify/routes/router.dart';
import 'package:workify/screens/HomePage/HomePageController.dart';
import 'package:workify/utils/generators.dart';
import 'package:workify/utils/sizes.dart';

double screenWidth = 0, screenHeight = 0;

class AllEmployeeProfile extends StatelessWidget {
  const AllEmployeeProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DeviceSize device = DeviceSize();
    device.size = MediaQuery.of(context).size;
    screenWidth = device.size.width;
    screenHeight = device.size.height;

    final fetchAllEmployeesController = Get.find<FetchAllEmployeesController>();

    return Scaffold(
      appBar:generateTopBar(title: "All Employees"),
      body: Center(
        child: Container(
          width: device.size.width / 1.1,
          height: device.size.height / 1.1,
          child: Material(
            elevation: 20,
            // color: Colors.black,
            color: Colors.transparent,
            child: SizedBox(
              width: screenWidth,
              child: Obx(() {
                if (fetchAllEmployeesController.isLoading.value) {
                  return Text('Still Loading Data');
                } else {
                  return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 70,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(),
                                ),
                                Expanded(
                                    flex: 3,
                                    child: Text('Employee [ Name : Code ]')),
                                Expanded(
                                  flex: 3,
                                  child: Text('Designation'),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 3,
                          color: Colors.grey,
                        ),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                                FetchAllEmployeesController
                                    .allEmployeeList.length,
                                (index) => EmployeeProfile(index: index))),
                      ],
                    ),
                  );
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
  const EmployeeProfile({
    Key? key,
    required this.index,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final fetchAllEmployeesController = Get.find<FetchAllEmployeesController>();

    return SizedBox(
      height: 70,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              flex: 9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Avatar(),
                  ),
                  Expanded(
                    flex: 3,
                    child: Obx(() {
                      if (fetchAllEmployeesController.isLoading.value) {
                        return Text('Still Loading Data in Employee Profile');
                      } else {
                        return Text(FetchAllEmployeesController.allEmployeeList
                                .elementAt(index)
                                .fullName
                                .toString() +
                            ' : ' +
                            FetchAllEmployeesController.allEmployeeList
                                .elementAt(index)
                                .empCode
                                .toString());
                      }
                    }),
                  ),
                  Expanded(
                    flex: 3,
                    child: Obx(() {
                      if (fetchAllEmployeesController.isLoading.value) {
                        return Text('Still Loading Data in Employee Profile');
                      } else {
                        return Text(FetchAllEmployeesController.allEmployeeList
                            .elementAt(index)
                            .designation
                            .toString());
                      }
                    }),
                  ),
                  Expanded(
                    flex: 1,
                    child: Obx(() {
                      if (fetchAllEmployeesController.isLoading.value) {
                        return Text('Still Loading Data in Employee Profile');
                      } else {
                        return PrimaryButton(
                          buttonTextWidget: Text('Modify Details'),
                          onPressed: () {
                            Get.find<HomePageController>().gotoPage(
                                Routes.modifyEmployeeProfile, context);
                          },
                        );
                      }
                    }),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Container(
                height: 1,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Avatar extends StatelessWidget {
  const Avatar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      shape: CircleBorder(),
      clipBehavior: Clip.hardEdge,
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          // print('\n\n\n Will change avatar Later \n\n\n');
        },
        child: Ink.image(
          image: AssetImage('images/avatar.png'),
          fit: BoxFit.contain,
          // width: portrait == true ? screenWidth * 0.2 : screenWidth * 0.25,
          // height: portrait == true ? screenHeight * 0.2 : screenHeight * 0.25,
        ),
      ),
    );
  }
}
