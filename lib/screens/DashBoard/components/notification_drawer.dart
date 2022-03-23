import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:workify/components/button.dart';
import 'package:workify/controllers/LeavePage/AllEmployeeLeavesApproveRejectController.dart';
import 'package:workify/controllers/LeavePage/AllEmployeeLeavesController.dart';
import 'package:workify/routes/router.dart';
import 'package:workify/screens/HomePage/HomePageController.dart';
import 'package:workify/screens/LeavePage/AllEmployeeLeaves.dart';
import 'package:workify/utils/constants.dart';
import 'package:workify/utils/theme.dart';

class NotificationDrawer extends StatefulWidget {
  const NotificationDrawer({Key? key}) : super(key: key);

  @override
  State<NotificationDrawer> createState() => _NotificationDrawerState();
}

class _NotificationDrawerState extends State<NotificationDrawer> {
  get bannerHeight => null;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        height: double.infinity,
        color: Theme.of(context).primaryColor,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: bannerHeight,
                margin: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                width: double.infinity,
                color: Theme.of(context).primaryColor,
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding / 1.5),
                      child: Icon(
                        Icons.notifications_on_rounded,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    Text(
                      "Notifications",
                      style: Theme.of(context).primaryTextTheme.headline5,
                    ),
                  ],
                ),
              ),
              SizedBox(height: kDefaultPadding),
              LeaveRelated(),
            ],
          ),
        ),
      ),
    );
  }
}

class LeaveRelated extends StatelessWidget {
  LeaveRelated({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    final allEmployeeLeavesController = Get.find<AllEmployeeLeavesController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8, left: kDefaultPadding),
          child: Text(
            'Leave Request(s)',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        if (allEmployeeLeavesController.leaveList.isNotEmpty)
          Column(
              children: List.generate(
                  allEmployeeLeavesController.leaveList.length,
                  (index) => EmployeeLeaveResponse(index: index)))
        else
          Padding(
            padding: const EdgeInsets.only(left: 18),
            child: Text('No leave requests till now.'),
          )
      ],
    );
  }
}

class EmployeeLeaveResponse extends StatelessWidget {
  final index;
  EmployeeLeaveResponse({Key? key, required this.index}) : super(key: key);
  var userName, leaveType, startDate, endDate, noOfDays;

  @override
  Widget build(BuildContext context) {
    final allEmployeeLeavesController = Get.find<AllEmployeeLeavesController>();
    final allEmployeeLeavesApproveRejcectController =
        Get.find<AllEmployeeLeavesApproveRejcectController>();

    void onPressedApproveButton() {
      allEmployeeLeavesApproveRejcectController.callCallApproveApi(
          leaveInfoId: allEmployeeLeavesController.leaveList[index].leaveInfoId,
          context: context);

      allEmployeeLeavesController.leaveList.removeAt(index);
    }

    void onPressedRejectButton() {
      allEmployeeLeavesApproveRejcectController.callCallRejectApi(
          leaveInfoId: allEmployeeLeavesController.leaveList[index].leaveInfoId,
          context: context);
      allEmployeeLeavesController.leaveList.removeAt(index);
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Obx(() {
              userName = allEmployeeLeavesController.leaveList[index].userName;
              leaveType =
                  allEmployeeLeavesController.leaveList[index].leaveType;
              startDate =
                  allEmployeeLeavesController.leaveList[index].startDate;
              endDate = allEmployeeLeavesController.leaveList[index].endDate;

              var tempStartDate = DateTime.parse(startDate);
              var tempEndDate = DateTime.parse(endDate);
              var to = DateTime(
                  tempEndDate.year, tempEndDate.month, tempEndDate.day);
              var from = DateTime(
                  tempStartDate.year, tempStartDate.month, tempStartDate.day);
              noOfDays = to.difference(from).inDays + 1;

              if (allEmployeeLeavesController.isLoading.value) {
                return Text('Loading');
              } else {
                return SizedBox(
                  width: 100,
                  child: FittedBox(fit: BoxFit.fitWidth, child: Text(userName)),
                );
              }
            }),
            PrimaryButton(
                buttonTextWidget: Text('Respond'),
                primaryColor: Colors.amber,
                onPressed: () {
                  // Get.find<HomePageController>()
                  //     .gotoPage(Routes.allEmployeeLeaves, context);
                  Get.defaultDialog(
                    title: userName,
                    barrierDismissible: false,
                    radius: 8,
                    backgroundColor: MyTheme().isDark(context) ? Colors.grey.shade900:Colors.grey.shade200,
                    content: SizedBox(
                      width: 320,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Leave Type',
                                    style: TextStyle(
                                      // color: MyTheme().isDark(context) ? kTextDarkColor : kTextColor,
                                    ),
                                  ),
                                  Text('No. of days'),
                                  Text('Start Date'),
                                  Text('End Date'),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 32),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(leaveType.toString()),
                                    Text(noOfDays.toString()),
                                    Text(startDate),
                                    Text(endDate),
                                    
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: PrimaryButton(
                                    primaryColor: Colors.red,
                                    buttonTextWidget: Text('Get back'),
                                    onPressed: () {
                                      Get.back();
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 100,
                                  child: PrimaryButton(
                                    primaryColor: Colors.red,
                                    buttonTextWidget: Text('Reject'),
                                    onPressed: () {
                                      onPressedRejectButton();
                                    },
                                  ),
                                ),

                                SizedBox(
                                  width: 100,
                                  child: PrimaryButton(
                                      primaryColor: Colors.green,
                                      buttonTextWidget: Text('Approve'),
                                      onPressed: () {
                                        onPressedApproveButton();
                                      }),
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ],
        ),
        Divider(
          endIndent: kDefaultPadding/2,
          indent: kDefaultPadding/2,
          color: MyTheme().isDark(context)?kDividerDarkColor:kDividerColor,
        )
      ],
    );
  }
}
