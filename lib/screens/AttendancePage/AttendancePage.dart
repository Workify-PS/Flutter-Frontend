import 'package:flutter/material.dart';
import 'package:workify/utils/constants.dart';

import '../../utils/sizes.dart';

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
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(right: 1400),
          child: Text('My Attendance Details :',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: kSecondaryColor)),
        ),
        backgroundColor: kPrimaryColor,
      ),
      body: Padding(
        padding:
            const EdgeInsets.fromLTRB(50, kDefaultPadding, 50, kDefaultPadding),
        child: Scrollbar(
          isAlwaysShown: true,
          showTrackOnHover: true,
          child: ListView(
            children: [
              _AttendanceTable(),
              SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Present Days: " + "3"),
                  SizedBox(
                    width: kDefaultPadding,
                  ),
                  Text("Absent Days: " + "3"),
                  SizedBox(
                    width: kDefaultPadding,
                  ),
                  Text("Half Days: " + "3"),
                  SizedBox(
                    width: kDefaultPadding,
                  ),
                  Text("Miss Punch Out: " + "3"),
                  SizedBox(
                    width: kDefaultPadding,
                  ),
                  Text("Non-Hourly Leave: " + "3"),
                  SizedBox(
                    width: kDefaultPadding,
                  ),
                  Text("Holiday: " + "3"),
                  SizedBox(
                    width: kDefaultPadding,
                  ),
                  Text("Half Day Leave: " + "3"),
                  SizedBox(
                    width: kDefaultPadding,
                  ),
                  Text("Hourly Leave: " + "3"),
                  SizedBox(
                    width: kDefaultPadding,
                  ),
                  Text("Suspended Days: " + "3"),
                ],
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Present: P"),
                  SizedBox(
                    width: kDefaultPadding,
                  ),
                  Text("Absent: A"),
                  SizedBox(
                    width: kDefaultPadding,
                  ),
                  Text("Half Day: HD"),
                  SizedBox(
                    width: kDefaultPadding,
                  ),
                  Text("Weekly Off: WO"),
                  SizedBox(
                    width: kDefaultPadding,
                  ),
                  Text("Holiday: H"),
                  SizedBox(
                    width: kDefaultPadding,
                  ),
                  Text("Leave: L"),
                  SizedBox(
                    width: kDefaultPadding,
                  ),
                  Text("HalfDay Leave: HDL"),
                  SizedBox(
                    width: kDefaultPadding,
                  ),
                  Text("Late Arrival: LA"),
                  SizedBox(
                    width: kDefaultPadding,
                  ),
                  Text("Early Exit: EE"),
                  SizedBox(
                    width: kDefaultPadding,
                  ),
                  Text("Hour Leave: RR"),
                  SizedBox(
                    width: kDefaultPadding,
                  ),
                  Text("Reinstate: RI"),
                  SizedBox(
                    width: kDefaultPadding,
                  ),
                  Text("Absent after LWD: A-LWD"),
                  SizedBox(
                    width: kDefaultPadding,
                  ),
                  Text("Not Available: NA"),
                  SizedBox(
                    width: kDefaultPadding,
                  ),
                  Text("Suspended: SP"),
                  SizedBox(
                    width: kDefaultPadding,
                  ),
                  Text("Present: P"),
                  SizedBox(
                    width: kDefaultPadding,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

DataTable _AttendanceTable() {
  return DataTable(
    columns: _columns(),
    rows: _rows(),
    dividerThickness: 2,
    dataRowHeight: 32,
    showBottomBorder: true,
    headingTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
  );
}

List<DataColumn> _columns() {
  return [
    DataColumn(
        label: Text(
      'Date',
    )),
    DataColumn(
        label: Text(
      'Shift',
    )),
    DataColumn(
        label: Text(
      'Expected-in',
    )),
    DataColumn(
        label: Text(
      'Actual-in',
    )),
    DataColumn(
        label: Text(
      'Expected-out',
    )),
    DataColumn(
        label: Text(
      'Actual-out',
    )),
    DataColumn(
        label: Text(
      'Work Hours',
    )),
    DataColumn(
        label: Text(
      'Status',
    )),
  ];
}

List<DataRow> _rows() {
  return _data
      .map((data) => DataRow(cells: [
            DataCell(Text(data['date'])),
            DataCell(Text(data['shift'])),
            DataCell(Text(data['exceptedin'])),
            DataCell(Text(data['actualin'])),
            DataCell(Text(data['exceptedout'])),
            DataCell(Text(data['actualout'])),
            DataCell(Text(data['workhours'])),
            DataCell(Text(data['status'])),
          ]))
      .toList();
}
