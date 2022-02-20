import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:workify/components/button.dart';
import 'package:workify/utils/constants.dart';
import 'package:workify/utils/extensions.dart';
import 'package:workify/utils/theme.dart';

class DailyAttendanceModel {
  String inTime;
  List<String> outTime = [""];
  DailyAttendanceModel({
    this.inTime = "",
  });
}

class AttendanceCard extends StatefulWidget {
  const AttendanceCard({Key? key}) : super(key: key);
  @override
  State<AttendanceCard> createState() => _AttendanceCardState();
}

class _AttendanceCardState extends State<AttendanceCard> {
  // bool _ispressed = false;
  // void _callback() {
  //   setState(() {
  //     _ispressed = true;
  //   });
  // }
  bool _isdiabled = true;
  final daily = DailyAttendanceModel().obs;

  void newintime() {
    daily.update((daily) {
      daily!.inTime = DateTime.now().hour.toString() +
          ":" +
          DateTime.now().minute.toString();
    });
  }

  void newouttime() {
    daily.update((daily) {
      daily!.outTime.last = DateTime.now().hour.toString() +
          ":" +
          DateTime.now().minute.toString();
    });
  }

  @override
  void initState() {
    _isdiabled = false;
  }

  void _dis() {
    setState(() {
      _isdiabled = true;
      newintime();
    });
  }

  Widget build(BuildContext context) {
    Color accentColor =
        MyTheme().isDark(context) ? kDividerColor : Colors.black87;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(90.0)),
                    ),
                    // foregroundColor: getColor(Colors.black, Colors.grey),
                    // backgroundColor: getColor(kSecondaryColor, Colors.red),
                  ),
                  onPressed: _isdiabled ? null : _dis,
                  // _ispressed == false ? _callback : null,
                  child: SvgPicture.asset(
                    "assets/icons/punch_in.svg",
                    height: 70,
                    color: accentColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Punch IN Time'),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Obx(
                      () => Text(daily.value.inTime),
                    )),
              ],
            ),
            Column(
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(90.0)))),
                  onPressed: _isdiabled ? newouttime : null,
                  child: SvgPicture.asset(
                    "assets/icons/punch_out.svg",
                    height: 70,
                    color: accentColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Punch OUT Time'),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Obx(
                      () => Text(daily.value.outTime.last),
                    )),
              ],
            ),
          ],
        ),

        // SizedBox(
        //   height: 19,
        // ),
        Spacer(),
        Button(
          buttonTextWidget: Text('ATTENDANCE STATUS'),
          onPressed: (){},
        ),
        
      ],
    );
  }
}
