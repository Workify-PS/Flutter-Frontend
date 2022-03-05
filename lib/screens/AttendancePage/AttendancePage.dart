import 'package:flutter/material.dart';
import 'package:workify/components/top_bar.dart';
import 'package:workify/utils/constants.dart';
import 'package:workify/utils/generators.dart';
import 'package:workify/utils/responsive.dart';
import '../../utils/sizes.dart';
import 'package:responsive_ui/responsive_ui.dart';

List<Map> _data = [
  {
    'date': '24 Feb 2022',
    'shift': 'Day(9 to 6)(O)',
    'exceptedin': '09:00',
    'actualin': '09:00',
    'exceptedout': '18:00',
    'actualout': '18:00',
    'workhours': '09:00',
    'status': 'P',
  },
  {
    'date': '23 Feb 2022',
    'shift': 'Day(9 to 6)(O)',
    'exceptedin': '09:00',
    'actualin': '09:00',
    'exceptedout': '18:00',
    'actualout': '18:00',
    'workhours': '09:00',
    'status': 'P',
  },
  {
    'date': '22 Feb 2022',
    'shift': 'Day(9 to 6)(O)',
    'exceptedin': '09:00',
    'actualin': '09:00',
    'exceptedout': '18:00',
    'actualout': '18:00',
    'workhours': '09:00',
    'status': 'P',
  },
  {
    'date': '21 Feb 2022',
    'shift': 'Day(9 to 6)(O)',
    'exceptedin': '09:00',
    'actualin': '09:00',
    'exceptedout': '18:00',
    'actualout': '18:00',
    'workhours': '09:00',
    'status': 'P',
  },
  {
    'date': '20 Feb 2022',
    'shift': 'Day(9 to 6)(O)',
    'exceptedin': '09:00',
    'actualin': '09:00',
    'exceptedout': '18:00',
    'actualout': '18:00',
    'workhours': '09:00',
    'status': 'P',
  },
  {
    'date': '19 Feb 2022',
    'shift': 'Day(9 to 6)(O)',
    'exceptedin': '09:00',
    'actualin': '09:00',
    'exceptedout': '18:00',
    'actualout': '18:00',
    'workhours': '09:00',
    'status': 'P',
  },
  {
    'date': '18 Feb 2022',
    'shift': 'Day(9 to 6)(O)',
    'exceptedin': '09:00',
    'actualin': '09:00',
    'exceptedout': '18:00',
    'actualout': '18:00',
    'workhours': '09:00',
    'status': 'P',
  },
  {
    'date': '17 Feb 2022',
    'shift': 'Day(9 to 6)(O)',
    'exceptedin': '09:00',
    'actualin': '09:00',
    'exceptedout': '18:00',
    'actualout': '18:00',
    'workhours': '09:00',
    'status': 'P',
  },
];

class AttendancePage extends StatefulWidget {
  const AttendancePage({Key? key}) : super(key: key);

