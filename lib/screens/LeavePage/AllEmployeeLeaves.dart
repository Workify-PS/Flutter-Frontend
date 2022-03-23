import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:workify/components/button.dart';
import 'package:workify/controllers/LeavePage/AllEmployeeLeavesApproveRejectController.dart';
import 'package:workify/controllers/LeavePage/AllEmployeeLeavesController.dart';
import 'package:workify/utils/constants.dart';
import 'package:workify/utils/generators.dart';
import 'package:workify/utils/sizes.dart';

double screenWidth = 0, screenHeight = 0;
bool portrait = false;

class AllEmployeeLeaves extends GetView<AllEmployeeLeavesController> {
  const AllEmployeeLeaves({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DeviceSize device = DeviceSize();
    device.size = MediaQuery.of(context).size;
    screenWidth = device.size.width;
    screenHeight = device.size.height;

    portrait = screenWidth < 1000;

    //final allEmployeeLeavesController = Get.find<AllEmployeeLeavesController>();

    return Scaffold(
      appBar: generateTopBar(title: 'All Employee Leaves'),
      body: Center(
        child: Container(
          width: device.size.width / 1.1,
          height: device.size.height / 1.1,
          margin: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding, vertical: kDefaultPadding * 1.5),
          child: Material(
            elevation: 20,
            // color: Colors.black,
            color: Theme.of(context).scaffoldBackgroundColor,
            child: SizedBox(
              width: screenWidth,
              child: Obx(() {
                if (controller.isLoading.value) {
                  return Center(child: Text('Still Loading Data'));
                } else {
                  if (controller.leaveList.isEmpty) {
                    return Center(child: Text('No Records Found !'));
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                      flex: 3,
                                      child: Text('Employee [Name : Code]')),
                                  if (portrait)
                                    SizedBox(
                                      width: 10,
                                    ),
                                  Expanded(
                                    flex: 3,
                                    child: Text('Leave Type'),
                                  ),
                                  if (portrait)
                                    SizedBox(
                                      width: 10,
                                    ),
                                  Expanded(flex: 3, child: Text('Start Date')),
                                  if (portrait)
                                    SizedBox(
                                      width: 10,
                                    ),
                                  Expanded(flex: 3, child: Text('End Date')),
                                  SizedBox(
                                    width: 100,
                                  ),
                                  SizedBox(
                                    width: 100,
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
                                  controller.leaveList.length,
                                  (index) => EmployeeLeave(index: index))),
                        ],
                      ),
                    );
                  }
                }
              }),
            ),
          ),
        ),
      ),
    );
  }
}

class EmployeeLeave extends GetView<AllEmployeeLeavesController> {
  final int index;
  const EmployeeLeave({
    Key? key,
    required this.index,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final allEmployeeLeavesController = Get.find<AllEmployeeLeavesController>();
    final allEmployeeLeavesApproveRejcectController =
        Get.put(AllEmployeeLeavesApproveRejcectController());

    void onPressedApproveButton() {
      allEmployeeLeavesApproveRejcectController.callCallApproveApi(
          leaveInfoId: controller.leaveList[index].leaveInfoId);
    }

    void onPressedRejectButton() {
      allEmployeeLeavesApproveRejcectController.callCallRejectApi(
          leaveInfoId: controller.leaveList[index].leaveInfoId);
    }

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
                    flex: 3,
                    child: Obx(() {
                      if (allEmployeeLeavesController.isLoading.value) {
                        return Text('Still Loading Employee Leaves Data');
                      } else {
                        return Text(controller.leaveList
                                .elementAt(index)
                                .userName
                                .toString() +
                            ' : ' +
                            controller.leaveList
                                .elementAt(index)
                                .empCode
                                .toString());
                      }
                    }),
                  ),
                  if (portrait)
                    SizedBox(
                      width: 5,
                    ),
                  Expanded(
                    flex: 3,
                    child: Obx(() {
                      if (allEmployeeLeavesController.isLoading.value) {
                        return Text('Still Loading Employee Leaves Data');
                      } else {
                        return Text(controller.leaveList
                            .elementAt(index)
                            .leaveType
                            .toString());
                      }
                    }),
                  ),
                  if (portrait)
                    SizedBox(
                      width: 5,
                    ),
                  Expanded(
                    flex: 3,
                    child: Obx(() {
                      if (allEmployeeLeavesController.isLoading.value) {
                        return Text('Still Loading Employee Leaves Data');
                      } else {
                        return Text(DateFormat.yMMMMd('en_US').format(
                            DateTime.parse(controller.leaveList
                                .elementAt(index)
                                .startDate
                                .toString())));
                      }
                    }),
                  ),
                  if (portrait)
                    SizedBox(
                      width: 5,
                    ),
                  Expanded(
                    flex: 3,
                    child: Obx(() {
                      if (allEmployeeLeavesController.isLoading.value) {
                        return Text('Still Loading Employee Leaves Data');
                      } else {
                        // return Text(AllEmployeeLeavesController.leaveList
                        //     .elementAt(index)
                        //     .endDate
                        //     .toString());
                        return Text(DateFormat.yMMMMd('en_US').format(
                            DateTime.parse(controller.leaveList
                                .elementAt(index)
                                .endDate
                                .toString())));
                      }
                    }),
                  ),
                  if (portrait)
                    SizedBox(
                      width: 5,
                    ),
                  Obx(() {
                    if (allEmployeeLeavesController.isLoading.value) {
                      return Text('Still Loading Employee Leaves Data');
                    } else {
                      return SizedBox(
                        width: 100,
                        child: PrimaryButton(
                          primaryColor: Colors.green,
                          buttonTextWidget: Text('Approve'),
                          onPressed: onPressedApproveButton,
                        ),
                      );
                    }
                  }),
                  SizedBox(
                    width: 5,
                  ),
                  Obx(() {
                    if (allEmployeeLeavesController.isLoading.value) {
                      return Text('Still Loading Employee Leaves Data');
                    } else {
                      return SizedBox(
                        width: 100,
                        child: PrimaryButton(
                          primaryColor: Colors.red,
                          buttonTextWidget: Text('Reject'),
                          onPressed: onPressedRejectButton,
                        ),
                      );
                    }
                  }),
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
