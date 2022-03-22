import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:workify/components/top_bar.dart';
import 'package:workify/screens/AttendancePage/AttendanceShiftController.dart';
import 'package:workify/utils/constants.dart';
import 'package:workify/utils/generators.dart';
import 'package:workify/utils/responsive.dart';
import '../../utils/sizes.dart';
import 'package:responsive_ui/responsive_ui.dart';

// List<Map> _data = [
//   {
//     'date': '24 Feb 2022',
//     'shift': 'Day(9 to 6)(O)',
//     'exceptedin': '09:00',
//     'actualin': '09:00',
//     'exceptedout': '18:00',
//     'actualout': '18:00',
//     'workhours': '09:00',
//     'status': 'P',
//   },
//   {
//     'date': '23 Feb 2022',
//     'shift': 'Day(9 to 6)(O)',
//     'exceptedin': '09:00',
//     'actualin': '09:00',
//     'exceptedout': '18:00',
//     'actualout': '18:00',
//     'workhours': '09:00',
//     'status': 'P',
//   },
//   {
//     'date': '22 Feb 2022',
//     'shift': 'Day(9 to 6)(O)',
//     'exceptedin': '09:00',
//     'actualin': '09:00',
//     'exceptedout': '18:00',
//     'actualout': '18:00',
//     'workhours': '09:00',
//     'status': 'P',
//   },
//   {
//     'date': '21 Feb 2022',
//     'shift': 'Day(9 to 6)(O)',
//     'exceptedin': '09:00',
//     'actualin': '09:00',
//     'exceptedout': '18:00',
//     'actualout': '18:00',
//     'workhours': '09:00',
//     'status': 'P',
//   },
//   {
//     'date': '20 Feb 2022',
//     'shift': 'Day(9 to 6)(O)',
//     'exceptedin': '09:00',
//     'actualin': '09:00',
//     'exceptedout': '18:00',
//     'actualout': '18:00',
//     'workhours': '09:00',
//     'status': 'P',
//   },
//   {
//     'date': '19 Feb 2022',
//     'shift': 'Day(9 to 6)(O)',
//     'exceptedin': '09:00',
//     'actualin': '09:00',
//     'exceptedout': '18:00',
//     'actualout': '18:00',
//     'workhours': '09:00',
//     'status': 'P',
//   },
//   {
//     'date': '18 Feb 2022',
//     'shift': 'Day(9 to 6)(O)',
//     'exceptedin': '09:00',
//     'actualin': '09:00',
//     'exceptedout': '18:00',
//     'actualout': '18:00',
//     'workhours': '09:00',
//     'status': 'P',
//   },
//   {
//     'date': '17 Feb 2022',
//     'shift': 'Day(9 to 6)(O)',
//     'exceptedin': '09:00',
//     'actualin': '09:00',
//     'exceptedout': '18:00',
//     'actualout': '18:00',
//     'workhours': '09:00',
//     'status': 'P',
//   },
// ];

