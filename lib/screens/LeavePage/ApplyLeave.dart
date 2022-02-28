import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

import 'package:workify/components/button.dart';
import 'package:workify/controllers/LeavePage/applyLeaveController.dart';
import 'package:workify/controllers/LeavePage/leaveBalanceController.dart';
import 'package:workify/controllers/profile_details_controller.dart';
import 'package:workify/screens/ProfileSection/ModifyEmployeeProfileSection/text_form_modify_profile_details.dart';
import 'package:workify/utils/sizes.dart';

double screenWidth = 0, screenHeight = 0;
bool portrait = false;
var startDate, endDate, leaveType, leaveReason;

class ApplyLeave extends StatelessWidget {
  const ApplyLeave({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DeviceSize device = DeviceSize();
    device.size = MediaQuery.of(context).size;
    screenWidth = device.size.width;
    screenHeight = device.size.height;

    portrait = screenWidth < 1000;
    final profileDetailsController = Get.find<ProfileDetailsController>();
    final applyLeaveController = Get.find<ApplyLeaveController>();
    final leaveBalanceController = Get.find<LeaveBalanceController>();

    void callonClickApplyLeaveButton() {
      applyLeaveController.onClickApplyLeaveButton(
          userId: profileDetailsController.employeeInfoModelDetails?.userId,
          empCode: profileDetailsController.employeeInfoModelDetails?.empCode
              .toString(),
          orgId: profileDetailsController.employeeInfoModelDetails?.orgId,
          startDate: startDate,
          endDate: endDate,
          leaveType: leaveType,
          leaveReason: leaveReason);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Apply Leave',
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
          child: portrait == false
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Leave Request',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 8,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                StartEndDates(),
                                LeaveTypeReason(),
                                PrimaryButton(
                                  buttonTextWidget: Text('Apply Leave'),
                                  onPressed: callonClickApplyLeaveButton,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Leave Status',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: LeaveStatusInfo(),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: LeaveStatusData(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : ApplyLeavePortraitView(),
        ),
      ),
    );
  }
}

class ApplyLeavePortraitView extends StatelessWidget {
  const ApplyLeavePortraitView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final profileDetailsController = Get.find<ProfileDetailsController>();
    final applyLeaveController = Get.find<ApplyLeaveController>();
    final leaveBalanceController = Get.find<LeaveBalanceController>();

    void callonClickApplyLeaveButton() {
      applyLeaveController.onClickApplyLeaveButton(
          userId: profileDetailsController.employeeInfoModelDetails?.userId,
          empCode: profileDetailsController.employeeInfoModelDetails?.empCode
              .toString(),
          orgId: profileDetailsController.employeeInfoModelDetails?.orgId,
          startDate: startDate,
          endDate: endDate,
          leaveType: leaveType,
          leaveReason: leaveReason);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  'Leave Request',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                flex: 8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    StartEndDates(),
                    LeaveTypeReason(),
                    PrimaryButton(
                      buttonTextWidget: Text('Apply Leave'),
                      onPressed: callonClickApplyLeaveButton,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Leave Status',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: LeaveStatusInfo(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: LeaveStatusData(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class LeaveTypeReason extends StatefulWidget {
  const LeaveTypeReason({Key? key}) : super(key: key);

  @override
  _LeaveTypeDropDownState createState() => _LeaveTypeDropDownState();
}

class _LeaveTypeDropDownState extends State<LeaveTypeReason> {
  var _leaveType = 'Anniversary';

  final _leaveReasonController = TextEditingController();

  final _leaveTypeList = [
    'Anniversary',
    'Birthday',
    'CL',
    'PL'
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 200,
          child: DropdownButton(
            value: _leaveType,
            items: _leaveTypeList.map((item) {
              return DropdownMenuItem(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: (selectedItem) {
              setState(() {
                _leaveType = selectedItem.toString();
                leaveType = _leaveType;
                _leaveReasonController.text = _leaveType;
                leaveReason = _leaveType;
              });
            },
          ),
        ),
        SizedBox(
          width: 200,
          child: TextFormModifyDetails(
            myFocusNode: FocusNode(),
            enabled: true,
            text: 'Please Specify Reason',
            keyBoardType: TextInputType.text,
            controller: _leaveReasonController,
          ),
        )
      ],
    );
  }
}

class StartEndDates extends StatefulWidget {
  const StartEndDates({Key? key}) : super(key: key);

  @override
  _StartEndDatesState createState() => _StartEndDatesState();
}

class _StartEndDatesState extends State<StartEndDates> {
  @override
  Widget build(BuildContext context) {
    void pickDate(var choice) {
      DatePicker.showDatePicker(context,
          theme: DatePickerTheme(
            backgroundColor: Colors.grey.shade200,
          ), onConfirm: (value) {
        var date = value.toString().split(' ');
        var onlyDate = date[0];
        setState(() {
          choice == 's' ? startDate = onlyDate : endDate = onlyDate;
        });
      });
    }

    void pickStartDate() {
      pickDate('s');
    }

    void pickEndDate() {
      pickDate('e');
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PrimaryButton(
                buttonTextWidget: Text('Start Date'),
                onPressed: pickStartDate,
              ),
              SizedBox(
                  width: 200,
                  child: Text(startDate != null
                      ? DateFormat.yMMMMd('en_US')
                          .format(DateTime.parse(startDate))
                      : '')),
            ],
          ),
        ),
        SizedBox(
          width: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PrimaryButton(
                buttonTextWidget: Text('End Date'),
                onPressed: pickEndDate,
              ),
              SizedBox(
                  width: 200,
                  child: Text(endDate != null
                      ? DateFormat.yMMMMd('en_US')
                          .format(DateTime.parse(endDate))
                      : '')),
            ],
          ),
        ),
      ],
    );
  }
}