  @override
  _AttendancePageState createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  @override
  Widget build(BuildContext context) {
    DeviceSize device = DeviceSize();
    device.size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(bannerHeight),
          child: generateTopBar(
            title: "My Attendance",
          )),
      body: Padding(
        padding:
            const EdgeInsets.fromLTRB(50, kDefaultPadding, 50, kDefaultPadding),
        child: Scrollbar(
          isAlwaysShown: true,
          showTrackOnHover: true,
          child: Responsivescreen(
            mobile: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 170,
                  width: 150,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: DataTable(
                      columns: _columns(),
                      rows: _rows(),
                      columnSpacing:
                          (MediaQuery.of(context).size.width / 10) * 0.5,
                      dividerThickness: 2,
                      border: TableBorder.all(),
                      dataRowHeight: 40,
                      showBottomBorder: true,
                      headingTextStyle:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(height: 100),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Present Days: ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                    Text("3",
                        style: TextStyle(
                          fontSize: 20,
                        )),
                    SizedBox(
                      width: kDefaultPadding,
                    ),
                    Text("Absent Days: ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                    Text("3",
                        style: TextStyle(
                          fontSize: 20,
                        )),
                    SizedBox(
                      width: kDefaultPadding,
                    ),
                    Text("Half Days: ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                    Text("3",
                        style: TextStyle(
                          fontSize: 20,
                        )),
                    SizedBox(
                      width: kDefaultPadding,
                    ),
                    Text("Miss Punch Out: ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                    Text("3",
                        style: TextStyle(
                          fontSize: 20,
                        )),
                    SizedBox(
                      width: kDefaultPadding,
                    ),
                    Text("Non-Hourly Leave: ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                    Text("3",
                        style: TextStyle(
                          fontSize: 20,
                        )),
                    SizedBox(
                      width: kDefaultPadding,
                    ),
                    Text("Holiday: ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                    Text("3",
                        style: TextStyle(
                          fontSize: 20,
                        )),
                    SizedBox(
                      width: kDefaultPadding,
                    ),
                    Text("Half Day Leave: ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                    Text("3",
                        style: TextStyle(
                          fontSize: 20,
                        )),
                    SizedBox(
                      width: kDefaultPadding,
                    ),
                    Text("Hourly Leave: ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                    Text("3",
                        style: TextStyle(
                          fontSize: 20,
                        )),
                    SizedBox(
                      width: kDefaultPadding,
                    ),
                    Text("Suspended Days: ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                    Text("3",
                        style: TextStyle(
                          fontSize: 20,
                        )),
                  ],
                ),
                SizedBox(
                  height: kDefaultPadding,
                ),
                Divider(
                  height: 2,
                ),
                SizedBox(
                  height: kDefaultPadding,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Present: P"),
                    SizedBox(),
                    Text("Absent: A"),
                    SizedBox(),
                    Text("Half Day: HD"),
                    SizedBox(),
                    Text("Weekly Off: WO"),
                    SizedBox(),
                    Text("Holiday: H"),
                    SizedBox(),
                    Text("Leave: L"),
                    SizedBox(),
                    Text("HalfDay Leave: HDL"),
                    SizedBox(
                      width: kDefaultPadding,
                    ),
                    Text("Late Arrival: LA"),
                    SizedBox(),
                    Text("Early Exit: EE"),
                    SizedBox(),
                    Text("Hour Leave: RR"),
                    SizedBox(),
                    Text("Reinstate: RI"),
                    SizedBox(),
                    Text("Absent after LWD: A-LWD"),
                    SizedBox(),
                    Text("Not Available: NA"),
                    SizedBox(),
                    Text("Suspended: SP"),
                    SizedBox(),
                    Text("Present: P"),
                    SizedBox(),
                  ],
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DataTable(
                  columns: _columns(),
                  rows: _rows(),
                  columnSpacing: (MediaQuery.of(context).size.width / 20) * 0.5,
                  //border: TableBorder.all(),
                  dividerThickness: 2,
                  dataRowHeight: 40,
                  showBottomBorder: true,
                  headingTextStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 100),
                Spacer(),
                FittedBox(
                  fit: BoxFit.contain,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Present Days: ",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                      Text("3",
                          style: TextStyle(
                            fontSize: 20,
                          )),
                      SizedBox(
                        width: kDefaultPadding,
                      ),
                      Text("Absent Days: ",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                      Text("3",
                          style: TextStyle(
                            fontSize: 20,
                          )),
                      SizedBox(
                        width: kDefaultPadding,
                      ),
                      Text("Half Days: ",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                      Text("3",
                          style: TextStyle(
                            fontSize: 20,
                          )),
                      SizedBox(
                        width: kDefaultPadding,
                      ),
                      Text("Miss Punch Out: ",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                      Text("3",
                          style: TextStyle(
                            fontSize: 20,
                          )),
                      SizedBox(
                        width: kDefaultPadding,
                      ),
                      Text("Non-Hourly Leave: ",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                      Text("3",
                          style: TextStyle(
                            fontSize: 20,
                          )),
                      SizedBox(
                        width: kDefaultPadding,
                      ),
                      Text("Holiday: ",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                      Text("3",
                          style: TextStyle(
                            fontSize: 20,
                          )),
                      SizedBox(
                        width: kDefaultPadding,
                      ),
                      Text("Half Day Leave: ",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                      Text("3",
                          style: TextStyle(
                            fontSize: 20,
                          )),
                      SizedBox(
                        width: kDefaultPadding,
                      ),
                      Text("Hourly Leave: ",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                      Text("3",
                          style: TextStyle(
                            fontSize: 20,
                          )),
                      SizedBox(
                        width: kDefaultPadding,
                      ),
                      Text("Suspended Days: ",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                      Text("3",
                          style: TextStyle(
                            fontSize: 20,
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: kDefaultPadding,
                ),
                Divider(
                  height: 2,
                ),
                SizedBox(
                  height: kDefaultPadding,
                ),
                FittedBox(
                  fit: BoxFit.contain,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Present: P"),
                      SizedBox(),
                      Text("Absent: A"),
                      SizedBox(),
                      Text("Half Day: HD"),
                      SizedBox(),
                      Text("Weekly Off: WO"),
                      SizedBox(),
                      Text("Holiday: H"),
                      SizedBox(),
                      Text("Leave: L"),
                      SizedBox(),
                      Text("HalfDay Leave: HDL"),
                      SizedBox(
                        width: kDefaultPadding,
                      ),
                      Text("Late Arrival: LA"),
                      SizedBox(),
                      Text("Early Exit: EE"),
                      SizedBox(),
                      Text("Hour Leave: RR"),
                      SizedBox(),
                      Text("Reinstate: RI"),
                      SizedBox(),
                      Text("Absent after LWD: A-LWD"),
                      SizedBox(),
                      Text("Not Available: NA"),
                      SizedBox(),
                      Text("Suspended: SP"),
                      SizedBox(),
                      Text("Present: P"),
                      SizedBox(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// DataTable _AttendanceTable() {
//   return DataTable(
//     columns: _columns(),
//     rows: _rows(),
//     //columnSpacing: (MediaQuery.of(context).size.width / 10) * 0.5,
//     dividerThickness: 2,
//     dataRowHeight: 40,
//     showBottomBorder: true,
//     headingTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//   );
// }

List<DataColumn> _columns() {
  return [
    DataColumn(
        label: Expanded(
      child: Text('Date', textAlign: TextAlign.center),
    )),
    DataColumn(
        label: Expanded(
      child: Text('Shift', textAlign: TextAlign.center),
    )),
    DataColumn(
        label: Expanded(
      child: Text('Expected-in', textAlign: TextAlign.center),
    )),
    DataColumn(
        label: Expanded(
      child: Text('Actual-in', textAlign: TextAlign.center),
    )),
    DataColumn(
        label: Expanded(
      child: Text('Expected-out', textAlign: TextAlign.center),
    )),
    DataColumn(
        label: Expanded(
      child: Text('Actual-out', textAlign: TextAlign.center),
    )),
    DataColumn(
        label: Expanded(
      child: Text('Work Hours', textAlign: TextAlign.center),
    )),
    DataColumn(
        label: Expanded(
      child: Text('Status', textAlign: TextAlign.center),
    )),
  ];
}

List<DataRow> _rows() {
  return _data
      .map((data) => DataRow(cells: [
            DataCell(Center(child: Text(data['date']))),
            DataCell(Center(child: Text(data['shift']))),
            DataCell(Center(child: Text(data['exceptedin']))),
            DataCell(Center(child: Text(data['actualin']))),
            DataCell(Center(child: Text(data['exceptedout']))),
            DataCell(Center(child: Text(data['actualout']))),
            DataCell(Center(child: Text(data['workhours']))),
            DataCell(Center(child: Text(data['status']))),
          ]))
      .toList();
}