class AttendancePage extends GetView<AttendanceShiftController> {
  @override
  Widget build(BuildContext context) {
    var present = 0;
    var absent = 0;
    var halfdays = 0;
    var misspunchout = 0;
    var weeklyoff = 0;
    var holiday = 0;
    var halfdayLeave = 0;
    var hourlyLeave = 0;
    var suspended = 0;
    Color primaryColor = Theme.of(context).scaffoldBackgroundColor;
    Color secondaryColor = Theme.of(context).textSelectionColor;
    final _scrollcontroller = ScrollController();
    DeviceSize device = DeviceSize();
    device.size = MediaQuery.of(context).size;
    return Obx(() {
      if (controller.attendanceshiftList == null) {
        return Text('Loading...');
      } else {
        return Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(bannerHeight),
              child: generateTopBar(
                title: "My Attendance",
              )),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(
                50, kDefaultPadding, 50, kDefaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Scrollbar(
                    controller: _scrollcontroller,
                    isAlwaysShown: true,
                    child: SingleChildScrollView(
                      physics: ScrollPhysics(),
                      controller: _scrollcontroller,
                      //controller: ScrollController(debugLabel: "Attendance"),
                      child: DataTable(
                        columns: [
                          DataColumn(
                              label: Expanded(
                            child: Text(
                              'Date',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(color: secondaryColor),
                            ),
                          )),
                          DataColumn(
                              label: Expanded(
                            child: Text(
                              'Shift',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(color: secondaryColor),
                            ),
                          )),
                          DataColumn(
                              label: Expanded(
                            child: Text(
                              'Expected-in',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(color: secondaryColor),
                            ),
                          )),
                          DataColumn(
                              label: Expanded(
                            child: Text(
                              'Actual-in',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(color: secondaryColor),
                            ),
                          )),
                          DataColumn(
                              label: Expanded(
                            child: Text(
                              'Expected-out',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(color: secondaryColor),
                            ),
                          )),
                          DataColumn(
                              label: Expanded(
                            child: Text(
                              'Actual-out',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(color: secondaryColor),
                            ),
                          )),
                          DataColumn(
                              label: Expanded(
                            child: Text(
                              'Work Hours',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(color: secondaryColor),
                            ),
                          )),
                          DataColumn(
                              label: Expanded(
                            child: Text(
                              'Status',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(color: secondaryColor),
                            ),
                          )),
                        ],
                        rows: List.generate(
                            controller.attendanceshiftList.length, (index) {
                          DateTime dateTime = DateTime.parse(controller
                              .attendanceshiftList[index].date
                              .toString());
                          String dateformat =
                              DateFormat("dd MMM yyyy").format(dateTime);
                          //final a = controller.attendanceshiftList[index].date
                          //    .toString();
                          final a = dateformat;
                          final b = controller.attendanceshiftList[index].shift
                              .toString();
                          final c = controller
                              .attendanceshiftList[index].expectedIn
                              .toString();
                          final d = controller
                              .attendanceshiftList[index].actualIn
                              .toString();
                          final e = controller
                              .attendanceshiftList[index].expectedOut
                              .toString();
                          final f = controller
                              .attendanceshiftList[index].actualOut
                              .toString();
                          final g = controller
                              .attendanceshiftList[index].workHours
                              .toString();
                          final h = controller.attendanceshiftList[index].status
                              .toString();

                          if (controller.attendanceshiftList[index].status ==
                              'P') present = present + 1;
                          if (controller.attendanceshiftList[index].status ==
                              'A') absent = absent + 1;
                          if (controller.attendanceshiftList[index].status ==
                              'HD') halfdays = halfdays + 1;
                          if (controller.attendanceshiftList[index].status ==
                              'MIS') misspunchout = misspunchout + 1;
                          if (controller.attendanceshiftList[index].status ==
                              'WO') weeklyoff = weeklyoff + 1;
                          if (controller.attendanceshiftList[index].status ==
                              'holiday') holiday = holiday + 1;
                          if (controller.attendanceshiftList[index].status ==
                              'halfdayLeave') halfdayLeave = halfdayLeave + 1;
                          if (controller.attendanceshiftList[index].status ==
                              'hourlyLeave') hourlyLeave = hourlyLeave + 1;
                          if (controller.attendanceshiftList[index].status ==
                              'suspended') suspended = suspended + 1;

                          return DataRow(cells: [
                            DataCell(Center(child: Text(a))),
                            DataCell(Center(child: Text(b))),
                            DataCell(Center(child: Text(c))),
                            DataCell(Center(child: Text(d))),
                            DataCell(Center(child: Text(e))),
                            DataCell(Center(child: Text(f))),
                            DataCell(Center(child: Text(g))),
                            DataCell(Center(child: Text(h))),
                          ]);
                        }),
                        dividerThickness: 2,
                        dataRowHeight: 40,
                        showBottomBorder: true,
                        headingTextStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Responsive(
                      // crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Div(
                          colM: 3,
                          child: Card(
                            elevation: 0,

                            // shape: RoundedRectangleBorder(
                            //     side: BorderSide(
                            //         color: Theme.of(context).scaffoldBackgroundColor,
                            //         width: 0.1),
                            //     borderRadius: BorderRadius.circular(10)),
                            // margin: EdgeInsets.all(20),
                            color: Theme.of(context).scaffoldBackgroundColor,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'My Attendance Status -',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(),
                                    Row(
                                      children: [
                                        Text(
                                          'Present Days: ',
                                          style: TextStyle(
                                            // fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Text(
                                          present.toString(),
                                          style: TextStyle(
                                            fontSize: 15.8,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Absent Days: ',
                                          style: TextStyle(
                                            //  fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Text(
                                          absent.toString(),
                                          style: TextStyle(
                                            fontSize: 15.8,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Half Days: ',
                                          style: TextStyle(
                                            //  fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Text(
                                          halfdays.toString(),
                                          style: TextStyle(
                                            fontSize: 15.8,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Miss Punch Out: ',
                                          style: TextStyle(
                                            //  fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Text(
                                          misspunchout.toString(),
                                          style: TextStyle(
                                            fontSize: 15.8,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Weekly-Off: ',
                                          style: TextStyle(
                                            // fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Text(
                                          weeklyoff.toString(),
                                          style: TextStyle(
                                            fontSize: 15.8,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Holiday: ',
                                          style: TextStyle(
                                            // fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Text(
                                          holiday.toString(),
                                          style: TextStyle(
                                            fontSize: 15.8,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Half Day Leave: ',
                                          style: TextStyle(
                                            // fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Text(
                                          halfdayLeave.toString(),
                                          style: TextStyle(
                                            fontSize: 15.8,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Hourly Leave: ',
                                          style: TextStyle(
                                            //fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Text(
                                          hourlyLeave.toString(),
                                          style: TextStyle(
                                            fontSize: 15.8,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Suspended Days: ',
                                          style: TextStyle(
                                            //fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Text(
                                          suspended.toString(),
                                          style: TextStyle(
                                            fontSize: 15.8,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                            ),
                          ),
                        ),
                        Div(
                          colL: 4,
                          child: Padding(padding: const EdgeInsets.all(8)),
                        ),
                        Div(
                          colM: 3,
                          child: Card(
                            elevation: 0,
                            color: Theme.of(context).scaffoldBackgroundColor,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                  //mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Abbreviation-',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(),
                                    Row(
                                      children: [
                                        Text('Present:'),
                                        Text("P"),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text('Absent:'),
                                        Text("A"),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text('Half Day:'),
                                        Text("HD"),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text('Miss Punch Out:'),
                                        Text("MIS"),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text('Weekly Off:'),
                                        Text("WO"),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text('Holiday:'),
                                        Text("H"),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text('Leave:'),
                                        Text("L"),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text('HalfDay Leave:'),
                                        Text("HDL"),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text('Late Arrival:'),
                                        Text("LA"),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text('Early Exit:'),
                                        Text("EE"),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text('Hourly Leave:'),
                                        Text("RR"),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text('Late Arrival:'),
                                        Text("LA"),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text('Reinstate:'),
                                        Text("RI"),
                                      ],
                                    ),
                                    // Row(
                                    //   children: [
                                    //     Text('Absent afterLWD:'),
                                    //     Text("A-LWD"),
                                    //   ],
                                    // ),
                                    Row(
                                      children: [
                                        Text('Not Availabvle:'),
                                        Text("NA"),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text('Suspended:'),
                                        Text("SP"),
                                      ],
                                    ),
                                  ]),
                            ),
                          ),
                        )
                      ]),
                )
              ],
            ),
          ),
        );
      }
    });
  }
}

// Widget attendanceTable() {
//   final _scrollcontroller = ScrollController();
//   return Expanded(
//     child: Scrollbar(
//       controller: _scrollcontroller,
//       isAlwaysShown: true,
//       child: SingleChildScrollView(
//         physics: ScrollPhysics(),
//         controller: _scrollcontroller,
//         //controller: ScrollController(debugLabel: "Attendance"),
//         child: DataTable(
//           columns: _columns(),
//           rows: _rows(),
//           dividerThickness: 2,
//           dataRowHeight: 40,
//           showBottomBorder: true,
//           headingTextStyle:
//               TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//         ),
//       ),
//     ),
//   );
// }

// List<DataColumn> _columns() {
//   return [
//     DataColumn(
//         label: Expanded(
//       child: Text('Date', textAlign: TextAlign.center),
//     )),
//     DataColumn(
//         label: Expanded(
//       child: Text('Shift', textAlign: TextAlign.center),
//     )),
//     DataColumn(
//         label: Expanded(
//       child: Text('Expected-in', textAlign: TextAlign.center),
//     )),
//     DataColumn(
//         label: Expanded(
//       child: Text('Actual-in', textAlign: TextAlign.center),
//     )),
//     DataColumn(
//         label: Expanded(
//       child: Text('Expected-out', textAlign: TextAlign.center),
//     )),
//     DataColumn(
//         label: Expanded(
//       child: Text('Actual-out', textAlign: TextAlign.center),
//     )),
//     DataColumn(
//         label: Expanded(
//       child: Text('Work Hours', textAlign: TextAlign.center),
//     )),
//     DataColumn(
//         label: Expanded(
//       child: Text('Status', textAlign: TextAlign.center),
//     )),
//   ];
// }

// List<DataRow> _rows() {
//   return _data
//       .map((data) => DataRow(cells: [
//             DataCell(Center(child: Text(data['date']))),
//             DataCell(Center(child: Text(data['shift']))),
//             DataCell(Center(child: Text(data['exceptedin']))),
//             DataCell(Center(child: Text(data['actualin']))),
//             DataCell(Center(child: Text(data['exceptedout']))),
//             DataCell(Center(child: Text(data['actualout']))),
//             DataCell(Center(child: Text(data['workhours']))),
//             DataCell(Center(child: Text(data['status']))),
//           ]))
//       .toList();
// }