class LeaveStatusInfo extends StatelessWidget {
  const LeaveStatusInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(width: portrait? 90:200, child: Text('Leave Type')),
            SizedBox(width: portrait? 90:200, child: Text('Start Date')),
            SizedBox(width: portrait? 90:200, child: Text('End Date')),
            SizedBox(width: portrait? 90:200, child: Text('Status')),
          ],
        ),
        Container(
          height: 3,
          color: Colors.grey,
        ),
      ],
    );
  }
}

class LeaveStatusData extends StatelessWidget {
  const LeaveStatusData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final leaveBalanceController = Get.find<LeaveBalanceController>();

    return Obx(() {
      if (leaveBalanceController.isLoading.value) {
        return Text('Data loading');
      } else {
        return Container(
          // color: Colors.red,
          color: Colors.transparent,
          height: portrait ? 150:200,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: List.generate(
                  LeaveBalanceController.leaveBalanceList.length,
                  (index) => LeaveStatusDataLoaded(idx: index)),
            ),
          ),
        );
      }
    });
  }
}

class LeaveStatusDataLoaded extends StatelessWidget {
  final idx;
  const LeaveStatusDataLoaded({
    Key? key,
    required this.idx,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final leaveBalanceController = Get.put(LeaveBalanceController());
    return Obx(() {
      if (leaveBalanceController.isLoading.value) {
        return Text('Data Loading');
      } else {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    width: portrait? 90:200,
                    child: Text(LeaveBalanceController
                        .leaveBalanceList[idx].leaveType
                        .toString())),
                SizedBox(
                    width: portrait? 90:200,
                    child: Text(LeaveBalanceController
                        .leaveBalanceList[idx].startDate
                        .toString())),
                SizedBox(
                    width: portrait? 90:200,
                    child: Text(LeaveBalanceController
                        .leaveBalanceList[idx].endDate
                        .toString())),
                SizedBox(
                    width: portrait? 90:200,
                    child: Text(LeaveBalanceController
                        .leaveBalanceList[idx].leaveStatus
                        .toString())),
              ],
            ),
            Container(
              height: 1,
              color: Colors.grey,
            ),
          ],
        );
      }
    });
  }
}

class PlLeave extends StatelessWidget {
  const PlLeave({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 200,
          child: Text('Paternity Leave'),
        ),
        SizedBox(width: 200, child: Text('Will Fetch')),
      ],
    );
  }
}

class ClLeave extends StatelessWidget {
  const ClLeave({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 200,
          child: Text('Casual Leave'),
        ),
        SizedBox(width: 200, child: Text('Will Fetch')),
      ],
    );
  }
}
