import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workify/components/button.dart';
import 'package:workify/controllers/LeavePage/AllEmployeeLeavesController.dart';
// import 'package:workify/controllers/fetch_all_employees_controller.dart';
import 'package:workify/utils/sizes.dart';

double screenWidth = 0, screenHeight = 0;

class AllEmployeeLeaves extends StatelessWidget {
  const AllEmployeeLeaves({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DeviceSize device = DeviceSize();
    device.size = MediaQuery.of(context).size;
    screenWidth = device.size.width;
    screenHeight = device.size.height;

    final allEmployeeLeavesController = Get.find<AllEmployeeLeavesController>();

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
          child: Material(
            elevation: 20,
            // color: Colors.black,
            color: Colors.transparent,
            child: SizedBox(
              width: screenWidth,
              child: Obx(() {
                if (allEmployeeLeavesController.isLoading.value) {
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
                                // Expanded(
                                //   flex: 1,
                                //   child: SizedBox(),
                                // ),
                                Expanded(flex: 3, child: Text('Employee [Name : Code]')),
                                Expanded(
                                  flex: 3,
                                  child: Text('Leave Type'),
                                ),
                                Expanded(flex: 3, child: Text('Start Date')),
                                Expanded(flex: 3, child: Text('End Date')),
                                Expanded(
                                  flex: 2,
                                  child: SizedBox(),
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
                                AllEmployeeLeavesController.leaveList.length,
                                (index) => EmployeeLeave(index: index))),
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

class EmployeeLeave extends StatelessWidget {
  final int index;
  const EmployeeLeave({
    Key? key,
    required this.index,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final allEmployeeLeavesController = Get.find<AllEmployeeLeavesController>();

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
                  // Expanded(
                  //   flex: 1,
                  //   child: LeaveApproveCheckbox(),
                  // ),
                  Expanded(
                    flex: 3,
                    child: Obx(() {
                      if (allEmployeeLeavesController.isLoading.value) {
                        return Text('Still Loading Employee Leaves Data');
                      } else {
                        return Text(
                          AllEmployeeLeavesController.leaveList
                            .elementAt(index)
                            .userName
                            .toString()
                            +' : '
                            + AllEmployeeLeavesController.leaveList
                            .elementAt(index)
                            .empCode
                            .toString()
                            
                        );
                      }
                    }),
                  ),
                  Expanded(
                    flex: 3,
                    child: Obx(() {
                      if (allEmployeeLeavesController.isLoading.value) {
                        return Text('Still Loading Employee Leaves Data');
                      } else {
                        return Text(AllEmployeeLeavesController.leaveList
                            .elementAt(index)
                            .leaveType
                            .toString());
                      }
                    }),
                  ),
                  Expanded(
                    flex: 3,
                    child: Obx(() {
                      if (allEmployeeLeavesController.isLoading.value) {
                        return Text('Still Loading Employee Leaves Data');
                      } else {
                        return Text(AllEmployeeLeavesController.leaveList
                            .elementAt(index)
                            .startDate
                            .toString());
                      }
                    }),
                  ),
                  Expanded(
                    flex: 3,
                    child: Obx(() {
                      if (allEmployeeLeavesController.isLoading.value) {
                        return Text('Still Loading Employee Leaves Data');
                      } else {
                        return Text(AllEmployeeLeavesController.leaveList
                            .elementAt(index)
                            .endDate
                            .toString());
                      }
                    }),
                  ),
                  Expanded(
                    flex: 2,
                    child: Obx(() {
                      if (allEmployeeLeavesController.isLoading.value) {
                        return Text('Still Loading Employee Leaves Data');
                      } else {
                        return PrimaryButton(
                          buttonTextWidget: Text('Approve'),
                          onPressed: () {},
                        );
                      }
                    }),
                  ),
                  Expanded(
                    flex: 1,
                    child: Obx(() {
                      if (allEmployeeLeavesController.isLoading.value) {
                        return Text('Still Loading Employee Leaves Data');
                      } else {
                        return PrimaryButton(
                          buttonTextWidget: Text('Reject'),
                          onPressed: () {},
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

// class Avatar extends StatelessWidget {
//   const Avatar({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       shape: CircleBorder(),
//       clipBehavior: Clip.hardEdge,
//       color: Colors.transparent,
//       child: InkWell(
//         onTap: () {
//           // print('\n\n\n Will change avatar Later \n\n\n');
//         },
//         child: Ink.image(
//           image: AssetImage('images/avatar.png'),
//           fit: BoxFit.contain,
//           // width: portrait == true ? screenWidth * 0.2 : screenWidth * 0.25,
//           // height: portrait == true ? screenHeight * 0.2 : screenHeight * 0.25,
//         ),
//       ),
//     );
//   }
// }

// class LeaveApproveCheckbox extends StatefulWidget {
//   const LeaveApproveCheckbox({Key? key}) : super(key: key);

//   @override
//   _LeaveApproveCheckboxState createState() => _LeaveApproveCheckboxState();
// }

// class _LeaveApproveCheckboxState extends State<LeaveApproveCheckbox> {
//   bool checked = false;
//   void checkCheckBox(bool? newValue) {
//     setState(() {
//       checked = newValue!;
//     });
//   }
  

//   @override
//   Widget build(BuildContext context) {
  
//   return Checkbox(
//       value: checked,
//       onChanged:checkCheckBox,
      
//     );
//   }
// }
